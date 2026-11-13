#!/bin/bash
# XPU: build + run. Source oneAPI first if icpx is not on PATH:
#   source /opt/intel/oneapi/setvars.sh
set -e
cd "$(dirname "$0")"
icpx -fsycl -O3 xpu.cpp -o xpu_bench
./xpu_bench 1024 | tee xpu.log
