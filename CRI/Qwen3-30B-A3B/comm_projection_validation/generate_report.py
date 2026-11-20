#!/usr/bin/env python3
import argparse
import csv
from datetime import datetime
from pathlib import Path


def read_csv(path):
    with path.open(newline="") as f:
        return list(csv.DictReader(f))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-dir", required=True)
    args = parser.parse_args()
    out = Path(args.output_dir)
    rows = []
    for tp in (2, 4):
        path = out / f"collective_tp{tp}.csv"
        if path.exists():
            rows.extend(read_csv(path))

    report = out / "REPORT.md"
    lines = []
    lines.append("# Qwen3-30B-A3B TP2/TP4 Collective Validation")
    lines.append("")
    lines.append(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    lines.append("")
    lines.append("## Scope")
    lines.append("")
    lines.append("- BF16 all-reduce: `[M, 2048]`")
    lines.append("- BF16 all-gather: `[M, vocab/tp] -> [M, 151936]`")
    lines.append("- LMProj hardware preset: `CRIWS-128G` (`cri4`)")
    lines.append("- Measured timing: XPU profiler `dev_min`, host wall `e2e_max`")
    lines.append("- Percentage: `measured / LMProj * 100%`; 100% means equal to projection")
    lines.append("")
    lines.append("## Results")
    lines.append("")
    lines.append("| TP | M | Operation | Shape | Measured dev_min (us) | Measured e2e max (us) | LMProj (us) | Measured/LMProj (%) | LMProj/Measured (%) |")
    lines.append("|---:|---:|---|---|---:|---:|---:|---:|---:|")

    for row in rows:
        shape = f"{row['input_shape']} -> {row['output_shape']}" if row["op"] == "all_gather" else row["input_shape"]
        lines.append(
            f"| {row['tp']} | {row['m']} | {row['op']} | {shape} | "
            f"{float(row['measured_dev_min_us']):.2f} | {float(row['measured_e2e_max_us']):.2f} | "
            f"{float(row['lmproj_us']):.2f} | {float(row['measured_to_lmproj_pct']):.1f}% | "
            f"{float(row['lmproj_to_measured_pct']):.1f}% |"
        )

    lines.append("")
    lines.append("## Interpretation")
    lines.append("")
    lines.append("- `Measured/LMProj > 100%`: the hardware collective is slower than the LMProj estimate.")
    lines.append("- `Measured/LMProj < 100%`: the hardware collective is faster than the LMProj estimate.")
    lines.append("- `e2e` includes host wall time and is compared to `dev_min` separately.")
    lines.append("- For per-layer analysis, the script uses one AllReduce and one lm_head AllGather call shape; LMProj full-forward totals are not used directly.")

    report.write_text("\n".join(lines) + "\n")
    print(report)


if __name__ == "__main__":
    main()
