#!/bin/bash
# XPU: build + run (inside the qiming container, oneAPI env loaded).
set -e
cd "$(dirname "$0")"
icpx -fsycl -O3 xpu_bench.cpp -o xpu_bench
./xpu_bench | tee xpu.log
