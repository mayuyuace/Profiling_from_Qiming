// ALU vs memory-bandwidth microbenchmark, NVIDIA (CUDA) side.
// Same tests, same source-level work and launch shape as xpu_alu.cpp.
//
//   nvcc -O3 -arch=native cuda_alu.cu -o cuda_alu && ./cuda_alu
//
// See xpu_alu.cpp for the test descriptions.
#include <cuda_fp16.h>
#include <cuda_runtime.h>

#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <functional>
#include <vector>

#define CK(x)                                                            \
  do {                                                                   \
    cudaError_t e_ = (x);                                                \
    if (e_ != cudaSuccess) {                                             \
      std::printf("CUDA error %s at %s:%d\n", cudaGetErrorString(e_),    \
                  __FILE__, __LINE__);                                   \
      std::exit(1);                                                      \
    }                                                                    \
  } while (0)

constexpr int kWG = 256;            // threads per block (both sides)
constexpr int kVecPerItem = 4;      // float4 loads per thread (sweep)
constexpr size_t kN = size_t(1) << 28;  // 256 Mi floats = 1 GiB

static double median_ms(int reps, const std::function<void()>& launch) {
  for (int i = 0; i < 3; ++i) launch();
  CK(cudaDeviceSynchronize());
  cudaEvent_t s, e;
  CK(cudaEventCreate(&s));
  CK(cudaEventCreate(&e));
  std::vector<double> t;
  for (int i = 0; i < reps; ++i) {
    CK(cudaEventRecord(s));
    launch();
    CK(cudaEventRecord(e));
    CK(cudaEventSynchronize(e));
    float ms;
    CK(cudaEventElapsedTime(&ms, s, e));
    t.push_back(ms);
  }
  CK(cudaEventDestroy(s));
  CK(cudaEventDestroy(e));
  std::sort(t.begin(), t.end());
  return t[t.size() / 2];
}

__device__ __forceinline__ uint32_t topk_round(float& v, float a, float b) {
  v = fmaf(v, a, b);
  const uint32_t h = __half_as_ushort(__float2half_rn(v));
  return (h ^ ((h & 0x8000u) ? 0xFFFFu : 0x8000u)) >> 4;
}

template <int K>
__global__ void __launch_bounds__(kWG)
    sweep_kernel(const float* __restrict__ in, uint32_t* out, float a,
                 float b, uint32_t magic) {
  // same layout as the top-k kernels: lane-contiguous float4s,
  // kVecPerItem of them strided by the block size
  const size_t g = blockIdx.x;
  const size_t l = threadIdx.x;
  const float4* p =
      reinterpret_cast<const float4*>(in) + g * (size_t(kWG) * kVecPerItem) + l;
  float4 x[kVecPerItem];
#pragma unroll
  for (int u = 0; u < kVecPerItem; ++u) x[u] = p[u * kWG];
  uint32_t acc = 0;
#pragma unroll
  for (int u = 0; u < kVecPerItem; ++u) {
    const float xs[4] = {x[u].x, x[u].y, x[u].z, x[u].w};
#pragma unroll
    for (int j = 0; j < 4; ++j) {
      float v = xs[j];
      if constexpr (K == 0) {
        acc += __float_as_uint(v);
      } else {
#pragma unroll
        for (int r = 0; r < K; ++r) acc += topk_round(v, a, b);
      }
    }
  }
  // magic is a runtime value: the compiler cannot bound acc away
  if (acc == magic) out[0] = acc;
}

__global__ void __launch_bounds__(kWG)
    fma_kernel(uint32_t* out, float a, float b, int iters) {
  float x[8];
#pragma unroll
  for (int i = 0; i < 8; ++i) x[i] = float(blockIdx.x * kWG + threadIdx.x + i);
  for (int n = 0; n < iters; ++n)
#pragma unroll
    for (int i = 0; i < 8; ++i) x[i] = fmaf(x[i], a, b);
  float s = 0;
#pragma unroll
  for (int i = 0; i < 8; ++i) s += x[i];
  if (s == 1234.5f) out[0] = 1;
}

__global__ void __launch_bounds__(kWG)
    int_kernel(uint32_t* out, uint32_t ia, uint32_t ib, int iters) {
  uint32_t x[8];
#pragma unroll
  for (int i = 0; i < 8; ++i)
    x[i] = uint32_t(blockIdx.x * kWG + threadIdx.x) * 8 + i;
  for (int n = 0; n < iters; ++n)
#pragma unroll
    for (int i = 0; i < 8; ++i) x[i] = (x[i] ^ ia) + ib;
  uint32_t s = 0;
#pragma unroll
  for (int i = 0; i < 8; ++i) s ^= x[i];
  if (s == 0x12345678u) out[0] = s;
}

__global__ void init_kernel(float* in, size_t n) {
  const size_t i = size_t(blockIdx.x) * blockDim.x + threadIdx.x;
  if (i < n)
    in[i] = float((i * 2654435761u) & 0xFFFFFF) * (1.0f / 16777216.0f);
}

template <int K>
static void sweep(const float* in, uint32_t* out, float a, float b,
                  uint32_t magic, double& floor_ms) {
  const size_t items = kN / 4 / kVecPerItem;
  const double ms = median_ms(10, [&] {
    sweep_kernel<K><<<items / kWG, kWG>>>(in, out, a, b, magic);
  });
  CK(cudaGetLastError());
  if (K == 0) floor_ms = ms;
  const double gbs = kN * 4.0 / (ms * 1e-3) / 1e9;
  const double gel = kN / (ms * 1e-3) / 1e9;
  std::printf("  K=%-3d %9.3f ms  %7.1f GB/s  %7.2f Gelem/s  x%.2f of K=0\n",
              K, ms, gbs, gel, ms / floor_ms);
}

int main(int argc, char** argv) {
  int dev = 0;
  CK(cudaGetDevice(&dev));
  cudaDeviceProp pr;
  CK(cudaGetDeviceProperties(&pr, dev));
  int clk_khz = 0;
  cudaDeviceGetAttribute(&clk_khz, cudaDevAttrClockRate, dev);
  std::printf("device       : %s (sm_%d%d)\n", pr.name, pr.major, pr.minor);
  std::printf("compute units: %d SMs\n", pr.multiProcessorCount);
  std::printf("max clock    : %d MHz\n", clk_khz / 1000);
  std::printf("launch       : %d threads / block, warp 32\n", kWG);

  const float a = argc > 1 ? std::atof(argv[1]) : 0.999f;
  const float b = argc > 2 ? std::atof(argv[2]) : 0.001f;
  const uint32_t ia = 0x5bd1e995u, ib = 0x1b873593u;
  const uint32_t magic = argc > 3 ? std::strtoul(argv[3], nullptr, 0) : 7u;
  uint32_t* out;
  CK(cudaMalloc(&out, (1 << 20) * sizeof(uint32_t)));

  {
    const size_t items = size_t(1) << 20;
    const int iters = 2048;
    const double ms = median_ms(10, [&] {
      fma_kernel<<<items / kWG, kWG>>>(out, a, b, iters);
    });
    CK(cudaGetLastError());
    const double ops = double(items) * iters * 8;
    std::printf("\n[fma ] %.3f ms  %.2f T fma/s (lane-ops)  %.2f TFLOP/s\n", ms,
                ops / (ms * 1e-3) / 1e12, 2 * ops / (ms * 1e-3) / 1e12);
  }
  {
    const size_t items = size_t(1) << 20;
    const int iters = 2048;
    const double ms = median_ms(10, [&] {
      int_kernel<<<items / kWG, kWG>>>(out, ia, ib, iters);
    });
    CK(cudaGetLastError());
    const double ops = double(items) * iters * 8 * 2;
    std::printf("[int ] %.3f ms  %.2f T int-ops/s (xor+add, lane-ops)\n", ms,
                ops / (ms * 1e-3) / 1e12);
  }

  float* in;
  CK(cudaMalloc(&in, kN * sizeof(float)));
  init_kernel<<<(kN + 255) / 256, 256>>>(in, kN);
  CK(cudaDeviceSynchronize());
  std::printf("\n[sweep] read 1 GiB fp32 + K topk rounds per element\n");
  double floor_ms = 0;
  sweep<0>(in, out, a, b, magic, floor_ms);
  sweep<1>(in, out, a, b, magic, floor_ms);
  sweep<2>(in, out, a, b, magic, floor_ms);
  sweep<4>(in, out, a, b, magic, floor_ms);
  sweep<8>(in, out, a, b, magic, floor_ms);
  sweep<16>(in, out, a, b, magic, floor_ms);
  sweep<32>(in, out, a, b, magic, floor_ms);
  sweep<64>(in, out, a, b, magic, floor_ms);

  CK(cudaFree(in));
  CK(cudaFree(out));
  return 0;
}
