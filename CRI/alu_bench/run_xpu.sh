#!/bin/bash
# XPU side: build, run, dump IGC asm and count instructions per round.
# Needs oneAPI (icpx) in PATH. Results in results/xpu_*.txt
#   bash run_xpu.sh            (device 0; ZE_AFFINITY_MASK=N to pick a card)
set -e
cd "$(dirname "$0")"
mkdir -p results
icpx -fsycl -O3 xpu_alu.cpp -o xpu_alu
./xpu_alu | tee results/xpu.txt

# asm: JIT build with IGC dumps (no device caches, so the kernels recompile)
rm -rf results/xpu_asm
SYCL_CACHE_PERSISTENT=0 NEO_CACHE_PERSISTENT=0 IGC_ShaderDumpEnable=1 \
  IGC_DumpToCustomDir="$PWD/results/xpu_asm" ./xpu_alu > /dev/null
python3 count_insts.py xpu results/xpu_asm | tee results/xpu_insts.txt
