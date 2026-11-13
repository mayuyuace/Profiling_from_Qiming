#!/usr/bin/env python3
"""Kernel fixed-overhead / per-row parallelism micro-benchmark (CUDA).

Same cases as xpu_bench.cpp (see that file). Compiled with
torch.utils.cpp_extension.load_inline; timed with torch.profiler (CUDA device
time of the kernel only, like cuda_dsa_topk_kernel_time.py), median over runs.

Run:  CUDA_VISIBLE_DEVICES=<id> python cuda_bench.py
"""

import statistics

import torch
from torch.profiler import ProfilerActivity, profile
from torch.utils.cpp_extension import load_inline

CUDA_SRC = r"""
#include <torch/extension.h>
#include <cstdint>

constexpr uint32_t kRowElems = 16384;
constexpr uint32_t kRowVecs = kRowElems / 8;
enum Case { EMPTY, READ, BAR1, BAR5, ALU, ATOM };

template <int CASE, int W>
__global__ void __launch_bounds__(W) kern(const uint32_t* __restrict__ in,
                                          uint32_t* __restrict__ out) {
  constexpr uint32_t kVecs = kRowVecs / W;
  __shared__ uint32_t slm[256];
  const uint32_t tx = threadIdx.x, g = blockIdx.x;
  uint32_t acc = tx;
  if constexpr (CASE == ATOM) {
    for (uint32_t i = tx; i < 256; i += W) slm[i] = 0;
  }
  if constexpr (CASE != EMPTY) {
    const uint32_t* row = in + size_t(g) * (kRowElems / 2);
    uint32_t v[kVecs][4];
#pragma unroll
    for (uint32_t i = 0; i < kVecs; ++i) {
      const uint4 w = *reinterpret_cast<const uint4*>(row + (tx * kVecs + i) * 4);
      v[i][0] = w.x; v[i][1] = w.y; v[i][2] = w.z; v[i][3] = w.w;
    }
    if constexpr (CASE == BAR1 || CASE == BAR5 || CASE == ATOM) __syncthreads();
    if constexpr (CASE == BAR5) {
#pragma unroll
      for (int b = 0; b < 4; ++b) __syncthreads();
    }
#pragma unroll
    for (uint32_t i = 0; i < kVecs; ++i) {
#pragma unroll
      for (uint32_t j = 0; j < 4; ++j) {
        uint32_t x = v[i][j];
        if constexpr (CASE == ALU) {
#pragma unroll
          for (int r = 0; r < 16; ++r) x = x * 1664525u + 1013904223u;
        } else if constexpr (CASE == ATOM) {
          atomicAdd(&slm[x & 0xFFu], 1u);
          atomicAdd(&slm[(x >> 16) & 0xFFu], 1u);
        }
        acc ^= x;
      }
    }
    if constexpr (CASE == ATOM) {
      __syncthreads();
      acc += slm[tx & 255u];
    }
  }
  out[size_t(g) * W + tx] = acc;
}

template <int CASE, int W>
void launch_t(const uint32_t* in, uint32_t* out, int rows) {
  kern<CASE, W><<<rows, W>>>(in, out);
}

void launch(torch::Tensor in, torch::Tensor out, int c, int w, int rows) {
  auto* i = reinterpret_cast<const uint32_t*>(in.data_ptr<int32_t>());
  auto* o = reinterpret_cast<uint32_t*>(out.data_ptr<int32_t>());
#define L(C, WW) if (c == C && w == WW) return launch_t<C, WW>(i, o, rows);
  L(EMPTY, 512) L(READ, 512) L(BAR1, 512) L(BAR5, 512)
  L(ALU, 256) L(ALU, 512) L(ALU, 1024)
  L(ATOM, 256) L(ATOM, 512) L(ATOM, 1024)
#undef L
  TORCH_CHECK(false, "unsupported case/W");
}
"""
CPP_SRC = "void launch(torch::Tensor in, torch::Tensor out, int c, int w, int rows);"

CASES = ["empty", "read", "read+bar1", "read+bar5", "read+alu", "read+atom"]
RUNS = [(0, 512), (1, 512), (2, 512), (3, 512),
        (4, 256), (4, 512), (4, 1024),
        (5, 256), (5, 512), (5, 1024)]


def kernel_us(prof) -> list[float]:
    """Per-launch device times (us) of our kernel from a profiler trace."""
    out = []
    for e in prof.events():
        if "kern<" in e.name and getattr(e, "device_type", None) is not None \
                and str(e.device_type).endswith("CUDA"):
            t = (getattr(e, "device_time_total", None)
                 or getattr(e, "cuda_time_total", None) or 0)
            if t > 0:
                out.append(float(t))
    return out


def main():
    mod = load_inline("kernel_overhead_bench", cpp_sources=CPP_SRC,
                      cuda_sources=CUDA_SRC, functions=["launch"],
                      extra_cuda_cflags=["-O3", "-std=c++20"], verbose=False)
    print(f"device: {torch.cuda.get_device_name()}")
    g = torch.Generator(device="cuda").manual_seed(0)
    inp = torch.randint(-2**31, 2**31 - 1, (32 * 16384 // 2,), dtype=torch.int32,
                        device="cuda", generator=g)
    out = torch.empty(32 * 1024, dtype=torch.int32, device="cuda")
    print(f"{'case':<10} {'WG':>5} {'SG':>3} {'rows':>5} {'median(us)':>10} {'min(us)':>10}")
    for c, w in RUNS:
        for rows in (1, 32):
            for _ in range(5):
                mod.launch(inp, out, c, w, rows)
            torch.cuda.synchronize()
            with profile(activities=[ProfilerActivity.CUDA]) as prof:
                for _ in range(51):
                    mod.launch(inp, out, c, w, rows)
                torch.cuda.synchronize()
            ts = kernel_us(prof)
            if not ts:
                print(f"{CASES[c]:<10} {w:5d} {32:3d} {rows:5d}  no kernel events")
                continue
            print(f"{CASES[c]:<10} {w:5d} {32:3d} {rows:5d} "
                  f"{statistics.median(ts):10.3f} {min(ts):10.3f}", flush=True)


if __name__ == "__main__":
    main()
