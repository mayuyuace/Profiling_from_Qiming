# ALU vs bandwidth: XPU vs NV

Shows why the same top-k kernel (NV `topk_ragged_kernel`, ported 1:1) cannot
reach NV speed on XPU although both GPUs have about the same memory bandwidth:
the XPU has about 3.5x less ALU throughput, so it becomes ALU-bound at about
3.5x fewer instructions per byte.

## Run

| | command | needs |
|---|---|---|
| XPU | `bash run_xpu.sh` (`ZE_AFFINITY_MASK=N` picks a card) | oneAPI `icpx` |
| NV  | `bash run_nv.sh` (`ARCH=sm_120` overrides `-arch=native`, `CUDA_VISIBLE_DEVICES=N`) | CUDA `nvcc`, `cuobjdump` |

Output goes to `results/` (`xpu.txt` / `nv.txt`, `*_insts.txt`, asm / SASS).
Use an otherwise idle GPU: the tests saturate the whole device.

`xpu_alu.cpp` and `cuda_alu.cu` are the same program: same tests, same
source-level work per element, same launch shape (256 work-items per group,
32-wide sub-group / warp, 4 float4 loads per work-item laid out like the
top-k kernels).

## Tests

1. `[fma]` peak FP32 FMA throughput, 8 independent chains per work-item.
2. `[int]` peak INT32 throughput (xor + add), 8 independent chains.
3. `[sweep] K=0` streaming read of a 1 GiB fp32 array = memory bandwidth.
4. `[sweep] K>0` same read + K rounds of the top-k histogram per-element work
   (`fma`, fp32 -> fp16, ordered key, `>> 4` bin) per element.
   Time stays at the bandwidth floor while the ALU work hides under the loads,
   then grows linearly once the kernel is ALU-bound.
5. `*_insts.txt`: static instructions per round per element from the
   compiled asm (IGC asm / SASS), to show both compilers generate comparable
   code for the same source work (one XPU SIMD32 instruction and one NV warp
   instruction both cover 32 lanes).

## How to read the comparison

- `[fma]` / `[int]` NV / XPU ratio = ALU throughput ratio (expected ~3.5x:
  32 Xe cores vs ~110 SMs, both 128 lanes / clock).
- `K=0` GB/s ratio = bandwidth ratio (expected ~1.1x).
- In `[sweep]`, the K where `x of K=0` leaves 1.00 is where the device turns
  ALU-bound. The ALU budget per element at full bandwidth is
  `int-ops/s / (K=0 Gelem/s)` lane-instructions:
  XPU ~10.2 T / 297 G = ~34 instructions per fp32 element read.
- At large K both devices are ALU-bound and the time ratio approaches the
  ALU ratio.

## XPU reference (Intel 0x674f, 32 Xe cores, 2.5 GHz, 2026-11-17)

```
[fma ] 10.29 T fma/s (lane-ops)  20.57 TFLOP/s
[int ] 10.23 T int-ops/s (xor+add, lane-ops)
[sweep] read 1 GiB fp32 + K topk rounds per element
  K=0    0.903 ms  1189.1 GB/s  x1.00
  K=4    0.895 ms  1199.9 GB/s  x0.99
  K=8    1.538 ms   698.1 GB/s  x1.70
  K=16   3.082 ms   348.4 GB/s  x3.41
  K=64  12.316 ms    87.2 GB/s  x13.64
instructions per round per element: 8.54 (SIMD32)
```

XPU turns ALU-bound between K = 4 and 8 rounds (~34-68 instructions per
element). For reference, the top-k Streaming kernel spends ~12 instructions
per element in its histogram pass alone, plus a second pass, threshold, tie
handling and synchronization (see `dsa_bench/dsa_topk_notes.md` 3.9).

## NV result (RTX PRO 5000 72GB Blackwell, sm_120, 110 SMs, 2377 MHz)

```
[fma ] 33.89 T fma/s (lane-ops)  67.78 TFLOP/s
[int ] 17.64 T int-ops/s (xor+add, lane-ops)
  K=0    0.870 ms  1233.7 GB/s  x1.00
  K=8    0.872 ms  1231.5 GB/s  x1.00
  K=16   1.025 ms  1047.3 GB/s  x1.18
  K=32   1.974 ms   544.0 GB/s  x2.27
  K=64   3.937 ms   272.7 GB/s  x4.52
instructions per round per element: 6.00 (warp)
```
(the K=64 static count is lower because nvcc did not fully unroll it; timing
is unaffected, ignore that count.)

## Comparison

| | XPU | NV | NV / XPU |
|---|---|---|---|
| FP32 FMA peak | 10.29 T/s | 33.89 T/s | **3.29x** |
| INT32 xor+add peak | 10.23 T/s | 17.64 T/s | 1.72x (Blackwell INT32 on half the lanes) |
| read bandwidth | 1189 GB/s | 1234 GB/s | **1.04x** |
| ALU-bound from | K 4..8 | K 8..16 | |
| time K=16 / 32 / 64 | 3.08 / 6.16 / 12.32 ms | 1.03 / 1.97 / 3.94 ms | 3.01 / **3.12** / 3.13x |
| instructions / round / element | 8.54 | 6.00 | XPU 1.42x more |
| executed rate of this mix | 11.9 T/s | 26.1 T/s | 2.19x |

- Same bandwidth (4 %), but for the same top-k per-element work the XPU is
  ~3.1x slower once ALU-bound, and turns ALU-bound at about half the work per
  element.
- 3.12 = 2.19 (hardware rate for this fp/int mix) x 1.42 (instruction count).
  The count difference is ISA / compiler: NV fuses the key logic into `LOP3`
  (3-input logic) and converts with one `F2F`; Xe uses separate
  `cmp` / `sel` / `xor` and extra `mov`s around the f32 -> f16 conversion
  (Xe has a 3-input `bfn`, not used here by IGC).
- So: the gap is ALU capacity (Xe core count, 32 vs 110 SMs) plus ~1.4x more
  instructions for the same source; SLM atomic conflicts and per-step sync
  latency come on top of that in the real top-k kernel.
