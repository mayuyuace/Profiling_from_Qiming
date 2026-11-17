#!/usr/bin/env python3
"""Static instruction count of the sweep kernels, XPU (IGC asm dump) or NV
(cuobjdump -sass), and the derived instructions per topk round per element.

  count_insts.py xpu <igc dump dir>
  count_insts.py nv  <file with `cuobjdump -sass` output>

The sweep kernel is fully unrolled (16 elements per work-item, K rounds each),
so (count(K2) - count(K1)) / ((K2 - K1) * 16) is the per-round, per-element
instruction count of one work-item / thread.
  XPU: one instruction = one SIMD32 sub-group instruction (32 lanes)
  NV : one instruction = one warp instruction (32 lanes)
"""
import re
import sys
from pathlib import Path

ELEMS = 16  # kVecPerItem * 4


def xpu_counts(d):
    out = {}
    for f in Path(d).glob("*.asm"):
        name, n = None, 0
        for line in f.read_text(errors="ignore").splitlines():
            if line.startswith("//.kernel "):
                name = line.split()[1]
                continue
            s = line.strip()
            if not s or s.startswith("//"):
                continue
            if s.endswith(":") or re.match(r"^(L\d+|_\S+)$", s.split("//")[0].strip()):
                continue  # labels
            if re.match(r"^\(?[A-Za-z~(]", s):
                n += 1
        m = re.search(r"SweepKILi(\d+)EE", name or "")
        if m:
            out[int(m.group(1))] = n
    return out


def nv_counts(path):
    out, cur = {}, None
    for line in Path(path).read_text(errors="ignore").splitlines():
        m = re.search(r"Function : (\S+)", line)
        if m:
            k = re.search(r"sweep_kernelILi(\d+)EE", m.group(1))
            cur = int(k.group(1)) if k else None
            if cur is not None:
                out[cur] = 0
            continue
        if cur is None:
            continue
        m = re.search(r"/\*[0-9a-f]{4}\*/\s+(.*?);", line)
        if m and not m.group(1).strip().startswith("NOP"):
            out[cur] += 1
    return out


def main():
    mode, src = sys.argv[1], sys.argv[2]
    c = xpu_counts(src) if mode == "xpu" else nv_counts(src)
    if not c:
        sys.exit(f"no sweep kernels found in {src}")
    print(f"[{mode}] static instructions per sweep kernel (one work-item, "
          f"{ELEMS} elements):")
    for k in sorted(c):
        print(f"  K={k:<3d} {c[k]:6d}")
    ks = sorted(k for k in c if k > 0)
    for k1, k2 in zip(ks, ks[1:]):
        per = (c[k2] - c[k1]) / ((k2 - k1) * ELEMS)
        print(f"  K {k1:>2d}->{k2:<2d}: {per:5.2f} instructions / round / element")


if __name__ == "__main__":
    main()
