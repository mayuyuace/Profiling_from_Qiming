#!/bin/bash
# CUDA: needs PyTorch with CUDA + nvcc (load_inline). Pick the GPU with
# CUDA_VISIBLE_DEVICES, e.g.  CUDA_VISIBLE_DEVICES=1 bash run_cuda.sh
set -e
cd "$(dirname "$0")"
python cuda_bench.py | tee cuda.log
