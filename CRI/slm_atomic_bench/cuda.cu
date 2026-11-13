// SLM (shared memory) atomic throughput micro-benchmark (CUDA).
// Same kernel logic and output format as xpu.cpp; see that file for the
// description of modes / patterns.
//
// Build: nvcc -O3 -arch=native cuda.cu -o cuda_bench
// Run:   ./cuda_bench [N=1024]

#include <cuda_runtime.h>

#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <vector>

constexpr uint32_t kWG = 512;
constexpr uint32_t kRegion = 2048;
constexpr uint32_t kSlmWords = 2 * kRegion;  // 16 KB

enum Mode { ATOM, ATOM_RET, PLAIN, ALU };
enum Pat { KWAY, BANK, WGALL, XSG };

struct PatDesc {
  const char* name;
  int pat;
  uint32_t k;
};
static const PatDesc kPats[] = {
    {"uniq", KWAY, 1}, {"k2", KWAY, 2},   {"k4", KWAY, 4}, {"k8", KWAY, 8},
    {"k32", KWAY, 32}, {"wg", WGALL, 0}, {"bank", BANK, 0},
    {"xsg", XSG, 0},  // distinct within a sub-group, same across sub-groups
};
static const char* kModeNames[] = {"atom", "atom_ret", "plain", "alu"};

#define CK(x)                                                         \
  do {                                                                \
    cudaError_t e = (x);                                              \
    if (e != cudaSuccess) {                                           \
      printf("%s:%d %s\n", __FILE__, __LINE__, cudaGetErrorString(e)); \
      exit(1);                                                        \
    }                                                                 \
  } while (0)

__device__ __forceinline__ uint32_t
addr_of(int pat, uint32_t k, uint32_t lane, uint32_t sg) {
  if (pat == KWAY) return sg * 32 + lane / k;
  if (pat == BANK) return lane * 32 + sg;
  if (pat == XSG) return lane;
  return 0;
}

template <int MODE>
__global__ void __launch_bounds__(kWG)
    kern(uint32_t* out, int n, int pat, uint32_t k) {
  __shared__ uint32_t S[kSlmWords];
  const uint32_t tid = threadIdx.x;
  const uint32_t lane = tid & 31u;
  const uint32_t sg = tid >> 5;
  for (uint32_t i = tid; i < kSlmWords; i += kWG) S[i] = 0;
  __syncthreads();

  const uint32_t a = addr_of(pat, k, lane, sg);
  uint32_t acc = 0;
  for (int i = 0; i < n; ++i) {
    const uint32_t ai = a + (static_cast<uint32_t>(i) & 1u) * kRegion;
    if constexpr (MODE == ATOM) {
      atomicAdd(&S[ai], 1u);
    } else if constexpr (MODE == ATOM_RET) {
      acc += atomicAdd(&S[ai], 1u);
    } else if constexpr (MODE == PLAIN) {
      volatile uint32_t* V = S;
      V[ai] = V[ai] + 1u;
    } else {
      acc = acc * 1664525u + ai;
    }
  }
  __syncthreads();
  out[blockIdx.x * kWG + tid] = S[tid] + acc;
}

template <int MODE>
double run_once(uint32_t* out, uint32_t groups, int n, int pat, uint32_t k) {
  cudaEvent_t e0, e1;
  CK(cudaEventCreate(&e0));
  CK(cudaEventCreate(&e1));
  CK(cudaEventRecord(e0));
  kern<MODE><<<groups, kWG>>>(out, n, pat, k);
  CK(cudaEventRecord(e1));
  CK(cudaEventSynchronize(e1));
  float ms = 0;
  CK(cudaEventElapsedTime(&ms, e0, e1));
  CK(cudaEventDestroy(e0));
  CK(cudaEventDestroy(e1));
  return ms * 1e3;  // us
}

template <int MODE>
double run_med(uint32_t* out, uint32_t groups, int n, int pat, uint32_t k) {
  for (int w = 0; w < 3; ++w) run_once<MODE>(out, groups, n, pat, k);
  std::vector<double> t;
  for (int r = 0; r < 21; ++r) t.push_back(run_once<MODE>(out, groups, n, pat, k));
  std::sort(t.begin(), t.end());
  return t[t.size() / 2];
}

template <int MODE>
void bench(uint32_t* out, uint32_t units, uint32_t groups, int n, const PatDesc& p) {
  const double t0 = run_med<MODE>(out, groups, 0, p.pat, p.k);
  const double tn = run_med<MODE>(out, groups, n, p.pat, p.k);
  const double dt = tn - t0;
  const double ops = double(groups) * kWG * n;
  const double per_unit = ops / (dt * 1e3) / std::min(groups, units);
  printf(
      "%-9s %-5s %6u %10.2f %10.2f %12.3f %16.3f\n", kModeNames[MODE], p.name,
      groups, t0, tn, dt * 1e3 / n, per_unit);
}

int main(int argc, char** argv) {
  const int n = argc > 1 ? atoi(argv[1]) : 1024;
  cudaDeviceProp prop;
  CK(cudaGetDeviceProperties(&prop, 0));
  const uint32_t units = prop.multiProcessorCount;
  printf(
      "device: %s | units (SM): %u | WG %u | N %d\n", prop.name, units, kWG, n);

  const uint32_t full = units * 4;  // 4 x 512 = 2048 threads per SM
  uint32_t* out = nullptr;
  CK(cudaMalloc(&out, size_t(full) * kWG * sizeof(uint32_t)));

  printf(
      "%-9s %-5s %6s %10s %10s %12s %16s\n", "mode", "pat", "WGs", "t0(us)",
      "tN(us)", "ns/iter/WG", "lane-ops/ns/unit");
  for (uint32_t groups : {1u, full}) {
    for (const auto& p : kPats) {
      bench<ATOM>(out, units, groups, n, p);
      bench<ATOM_RET>(out, units, groups, n, p);
      bench<PLAIN>(out, units, groups, n, p);
    }
    bench<ALU>(out, units, groups, n, kPats[0]);
  }
  CK(cudaFree(out));
  return 0;
}
