#!/bin/bash
# NV side: build, run, dump SASS and count instructions per round.
# Needs CUDA (nvcc, cuobjdump). Results in results/nv_*.txt
#   bash run_nv.sh              (ARCH=sm_120 to override -arch=native)
#   CUDA_VISIBLE_DEVICES=N to pick a card
set -e
cd "$(dirname "$0")"
mkdir -p results
ARCH=${ARCH:-native}
nvcc -O3 -arch=$ARCH cuda_alu.cu -o cuda_alu
./cuda_alu | tee results/nv.txt

cuobjdump -sass cuda_alu > results/nv.sass
python3 count_insts.py nv results/nv.sass | tee results/nv_insts.txt
