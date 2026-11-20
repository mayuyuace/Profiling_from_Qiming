#!/usr/bin/env python3
"""Benchmark BF16 TP collectives and compare with LMProj communication projection.

Run inside the qiming container, for example:
  mpirun --allow-run-as-root -n 2 python bench_collective_projection.py
  mpirun --allow-run-as-root -n 4 python bench_collective_projection.py
"""

import argparse
import csv
import json
import os
import sys
import time
from pathlib import Path

import torch
import torch.distributed as dist

HIDDEN = 2048
VOCAB = 151936


def env_int(*names, default=0):
    for name in names:
        if name in os.environ:
            return int(os.environ[name])
    return default


def init_dist(backend):
    rank = env_int("RANK", "OMPI_COMM_WORLD_RANK", "PMI_RANK")
    world = env_int("WORLD_SIZE", "OMPI_COMM_WORLD_SIZE", "PMI_SIZE", default=1)
    local_rank = env_int("LOCAL_RANK", "OMPI_COMM_WORLD_LOCAL_RANK", "MPI_LOCALRANKID", default=rank)
    os.environ.setdefault("MASTER_ADDR", "127.0.0.1")
    os.environ.setdefault("MASTER_PORT", "29511")
    os.environ.setdefault("CCL_LOCAL_RANK", str(local_rank))
    os.environ.setdefault("CCL_LOCAL_SIZE", str(world))
    os.environ.setdefault("CCL_LOG_LEVEL", "error")
    os.environ["RANK"] = str(rank)
    os.environ["WORLD_SIZE"] = str(world)

    if rank != 0:
        devnull = os.open(os.devnull, os.O_WRONLY)
        os.dup2(devnull, 1)
        os.close(devnull)

    torch.xpu.set_device(local_rank)
    dist.init_process_group(backend=backend, rank=rank, world_size=world,
                            device_id=torch.device("xpu", local_rank))
    return rank, world


def profile_device(fn, iters):
    devnull = os.open(os.devnull, os.O_WRONLY)
    saved_out, saved_err = os.dup(1), os.dup(2)
    os.dup2(devnull, 1)
    os.dup2(devnull, 2)
    try:
        with torch.profiler.profile(activities=[torch.profiler.ProfilerActivity.XPU]) as prof:
            for _ in range(iters):
                fn()
            torch.xpu.synchronize()
    finally:
        os.dup2(saved_out, 1)
        os.dup2(saved_err, 2)
        os.close(saved_out)
        os.close(saved_err)
        os.close(devnull)

    total_us = 0.0
    for event in prof.key_averages():
        device_us = getattr(event, "self_device_time_total", None)
        if device_us is None:
            device_us = getattr(event, "self_xpu_time_total", 0.0)
        if device_us:
            total_us += device_us
    return total_us / iters


def time_e2e(fn, iters):
    dist.barrier()
    torch.xpu.synchronize()
    start = time.perf_counter()
    for _ in range(iters):
        fn()
    torch.xpu.synchronize()
    return (time.perf_counter() - start) * 1e6 / iters


def bench(fn, warmup, iters):
    for _ in range(warmup):
        fn()
    torch.xpu.synchronize()
    e2e_us = time_e2e(fn, iters)
    dev_us = profile_device(fn, iters)

    stats = torch.tensor([dev_us, e2e_us], dtype=torch.float64, device="xpu")
    gathered = torch.empty((dist.get_world_size(), 2), dtype=torch.float64,
                           device="xpu")
    dist.all_gather_into_tensor(gathered, stats)
    gathered = gathered.cpu()
    return {
        "dev_min_us": float(gathered[:, 0].min()),
        "dev_max_us": float(gathered[:, 0].max()),
        "e2e_max_us": float(gathered[:, 1].max()),
    }


def lmproj_estimates(tp, lmproj_root):
    root = str(lmproj_root)
    if root not in sys.path:
        sys.path.insert(0, root)
    from lmproj.hardware.presets import get_preset
    from lmproj.projection.comm import allgather_latency_s, allreduce_latency_s

    hw = get_preset("cri4")
    estimates = {}
    for m in (68, 4096):
        ar_bytes = m * HIDDEN * 2
        ag_local_bytes = m * (VOCAB // tp) * 2
        estimates[m] = {
            "all_reduce_us": allreduce_latency_s(ar_bytes, tp, hw) * 1e6,
            "all_gather_us": allgather_latency_s(ag_local_bytes, tp, hw) * 1e6,
        }
    return estimates, hw.name


def pct(measured, projected):
    if projected <= 0:
        return 0.0
    return 100.0 * measured / projected


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--lmproj-root", default="/home/gta/qiming/LMProj")
    parser.add_argument("--output-dir", default="/home/gta/qiming/comm_projection_validation")
    parser.add_argument("--backend", default="xccl")
    parser.add_argument("--iters", type=int, default=20)
    parser.add_argument("--warmup", type=int, default=10)
    parser.add_argument("--deepsymm", action="store_true")
    args = parser.parse_args()

    if args.backend == "ccl":
        import oneccl_bindings_for_pytorch  # noqa: F401

    rank, world = init_dist(args.backend)
    dtype = torch.bfloat16
    elem_bytes = 2

    lmproj_rows = {}
    hw_name = "LMProj unavailable"
    if rank == 0:
        lmproj_rows, hw_name = lmproj_estimates(world, args.lmproj_root)

    payload = [lmproj_rows, hw_name]
    dist.broadcast_object_list(payload, src=0)
    lmproj_rows, hw_name = payload

    def all_reduce_out(x):
        if args.deepsymm:
            try:
                from deep_symm.collectives import all_reduce_out_of_place
                out = torch.empty_like(x)
                all_reduce_out_of_place(x, out)
                return out
            except Exception:
                pass
        if hasattr(dist, "all_reduce_out"):
            out = torch.empty_like(x)
            dist.all_reduce_out(out, x)
            return out
        out = x.clone()
        dist.all_reduce(out)
        return out

    def all_gather(x):
        out = torch.empty((world,) + x.shape, dtype=x.dtype, device=x.device)
        dist.all_gather_into_tensor(out, x)
        return out.movedim(0, -2).reshape(x.shape[:-1] + (world * x.shape[-1],))

    rows = []
    for m in (68, 4096):
        ar = torch.randn(m, HIDDEN, dtype=dtype, device="xpu")
        ag = torch.randn(m, VOCAB // world, dtype=dtype, device="xpu")

        ar_stats = bench(lambda: all_reduce_out(ar), args.warmup, args.iters)
        ag_stats = bench(lambda: all_gather(ag), args.warmup, args.iters)

        if rank != 0:
            continue

        proj = lmproj_rows[m]
        ar_projected = proj["all_reduce_us"]
        ag_projected = proj["all_gather_us"]

        ar_row = {
            "tp": world,
            "m": m,
            "op": "all_reduce",
            "input_shape": f"[{m},{HIDDEN}]",
            "output_shape": f"[{m},{HIDDEN}]",
            "measured_dev_min_us": ar_stats["dev_min_us"],
            "measured_dev_max_us": ar_stats["dev_max_us"],
            "measured_e2e_max_us": ar_stats["e2e_max_us"],
            "lmproj_us": ar_projected,
            "measured_to_lmproj_pct": pct(ar_stats["dev_min_us"], ar_projected),
            "lmproj_to_measured_pct": pct(ar_projected, ar_stats["dev_min_us"]),
            "message_mb": m * HIDDEN * elem_bytes / 1e6,
            "lmproj_hardware": hw_name,
        }
        ag_row = {
            "tp": world,
            "m": m,
            "op": "all_gather",
            "input_shape": f"[{m},{VOCAB // world}]",
            "output_shape": f"[{m},{VOCAB}]",
            "measured_dev_min_us": ag_stats["dev_min_us"],
            "measured_dev_max_us": ag_stats["dev_max_us"],
            "measured_e2e_max_us": ag_stats["e2e_max_us"],
            "lmproj_us": ag_projected,
            "measured_to_lmproj_pct": pct(ag_stats["dev_min_us"], ag_projected),
            "lmproj_to_measured_pct": pct(ag_projected, ag_stats["dev_min_us"]),
            "message_mb": m * VOCAB * elem_bytes / 1e6,
            "lmproj_hardware": hw_name,
        }
        rows.extend((ar_row, ag_row))

    if rank == 0:
        output_dir = Path(args.output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)
        csv_path = output_dir / f"collective_tp{world}.csv"
        json_path = output_dir / f"collective_tp{world}.json"
        with csv_path.open("w", newline="") as f:
            writer = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
            writer.writeheader()
            writer.writerows(rows)
        json_path.write_text(json.dumps(rows, indent=2) + "\n")

        print("\n| TP | M | op | shape | measured dev_min us | LMProj us | measured/LMProj % | measured e2e max us |")
        print("|---:|---:|---|---|---:|---:|---:|---:|")
        for row in rows:
            shape = row["input_shape"] + " -> " + row["output_shape"]
            print(f"| {row['tp']} | {row['m']} | {row['op']} | {shape} | "
                  f"{row['measured_dev_min_us']:.2f} | {row['lmproj_us']:.2f} | "
                  f"{row['measured_to_lmproj_pct']:.1f}% | {row['measured_e2e_max_us']:.2f} |")

    dist.destroy_process_group()


if __name__ == "__main__":
    main()
