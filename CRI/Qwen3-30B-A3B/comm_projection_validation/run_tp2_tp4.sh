#!/bin/bash
set -euo pipefail

cd /home/gta/qiming
source uv_envs/qiming_2969/bin/activate
export HTTPS_PROXY=http://proxy.ims.intel.com:911
export HTTP_PROXY=http://proxy.ims.intel.com:911
export http_proxy=http://proxy.ims.intel.com:911
export https_proxy=http://proxy.ims.intel.com:911
export no_proxy=.intel.com,intel.com,localhost,127.0.0.1,0.0.0.0

OUT=/home/gta/qiming/comm_projection_validation

mpirun --allow-run-as-root -n 2 python -u "$OUT/bench_collective_projection.py" \
  --lmproj-root /home/gta/qiming/LMProj --output-dir "$OUT"

mpirun --allow-run-as-root -n 4 python -u "$OUT/bench_collective_projection.py" \
  --lmproj-root /home/gta/qiming/LMProj --output-dir "$OUT"

python "$OUT/generate_report.py" --output-dir "$OUT"
