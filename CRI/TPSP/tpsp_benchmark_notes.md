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

## 五之二、优化：加 `RING_REDUCE_SCATTER_UNPERMUTE_PULL_MAX_WG=64` 后复测

在上面所有命令前统一加环境变量 `RING_REDUCE_SCATTER_UNPERMUTE_PULL_MAX_WG=64`（限制
pull 模式 reduce_scatter+unpermute 的 work-group 数）重跑，其它参数不变
（FUSION_RING_COMBINE=pull，tp=2，真实 shape）。mxfp8 口径为 w8a8（GEMM/MoE 都 mxfp8）。

### 配置1：mxfp8 / w8a8（GEMM 和 MoE 都 mxfp8）

| 算子 | 融合(Symm) | 非融合(Fallback) | 融合 vs 非融合 |
|---|---|---|---|
| AG+GEMM (qkv) | 0.601 | 0.672 | 融合快 11% ✅ |
| GEMM+RS (o_proj) | 0.632 | 0.781 | 融合快 19% ✅ |
| MoE dispatch (fp8) | 0.146 | 0.237 | 融合快 38% ✅ |
| **MoE combine (bf16)** | **0.328** | 0.356 | **融合快 8% ✅（已转正）** |

### 配置2：bf16

| 算子 | 融合(Symm) | 非融合(Fallback) | 融合 vs 非融合 |
|---|---|---|---|
| AG+GEMM (qkv) | 0.346 | 0.460 | 融合快 25% ✅ |
| GEMM+RS (o_proj) | 0.464 | 0.605 | 融合快 23% ✅ |
| MoE dispatch (bf16) | 0.242 | 0.458 | 融合快 47% ✅ |
| **MoE combine (bf16)** | **0.322** | 0.359 | **融合快 10% ✅（已转正）** |

### MoE combine 对比（128MB，前后）

| MoE combine | 原值（无此变量） | 加 WG=64 后 |
|---|---|---|
| 配置1 (mxfp8) | 0.509 ❌ 慢 ~40% | **0.328 ✅ 快 8%** |
| 配置2 (bf16)  | 0.503 ❌ 慢 40%  | **0.322 ✅ 快 10%** |

**结论：`RING_REDUCE_SCATTER_UNPERMUTE_PULL_MAX_WG=64` 把 combine 融合从 ~0.50ms 降到
~0.32ms（提速约 36%），从「比 fallback 慢 40%」翻转为「比 fallback 快 8~10%」，
消除了 combine 劣化。** dispatch 和 linear 算子不受影响，仍全是正收益。

---

## 五之三、TP=4 复测（同样加 `RING_REDUCE_SCATTER_UNPERMUTE_PULL_MAX_WG=64`）

mpirun `-n 4`。全局 4096 token，tp=4 切分后真实 shape：
- AG+GEMM (qkv)：M=每卡token=1024，N=qkv输出每卡=5120/4=1280，K=hidden=2048
- GEMM+RS (o_proj)：M=全局token=4096，N=hidden=2048，K=attn输出每卡=4096/4=1024
- MoE：SYMM_TOKENS_PER_RANK=4096/4=1024

命令（mxfp8 示例，bf16 去掉 scale_mode / 换非 v2 test，MoE 加 SYMM_DTYPE=bfloat16）：
```bash
mpirun --allow-run-as-root -n 4 env RING_REDUCE_SCATTER_UNPERMUTE_PULL_MAX_WG=64 \
  python -u tests/test_allgather_scaled_matmul_v2.py 1024 1280 2048 --scale_mode mxfp8-sharded
mpirun --allow-run-as-root -n 4 env RING_REDUCE_SCATTER_UNPERMUTE_PULL_MAX_WG=64 \
  python -u tests/test_fused_scaled_matmul_v2_reducescatter.py 4096 2048 1024 --scale_mode mxfp8
mpirun --allow-run-as-root -n 4 env RING_REDUCE_SCATTER_UNPERMUTE_PULL_MAX_WG=64 \
  FUSION_RING_COMBINE=pull SYMM_TOKENS_PER_RANK=1024 SYMM_HIDDEN_SIZE=2048 \
  SYMM_TOPK=8 SYMM_NUM_EXPERTS=128 python -u tests/test_symm_buffer_fusion_perf.py
```

### 配置1：mxfp8 / w8a8

| 算子 | shape | 融合(Symm) | 非融合(Fallback) | 融合 vs 非融合 |
|---|---|---|---|---|
| AG+GEMM (qkv) | M1024 N1280 K2048 | 1.362 | 1.120 | **融合慢 22% ❌** |
| GEMM+RS (o_proj) | M4096 N2048 K1024 | 0.744 | 0.938 | 融合快 21% ✅ |
| MoE dispatch (fp8) | tok1024 | 0.186 | 0.275 | 融合快 32% ✅ |
| MoE combine (bf16) | 128MB | 0.426 | 0.451 | 融合快 6% ✅ |

### 配置2：bf16

| 算子 | shape | 融合(Symm) | 非融合(Fallback) | 融合 vs 非融合 |
|---|---|---|---|---|
| AG+GEMM (qkv) | M1024 N1280 K2048 | 0.468 | 0.571 | 融合快 18% ✅ |
| GEMM+RS (o_proj) | M4096 N2048 K1024 | 0.526 | 0.902 | 融合快 42% ✅ |
| MoE dispatch (bf16) | tok1024 | 0.321 | 0.549 | 融合快 42% ✅ |
| MoE combine (bf16) | 128MB | 0.421 | 0.452 | 融合快 7% ✅ |

### TP=2 vs TP=4（mxfp8）对比

| 算子 | TP=2 mxfp8 | TP=4 mxfp8 |
|---|---|---|
| AG+GEMM (qkv) | 快 11% ✅ | **慢 22% ❌** ← 唯一翻转 |
| GEMM+RS (o_proj) | 快 19% ✅ | 快 21% ✅ |
| MoE dispatch | 快 38% ✅ | 快 32% ✅ |
| MoE combine | 快 8% ✅ | 快 6% ✅ |

**要点**：
1. **MoE combine 在 TP=4 下依然正收益**（配置1 +6%、配置2 +7%），`RING_...WG=64` 优化在 TP=4 同样有效。
2. **新劣化点：mxfp8 的 AG+GEMM(qkv) 在 TP=4 融合慢 22% ❌**（TP=2 没有）。原因：tp=4 下 qkv shape
   变小（M=1024, N=1280），GEMM 计算量不足以盖过 all_gather 融合的 symm-memory/barrier 开销，
   小 shape 下融合反而亏。注意 **bf16 的 AG+GEMM 在 TP=4 仍快 18% ✅，只有 mxfp8 劣化** ——
   推测 mxfp8 scaled-matmul 在该小 shape 下 kernel 效率更低，放大了融合开销。
3. **其余算子（GEMM+RS、MoE dispatch/combine）TP=4 两配置全是正收益。**
4. **建议**：TP=4 下对 mxfp8 的 qkv_proj 关掉 fuse-gemm-comms（或该小 shape 回退非融合 AG），
   其余照常开融合。

---

## 六、结论

1. **TPSP 变慢的元凶 = MoE combine（unpermute + reduce_scatter 融合算子）**。
   - 两种配置下，所有 fused-comm 算子的融合都是正收益（9~47%），**唯独 MoE combine 融合劣化 ~40%**。
   - combine 是最大单项（128MB expert output，~0.5ms/层 × 48层 ≈ 24ms/step），这一项的劣化足以吃掉其它所有融合收益，导致 TPSP 整体变慢。
   - **✅ 已解决：加 `RING_REDUCE_SCATTER_UNPERMUTE_PULL_MAX_WG=64` 后 combine 从 0.50→0.32ms
     转正（见第五之二节）。这是消除 combine 劣化、让 TPSP 整体转正的关键开关。**

2. **规律**：all_gather / dispatch 侧的融合都赢；reduce_scatter 侧，linear 的 GEMM+RS（小 shape）融合还赢，但 **MoE combine（大数据量 reduce_scatter + unpermute）融合劣化** —— 数据量大时融合的收益被 barrier / symm-memory 开销盖过。

3. **--enable-eager-sp-fuse-gemm-comms（控制 attn/MLP linear 的 AG+GEMM、GEMM+RS 融合）在真实 shape 下是正收益，应该开**。它不是变慢的原因。
   - 注意：用 benchmark **默认大 shape**（M=8192/K=8192）测 GEMM+RS 会得出「融合劣化」的错误结论 —— **必须用真实 shape 测**。
   - **TP=4 例外**：mxfp8 的 AG+GEMM(qkv) 在 tp=4 的小 shape（M1024 N1280）下融合劣化（慢 22%，见第五之三节）。
     tp=4 建议对 mxfp8 qkv_proj 关掉 fuse-gemm-comms，其余照常开。GEMM+RS / bf16 的 AG+GEMM 在 tp=4 仍正收益。

---

## 七、待办：模型里实测 wall time 验证

benchmark 是隔离测单算子，定位了方向（MoE combine 劣化）。**最终需在模型里实测验证**：

1. **整步 wall time 对比（最直接）**：SP=1 vs SP=0 的 `forward_device_ms`（steps.csv），确认 TPSP 整步慢多少、慢在 prefill 还是 decode。
2. **MoE combine 段 wall time**：在 model.py / deepsymm finalize 处插 torch.xpu.Event，量 combine 这段的真实墙钟，和 benchmark 对照。
   - 注意 profiling 的 per-kernel self-time 之和 **消不掉 overlap**，不能直接加总当运行时间；评估 overlap 收益必须用 wall time（Event 或 forward_device_ms）。
3. **验证优化方向**：~~试 FUSION_RING_COMBINE=push / 0(staged) 等 combine 模式~~。
   **✅ 已找到解法：`RING_REDUCE_SCATTER_UNPERMUTE_PULL_MAX_WG=64`（pull 模式下）即可让
   combine 从 0.50 降到 0.32ms、低于 fallback 0.36ms（见第五之二节）。** 下一步在模型里
   带上这个环境变量实测整步 wall time，确认 TPSP 整体从「变慢」翻转为正收益。

待补测（benchmark 侧，可选）：
- FUSION_RING_COMBINE 的 pull / push / 0 三种模式对 MoE combine 的影响扫描。
