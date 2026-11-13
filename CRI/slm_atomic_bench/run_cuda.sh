#!/bin/bash
# CUDA: build + run (copy this folder to the NV machine).
set -e
cd "$(dirname "$0")"
nvcc -O3 -arch=native -std=c++17 cuda.cu -o cuda_bench
./cuda_bench 1024 | tee cuda.log
