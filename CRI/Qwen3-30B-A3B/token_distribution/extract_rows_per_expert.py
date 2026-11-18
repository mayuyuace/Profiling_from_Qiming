import re
import sys

PREFIX_RE = re.compile(r"^\((\S+) pid=(\d+)\)\s?(.*)$")


def extract(path):
    """Return {process_name: [tensor_values, ...]} for tensors after startup."""
    started = False
    buffers = {}
    results = {}
    with open(path, encoding="utf-8", errors="ignore") as f:
        for raw in f:
            line = raw.replace("\r", "").rstrip("\n")
            if not started:
                if "Application startup complete." in line:
                    started = True
                continue
            m = PREFIX_RE.match(line)
            if not m:
                continue
            name, content = m.group(1), m.group(3)
            if "rows_per_expert tensor([" in content:
                buffers[name] = content.split("tensor([", 1)[1]
            elif name in buffers:
                buffers[name] += " " + content
            else:
                continue
            buf = buffers[name]
            if "]" in buf:
                values = [int(v) for v in re.findall(r"-?\d+", buf.split("]", 1)[0])]
                results.setdefault(name, []).append(values)
                del buffers[name]
    return results


def main(path, out_path):
    results = extract(path)
    names = sorted(results)
    for n in names:
        print(f"{path}: {n} -> {len(results[n])} tensors")
    # TP ranks hold duplicated data; keep only one rank (TP0 if present).
    key = next((n for n in names if n.endswith("TP0")), names[0])
    ref = results[key]
    for n in names:
        if n != key and results[n] != ref:
            print(f"WARNING: {n} differs from {key}")
    with open(out_path, "w") as f:
        for values in ref:
            f.write(" ".join(map(str, values)) + "\n")
    print(f"wrote {len(ref)} lines from {key} to {out_path}")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
