# TPSP 通信算子性能测试记录

目标：定位「开启 TPSP（eager sequence parallel + DeepSymm）后模型反而变慢」的原因。

两套配置：
- 配置1：mxfp8 MoE/GEMM + fp8 attn
- 配置2：bf16 MoE/GEMM + bf16 attn

机器：tp=2，4×XPU，卡间走 **PCIe**（非 Xe-Link）。模型 Qwen3-30B-A3B。

---

## 一、模型真实维度（Qwen3-30B-A3B, tp=2）

| 项 | 值 |
|---|---|
| hidden_size | 2048 |
| num_attention_heads | 32 |
| num_key_value_heads | 4 |
| head_dim | 128 |
| num_experts | 128 |
| num_experts_per_tok (topk) | 8 |
| moe_intermediate_size | 768 |

tp=2 切分后的 proj 维度：
- q_size = 32×128 = 4096 → 每卡 2048
- kv_size = 4×128 = 512 → 每卡 256
- qkv 输出 = 4096+512+512 = 5120 → 每卡 2560
- attn 输出(o_proj 输入) = 4096 → 每卡 2048

prefill batch（--max-num-batched-tokens=4096）：全局 4096 token。
TPSP 下 sequence_parallel_chunk 按 **token 维(dim=0)** 切 → 每卡 2048 token。

---

## 二、TPSP 涉及的 fused-comm 算子，及对应的 deepsymm benchmark

| 算子 | 位置 | 配置1(mxfp8) kernel | 配置2(bf16) kernel | deepsymm benchmark |
|---|---|---|---|---|
| AG+GEMM (linear) | qkv_proj | fused_all_gather_scaled_matmul_v2 | fused_all_gather_matmul | test_allgather_scaled_matmul_v2.py / test_fused_allgather_matmul.py |
| GEMM+RS (linear) | o_proj | fused_scaled_matmul_v2_reduce_scatter | fused_matmul_reduce_scatter | test_fused_scaled_matmul_v2_reducescatter.py / test_fused_matmul_reducescatter.py |
| MoE dispatch (allgather+permute) | MoE | SymmBuffer.allgather_local_permute_fusion | 同 | test_symm_buffer_fusion_perf.py |
| MoE combine (unpermute+reduce_scatter) | MoE | SymmBuffer.unpermute_reducescatter_fusion | 同 | test_symm_buffer_fusion_perf.py |

说明：
- fused-comm 的 linear dtype 由 **MoE/GEMM 的量化**决定（mxfp8 vs bf16）。fp8-attention 只影响 attention 内部的 QK/V 计算，**不改变 fused-comm 算子的 dtype**。
- vllm mxfp8 用的是 **_v2** 版本的 scaled matmul（见 deep_symm.py:138-139）。
- 每个 benchmark 对比 `Symm ops`（融合，= 开 --enable-eager-sp-fuse-gemm-comms）vs `Fallback`（非融合，= 不开）。

---

## 三、运行环境 & 通用前缀

```bash
# docker 内
cd /home/gta/qiming && source uv_envs/qiming_2547/bin/activate
export no_proxy=.intel.com,intel.com,localhost,127.0.0.1,0.0.0.0
export OMPI_ALLOW_RUN_AS_ROOT=1 OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1   # docker 内是 root，mpirun 需要
cd /home/gta/qiming/deepsymm
```

mpirun 用 `--allow-run-as-root -n 2`（tp=2）。

---

## 四、测试命令（真实 shape）

### 1. linear 层 AG+GEMM（qkv_proj）：M=2048(每卡token) N=2560(qkv输出) K=2048(hidden)

M 语义 = 每卡 token（A_shard[M,K]，gather_dim=0 在 token 维 gather）。

bf16：
```bash
mpirun --allow-run-as-root -n 2 python -u tests/test_fused_allgather_matmul.py 2048 2560 2048
```

mxfp8（scale_mode=mxfp8-sharded，因为激活 scale 随 token gather）：
```bash
mpirun --allow-run-as-root -n 2 python -u tests/test_allgather_scaled_matmul_v2.py 2048 2560 2048 --scale_mode mxfp8-sharded
```

### 2. linear 层 GEMM+RS（o_proj）：M=4096(全局token) N=2048(hidden) K=2048(attn输出每卡)

M 语义 = 全局 token（A[M,K]，scatter_dim=0，RS 后 token 变 M/world_size）。

bf16：
```bash
mpirun --allow-run-as-root -n 2 python -u tests/test_fused_matmul_reducescatter.py 4096 2048 2048
```

mxfp8：
```bash
mpirun --allow-run-as-root -n 2 python -u tests/test_fused_scaled_matmul_v2_reducescatter.py 4096 2048 2048 --scale_mode mxfp8
```

### 3. MoE dispatch + combine：每卡 2048 token

SYMM_TOKENS_PER_RANK = 每卡 token（= 全局 4096 / tp2）。FUSION_RING_COMBINE=pull 对齐 vllm 实际配置。

配置1（mxfp8 → dispatch fp8、combine bf16），结果看输出里
`[Allgather + Permute Fusion — FP8 dispatch]` 和 `[Unpermute + Reduce-Scatter — BF16 combine after FP8 dispatch]`：
```bash
mpirun --allow-run-as-root -n 2 env \
  FUSION_RING_COMBINE=pull SYMM_TOKENS_PER_RANK=2048 SYMM_HIDDEN_SIZE=2048 \
  SYMM_TOPK=8 SYMM_NUM_EXPERTS=128 \
  python -u tests/test_symm_buffer_fusion_perf.py
```

配置2（bf16 dispatch + combine），加 SYMM_DTYPE=bfloat16，看
`[Allgather + Permute Fusion]` 和 `[Unpermute + Reduce-Scatter Fusion]`：
```bash
mpirun --allow-run-as-root -n 2 env \
  FUSION_RING_COMBINE=pull SYMM_TOKENS_PER_RANK=2048 SYMM_HIDDEN_SIZE=2048 \
  SYMM_TOPK=8 SYMM_NUM_EXPERTS=128 SYMM_DTYPE=bfloat16 \
  python -u tests/test_symm_buffer_fusion_perf.py
```

测法：所有 benchmark 用 torch.xpu.Event(enable_timing=True) 测 wall time，warmup 后取多次平均（输出 avg/min/max ms）。

---

## 五、测试结果（avg，单位 ms，tp=2，真实 shape）

### 配置1：mxfp8 MoE/GEMM + fp8 attn

| 算子 | 融合(Symm) | 非融合(Fallback) | 融合 vs 非融合 |
|---|---|---|---|
| AG+GEMM (qkv) | 0.567 | 0.624 | 融合快 9% ✅ |
| GEMM+RS (o_proj) | 0.610 | 0.797 | 融合快 23% ✅ |
| MoE dispatch (fp8) | 0.146 | 0.234 | 融合快 38% ✅ |
| MoE combine (bf16) | 0.509 | ~0.36* | 融合慢 ~40% ❌ |

### 配置2：bf16 MoE/GEMM + bf16 attn

| 算子 | 融合(Symm) | 非融合(Fallback) | 融合 vs 非融合 |
|---|---|---|---|
| AG+GEMM (qkv) | 0.378 | 0.462 | 融合快 18% ✅ |
| GEMM+RS (o_proj) | 0.489 | 0.661 | 融合快 26% ✅ |
| MoE dispatch (bf16) | 0.242 | 0.458 | 融合快 47% ✅ |
| MoE combine (bf16) | 0.503 | 0.359 | 融合慢 40% ❌ |

\* 配置1 combine 的 fallback 与配置2 相同（combine 输出都是 bf16，128MB）。

参考（combine 的其它实现，bf16，128MB expert output）：
- 纯 collective reduce_scatter：0.177
- ring reduce_scatter (push)：0.439
- fallback（非融合 unpermute+rs）：0.359
- SymmBuffer 融合（pull）：0.50~0.52  ← 最慢

---

## 六、结论

1. **TPSP 变慢的元凶 = MoE combine（unpermute + reduce_scatter 融合算子）**。
   - 两种配置下，所有 fused-comm 算子的融合都是正收益（9~47%），**唯独 MoE combine 融合劣化 ~40%**。
   - combine 是最大单项（128MB expert output，~0.5ms/层 × 48层 ≈ 24ms/step），这一项的劣化足以吃掉其它所有融合收益，导致 TPSP 整体变慢。

2. **规律**：all_gather / dispatch 侧的融合都赢；reduce_scatter 侧，linear 的 GEMM+RS（小 shape）融合还赢，但 **MoE combine（大数据量 reduce_scatter + unpermute）融合劣化** —— 数据量大时融合的收益被 barrier / symm-memory 开销盖过。

3. **--enable-eager-sp-fuse-gemm-comms（控制 attn/MLP linear 的 AG+GEMM、GEMM+RS 融合）在真实 shape 下是正收益，应该开**。它不是变慢的原因。
   - 注意：用 benchmark **默认大 shape**（M=8192/K=8192）测 GEMM+RS 会得出「融合劣化」的错误结论 —— **必须用真实 shape 测**。

---

## 七、待办：模型里实测 wall time 验证

benchmark 是隔离测单算子，定位了方向（MoE combine 劣化）。**最终需在模型里实测验证**：

1. **整步 wall time 对比（最直接）**：SP=1 vs SP=0 的 `forward_device_ms`（steps.csv），确认 TPSP 整步慢多少、慢在 prefill 还是 decode。
2. **MoE combine 段 wall time**：在 model.py / deepsymm finalize 处插 torch.xpu.Event，量 combine 这段的真实墙钟，和 benchmark 对照。
   - 注意 profiling 的 per-kernel self-time 之和 **消不掉 overlap**，不能直接加总当运行时间；评估 overlap 收益必须用 wall time（Event 或 forward_device_ms）。
3. **验证优化方向**：试 FUSION_RING_COMBINE=push / 0(staged) 等 combine 模式，看能否让 combine 不劣化 → TPSP 转正。combine 的 fallback（非融合）是 0.36ms，若某模式能逼近/低于它则有戏。

待补测（benchmark 侧，可选）：
- FUSION_RING_COMBINE 的 pull / push / 0 三种模式对 MoE combine 的影响扫描。
