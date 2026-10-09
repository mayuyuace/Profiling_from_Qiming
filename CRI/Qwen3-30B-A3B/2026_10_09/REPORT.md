# oneDNN benchdnn Matmul 性能测试报告（Bandwidth / MBU 版）

## 1. 测试目标

使用 oneDNN benchdnn 测量不同 **shape**、不同 **dtype** 下 matmul 的 GPU 性能，
扫描 batch 维 **M = 24 ~ 42**（逐整数，19 个取值）。

由于这些 shape 的 M 很小，matmul 属于 **memory bound**，用 Gflops（算力利用率）评估会低估/误导，
因此本版本改用 **实测带宽（GB/s）** 和 **MBU（Memory Bandwidth Utilization，带宽利用率）** 作为核心指标。

## 2. 测试配置

### 2.1 环境
- 容器 `qiming`，venv `qiming_2231`，Intel GPU（2 卡，每卡 ~152 GB），engine=gpu
- benchdnn：`.../libraries.performance.math.onednn/build/tests/benchdnn/benchdnn`
- 公共参数：`--stag=ab --wtag=ba --dtag=ab --attr-scratchpad=user --mode=P --cold-cache=all`
- 实现（所有组合）：`jit:gemm:any`

### 2.2 Shape / dtype
| 名称 | M×K : K×N (M=32) | | dtype | --dt | scales |
|------|------------------|-|-------|------|--------|
| qkv_proj | 32x2048 : 2048x5120 | | bf16 | bf16:bf16:bf16 | 无 |
| o_proj | 32x4096 : 4096x2048 | | block_fp8 | f8_e4m3:f8_e4m3:bf16 | src0 1x128 + wei 128x128 (f32) |
| gate | 32x2048 : 2048x128 | | mxfp8 | f8_e4m3:f8_e4m3:bf16 | src0 1x32 + wei 32x1 (e8m0) |

共 3×3×19 = **171** 次运行，全部成功。

## 3. 峰值带宽基准（MBU 分母）

用 `/mnt/disk1/qiming/PERF_MICROBENCH/run_L0_bw.sh`（compute-benchmarks StreamMemory，Device，512MB）实测：

| 类型 | 峰值带宽 (GB/s) |
|------|----------------|
| **Read**  | **1358.4** |
| Triad | 1099.2 |
| Write | 1032.4 |

matmul 的内存流量以**读权重 B + 读激活 A**为主导、写 C 很少，故 **MBU 以 Read 峰值 1358.4 GB/s 为分母**。

## 4. 带宽模型与 MBU 定义

对单次 matmul，内存搬运字节：

```
bytes = M*K*esize(A) + K*N*esize(B) + M*N*esize(C)
  esize: bf16=2B；fp8(e4m3)=1B(A/B)，C 输出 bf16=2B
  (fp8 的 scale 张量很小，忽略)
achieved_BW (GB/s) = bytes / time_s / 1e9
MBU (%) = achieved_BW / 1358.4 * 100
```

> 注意：fp8 把 A/B 的 element 从 2B 压到 1B，**bytes 减半**，所以即便带宽利用率(MBU)更低，
> 绝对时间仍可能更短。MBU 衡量的是"把内存子系统压榨到什么程度"，而非谁更快。

## 5. 结果（min_time，摘取 M=24 / 32 / 42；BW=实测带宽 GB/s，MBU vs Read峰值）

### qkv_proj (2048→5120)
| dtype | M=24 BW/MBU | M=32 BW/MBU | M=42 BW/MBU |
|-------|-------------|-------------|-------------|
| bf16      | 930 / **68.5%** | 931 / **68.5%** | 693 / 51.0% |
| block_fp8 | 609 / 44.8% | 607 / 44.7% | 607 / 44.7% |
| mxfp8     | 394 / 29.0% | 399 / 29.3% | 402 / 29.6% |

### o_proj (4096→2048)
| dtype | M=24 BW/MBU | M=32 BW/MBU | M=42 BW/MBU |
|-------|-------------|-------------|-------------|
| bf16      | 780 / **57.5%** | 763 / 56.2% | 576 / 42.4% |
| block_fp8 | 518 / 38.2% | 522 / 38.5% | 521 / 38.3% |
| mxfp8     | 335 / 24.7% | 336 / 24.8% | 341 / 25.1% |

### gate (2048→128)  — 极瘦，overhead bound
| dtype | M=24 BW/MBU | M=32 BW/MBU | M=42 BW/MBU |
|-------|-------------|-------------|-------------|
| bf16      | 97 / 7.2% | 100 / 7.3% | 88 / 6.5% |
| block_fp8 | 53 / 3.9% | 55 / 4.0% | 51 / 3.7% |
| mxfp8     | 48 / 3.5% | 50 / 3.7% | 47 / 3.4% |

### 各组合 MBU(min) 平均 / 峰值
| shape | bf16 avg/max | block_fp8 avg/max | mxfp8 avg/max |
|-------|--------------|-------------------|---------------|
| qkv_proj | **59.6% / 70.5%** | 44.7% / 44.9% | 29.3% / 29.6% |
| o_proj   | 49.2% / 57.6% | 38.2% / 38.5% | 24.7% / 25.1% |
| gate     | 6.9% / 8.1% | 3.8% / 4.0% | 3.4% / 3.7% |

> 完整逐 M 数据：`results/matmul_bw_mbu.csv`（含 min/avg 的 BW 与 MBU），原始时间：`results/matmul_perf.csv`。

## 6. 分析

### 6.1 核心结论：bf16 的 MBU 最高，fp8 没把省下的带宽完全兑现
改用 MBU 后结论与 Gflops 版相反：
- **bf16 带宽利用率最高**（qkv 峰值 **70.5%**，o_proj 57.6%），说明 bf16 的 jit:gemm kernel
  几乎跑满了读带宽，已接近 memory-bound 上限。
- **fp8 的 MBU 明显更低**（block_fp8 ~45%/38%，mxfp8 ~29%/25%）。fp8 把搬运字节减半，
  理论上时间应减半、MBU 维持；但实测 MBU 掉到 bf16 的 ~65%（block_fp8）甚至 ~43%（mxfp8），
  意味着 **fp8 kernel 有额外开销没打满带宽**：反量化、读 scale、以及 fp8 路径的实现效率不如 bf16 成熟。
- **这解释了 Gflops 版看到的"block_fp8 更快"**：它快只是因为搬的字节少一半，并非内存子系统更高效。
  若 fp8 kernel 能把 MBU 做到和 bf16 一样（~68%），理论上还能再快 ~1.5×。**fp8 当前有明显优化空间。**

### 6.2 mxfp8 最差
mxfp8 的 MBU 在三者中最低（qkv ~29%，o_proj ~25%）。其 scale 粒度最细
（激活 1x32、权重 32x1，e8m0 per-block），反量化/寻址开销最大，当前实现下带宽利用率不到 bf16 的一半。
**这些 shape + 小 M 下 mxfp8 不推荐。**

### 6.3 M=32→33 的 MBU 台阶（bf16 显著）
bf16 在 **M≤32 时 MBU ~68%，M≥33 骤降到 ~51%**（qkv_proj），o_proj 同样从 57%→42%：

| M | qkv bf16 MBU | qkv block_fp8 MBU |
|---|------|------|
| 32 | 68.5% | 44.7% |
| 33 | 50.9% | 44.5% |
| 42 | 51.0% | 44.7% |

原因：bf16 kernel 的 M-tile ≈ 32。M=33 起要启第二个几乎空的 tile，时间近似翻台阶而数据只多 1 行，
利用率骤降。**block_fp8 的 MBU 全程平坦（~44.7%）**，说明其 fp8 kernel 的 M-tile 更大/排布不同，对小 M 更鲁棒。

### 6.4 gate（N=128）: overhead bound，不是 memory bound
gate 的 MBU 极低（<8%），绝对时间 6–8 µs，受 kernel 启动/固定开销主导，内存子系统远未用满。
此类极瘦层无论 dtype，带宽都不是瓶颈，量化收益有限。

### 6.5 实践建议
1. **评估小 M matmul 要看 MBU 而非 Gflops**；本机 Read 峰值 1358 GB/s 是 memory-bound 上限参考。
2. **bf16 kernel 已接近带宽上限（~68%）**；想靠 fp8 提速的前提是把 fp8 kernel 的 MBU 做上去——
   当前 block_fp8 仅 ~45%、mxfp8 ~29%，存在明显优化空间（反量化/scale 读取开销）。
3. **让 M ≤ 32**（kernel tile 边界）可让 bf16 保持高 MBU；M=33 处有明显台阶。
4. gate 这类 N 很小的层是 overhead bound，优化方向是减少启动开销/做融合，而非换 dtype。
