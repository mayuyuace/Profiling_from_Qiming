# Kernel 固定开销 / 单行并行度微基准：Intel XPU vs NVIDIA

## 1. 目的

DSA cand top-k（bf16，一行 16384 个元素，每行一个 WG）在 XPU 上约 6.8 µs，NV（`topk_bf16_small_kernel`）约 3.9 µs，两边都只计 kernel 时间。想弄清这约 3 µs 的差距来自哪里：kernel 的固定开销、barrier、ALU 延迟，还是 SLM 原子。

## 2. 设备与方法

| | XPU | NV |
|---|---|---|
| 型号 | Intel Graphics 0x674f（32 个 XeCore） | NVIDIA RTX PRO 5000 72GB Blackwell（110 个 SM） |
| 程序 | `xpu_bench.cpp`（icpx） | `cuda_bench.py`（`load_inline`） |
| 计时 | SYCL event profiling（command_start..end） | torch.profiler（CUPTI 记录的 kernel 起止时间） |

- 两边都只计 kernel，取 51 次的中位数（表中数字均为中位数，单位 µs）。XPU 计时分辨率约 0.1 µs。
- 一行是 16384 个 bf16（32 KB），每行一个 WG，每个线程读取连续的 16 B 向量到寄存器（和 cand kernel 一样）。行数取 1 和 32。

| case | 内容 |
|---|---|
| empty | 每个线程写一个字 |
| read | 读一行到寄存器，异或后写出 |
| read+bar1 / bar5 | read 再加 1 个 / 5 个 WG barrier |
| read+alu | read 后每个 32 位字做 16 次有依赖的整数乘加（各个字之间互相独立） |
| read+atom | read 后每个元素做一次 SLM 原子加，地址取低字节（约均匀分布在 256 个 bin，冲突很少） |

alu 和 atom 两项在不同 WG 大小（256/512/1024）和 SG 宽度（XPU 16/32）下测，每行的总工作量不变。

## 3. 结果（1 行 / 32 行，单位 µs）

| case | WG/SG | XPU | NV |
|---|---|---|---|
| empty | 512/32 | **0.42** / 0.42 | 0.70 / 0.74 |
| read | 512/32 | **0.73** / 0.73 | 1.22 / 1.34 |
| read+bar1 | 512/32 | 0.73 / 0.83 | 1.22 / 1.34 |
| read+bar5 | 512/32 | 0.83 / 0.94 | 1.22 / 1.34 |
| read+alu | 256/32 | 0.83 / 0.83 | 1.60 / 1.66 |
| read+alu | 512/32 | 0.73 / 0.83 | 1.22 / 1.34 |
| read+alu | 1024/32 | 0.73 / 0.73 | 1.22 / 1.34 |
| read+alu | 512/16 | 0.73 / 0.73 | – |
| read+alu | 1024/16 | 0.73 / 0.73 | – |
| read+atom | 256/32 | 4.48 / 4.79 | 2.21 / 2.27 |
| read+atom | **512/32** | **3.85** / 4.06 | **1.86** / 1.92 |
| read+atom | 1024/32 | 3.33 / 3.33 | 1.66 / 1.79 |
| read+atom | 512/16 | 3.02 / 3.23 | – |
| read+atom | 1024/16 | 2.92 / 3.02 | – |

## 4. 结论

1. **XPU 的固定开销更低**：empty 0.42 vs 0.70 µs，读 32 KB 0.73 vs 1.22–1.34 µs。cand 的差距不在启动和读取上。
2. **barrier 很便宜**：XPU 的 bar5 减 bar1 约 0.1 µs，平均每个约 0.025 µs（在计时分辨率附近）；NV 测不出差别。
3. **ALU 在两边都被掩盖了**：XPU 的 read+alu 基本等于 read，WG 和 SG 的配置没有影响。在各个字之间互相独立、可以并行的情况下，"每个 EU 只有 2 个线程，延迟掩盖不住"这个问题不存在。
4. **SLM 原子是差距所在**：
   - 减去 read 之后，每行 16384 次原子：XPU 512/32 为 **3.1 µs**，NV 为 **0.64 µs**，相差约 5 倍；WG 1024 时 2.6 vs 0.45 µs。
   - 地址已经比较分散，但一条 32 lane 的消息里有两个 lane 撞同一地址的概率约 86%，16 个 sub-group 又在同样的 256 个字上竞争。只要地址有重叠，XPU 就会明显变慢（见 `slm_atomic_bench/CONCLUSIONS.md`：同地址的原子在 sub-group 内外都会串行，NV 会合并）。
   - **SG16 有帮助**：512/16 比 512/32 快 0.84 µs，1024/16 快 0.94 µs。每条消息只有 16 个 lane，撞地址的机会更少。
   - WG 变大也有帮助（256 → 1024：4.48 → 3.33 µs），NV 也是同样的趋势。

## 5. 对 cand kernel 的影响

- 剩下的约 3 µs 差距主要来自 SLM 原子：第 2 轮约 8192 个元素分布在 128–256 个低字节 bin 上（rand 数据），对应本测试的 read+atom，约 1.5 µs；另外还有第 1 轮的冷元素原子。
- 方向：
  - (a) 改成 SG16；
  - (b) 第 2 轮不做逐元素原子，改成"4 位 + 4 位"两次 16 bin 统计：在寄存器里计数，sub-group 规约后各写一份到 SLM，最后由一个 sub-group 求和。

## 6. 复现

- XPU：`bash run_xpu.sh`（在 qiming 容器里，需要先加载 oneAPI 环境）
- NV：`CUDA_VISIBLE_DEVICES=<id> bash run_cuda.sh`（需要 PyTorch CUDA 和 nvcc；当前 PyTorch 要求 `-std=c++20`）
- 原始数据：`xpu.log`、`cuda.log`
