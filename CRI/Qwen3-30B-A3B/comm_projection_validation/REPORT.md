# Qwen3-30B-A3B TP2/TP4 Collective Validation

Generated: 2026-11-20 02:05:08

## Scope

- BF16 all-reduce: `[M, 2048]`
- BF16 all-gather: `[M, vocab/tp] -> [M, 151936]`
- LMProj hardware preset: `CRIWS-128G` (`cri4`)
- Measured timing: XPU profiler `dev_min`, host wall `e2e_max`
- Percentage: `measured / LMProj * 100%`; 100% means equal to projection

## Results

| TP | M | Operation | Shape | Measured dev_min (us) | Measured e2e max (us) | LMProj (us) | Measured/LMProj (%) | LMProj/Measured (%) |
|---:|---:|---|---|---:|---:|---:|---:|---:|
| 2 | 68 | all_reduce | [68,2048] | 12.49 | 37.08 | 7.91 | 157.9% | 63.3% |
| 2 | 68 | all_gather | [68,75968] -> [68,151936] | 235.18 | 243.30 | 185.22 | 127.0% | 78.8% |
| 2 | 4096 | all_reduce | [4096,2048] | 348.49 | 352.32 | 298.89 | 116.6% | 85.8% |
| 2 | 4096 | all_gather | [4096,75968] -> [4096,151936] | 22771.65 | 22781.99 | 10978.84 | 207.4% | 48.2% |
| 4 | 68 | all_reduce | [68,2048] | 18.36 | 38.51 | 13.37 | 137.4% | 72.8% |
| 4 | 68 | all_gather | [68,37984] -> [68,151936] | 320.52 | 327.08 | 276.32 | 116.0% | 86.2% |
| 4 | 4096 | all_reduce | [4096,2048] | 505.13 | 513.25 | 449.84 | 112.3% | 89.1% |
| 4 | 4096 | all_gather | [4096,37984] -> [4096,151936] | 31521.86 | 31533.12 | 16466.75 | 191.4% | 52.2% |

## Interpretation

- `Measured/LMProj > 100%`: the hardware collective is slower than the LMProj estimate.
- `Measured/LMProj < 100%`: the hardware collective is faster than the LMProj estimate.
- `e2e` includes host wall time and is compared to `dev_min` separately.
- For per-layer analysis, the script uses one AllReduce and one lm_head AllGather call shape; LMProj full-forward totals are not used directly.
