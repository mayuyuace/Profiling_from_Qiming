// ALU vs memory-bandwidth microbenchmark, XPU (SYCL) side.
// Same tests, same source-level work and launch shape as cuda_alu.cu.
//
//   icpx -fsycl -O3 xpu_alu.cpp -o xpu_alu && ./xpu_alu
//
// Tests (all results are device totals):
//   1. fma   : peak FP32 FMA throughput (8 independent chains per work-item)
//   2. int   : peak INT32 xor+add throughput (8 independent chains)
//   3. read  : streaming read bandwidth of a 1 GiB fp32 array (K = 0 below)
//   4. sweep : same read + K "topk rounds" per element, K = 0..64. One round
//              is the per-element work of the top-k histogram pass:
//                v   = fma(v, a, b)            fp32 FMA
//                h   = bits(fp16(v))           fp32 -> fp16 conversion
//                key = h ^ (neg ? 0xFFFF : 0x8000)   ordered fp16 key
//                acc += key >> 4               12-bit bin
//              Time stays at the bandwidth floor while ALU work hides under
//              the loads, then grows linearly; the K where it departs and the
//              slope show the device's ALU capacity per byte of bandwidth.
//
// Every input that could let the compiler fold work is a runtime argument and
// every result reaches memory (conditionally, so stores add no traffic).
#include <sycl/sycl.hpp>

#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <functional>
#include <vector>

constexpr int kWG = 256;            // work-items per group (both sides)
constexpr int kSG = 32;             // sub-group = warp width
constexpr int kVecPerItem = 4;      // float4 loads per work-item (sweep)
constexpr size_t kN = size_t(1) << 28;  // 256 Mi floats = 1 GiB

template <int K>
struct SweepK;
struct FmaK;
struct IntK;

static double median_ms(sycl::queue& q, int reps,
                        const std::function<sycl::event()>& launch) {
  for (int i = 0; i < 3; ++i) launch().wait();
  std::vector<double> t;
  for (int i = 0; i < reps; ++i) {
    sycl::event e = launch();
    e.wait();
    t.push_back(
        (e.template get_profiling_info<
             sycl::info::event_profiling::command_end>() -
         e.template get_profiling_info<
             sycl::info::event_profiling::command_start>()) *
        1e-6);
  }
  std::sort(t.begin(), t.end());
  return t[t.size() / 2];
}

static inline uint32_t topk_round(float& v, float a, float b) {
  v = sycl::fma(v, a, b);
  const uint32_t h =
      sycl::bit_cast<uint16_t>(static_cast<sycl::half>(v));
  return (h ^ ((h & 0x8000u) ? 0xFFFFu : 0x8000u)) >> 4;
}

template <int K>
static void sweep(sycl::queue& q, const float* in, uint32_t* out, float a,
                  float b, uint32_t magic, double& floor_ms) {
  const size_t nvec = kN / 4;
  const size_t items = nvec / kVecPerItem;
  const double ms = median_ms(q, 10, [&] {
    return q.parallel_for<SweepK<K>>(
        sycl::nd_range<1>(items, kWG),
        [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(kSG)]] {
          // same layout as the top-k kernels: lane-contiguous float4s,
          // kVecPerItem of them strided by the group size
          const size_t g = it.get_group(0);
          const size_t l = it.get_local_id(0);
          const sycl::float4* p =
              reinterpret_cast<const sycl::float4*>(in) +
              g * (size_t(kWG) * kVecPerItem) + l;
          sycl::float4 x[kVecPerItem];
#pragma unroll
          for (int u = 0; u < kVecPerItem; ++u) x[u] = p[u * kWG];
          uint32_t acc = 0;
#pragma unroll
          for (int u = 0; u < kVecPerItem; ++u) {
#pragma unroll
            for (int j = 0; j < 4; ++j) {
              float v = x[u][j];
              if constexpr (K == 0) {
                acc += sycl::bit_cast<uint32_t>(v);
              } else {
#pragma unroll
                for (int r = 0; r < K; ++r) acc += topk_round(v, a, b);
              }
            }
          }
          // magic is a runtime value: the compiler cannot bound acc away
          if (acc == magic) out[0] = acc;
        });
  });
  if (K == 0) floor_ms = ms;
  const double gbs = kN * 4.0 / (ms * 1e-3) / 1e9;
  const double gel = kN / (ms * 1e-3) / 1e9;
  std::printf("  K=%-3d %9.3f ms  %7.1f GB/s  %7.2f Gelem/s  x%.2f of K=0\n",
              K, ms, gbs, gel, ms / floor_ms);
}

int main(int argc, char** argv) {
  sycl::queue q{sycl::property::queue::enable_profiling{}};
  const auto d = q.get_device();
  std::printf("device       : %s\n",
              d.get_info<sycl::info::device::name>().c_str());
  std::printf("compute units: %u (EUs; Xe cores = EUs / 8)\n",
              d.get_info<sycl::info::device::max_compute_units>());
  std::printf("max clock    : %u MHz\n",
              d.get_info<sycl::info::device::max_clock_frequency>());
  std::printf("launch       : %d work-items / group, sub-group %d\n", kWG,
              kSG);

  // runtime constants (argv-overridable, never folded)
  const float a = argc > 1 ? std::atof(argv[1]) : 0.999f;
  const float b = argc > 2 ? std::atof(argv[2]) : 0.001f;
  const uint32_t ia = 0x5bd1e995u, ib = 0x1b873593u;
  const uint32_t magic = argc > 3 ? std::strtoul(argv[3], nullptr, 0) : 7u;
  uint32_t* out = sycl::malloc_device<uint32_t>(1 << 20, q);

  // 1. FMA peak
  {
    const size_t items = size_t(1) << 20;
    const int iters = 2048;
    const double ms = median_ms(q, 10, [&] {
      return q.parallel_for<FmaK>(
          sycl::nd_range<1>(items, kWG),
          [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(kSG)]] {
            float x[8];
#pragma unroll
            for (int i = 0; i < 8; ++i) x[i] = float(it.get_global_id(0) + i);
            for (int n = 0; n < iters; ++n)
#pragma unroll
              for (int i = 0; i < 8; ++i) x[i] = sycl::fma(x[i], a, b);
            float s = 0;
#pragma unroll
            for (int i = 0; i < 8; ++i) s += x[i];
            if (s == 1234.5f) out[0] = 1;
          });
    });
    const double ops = double(items) * iters * 8;
    std::printf("\n[fma ] %.3f ms  %.2f T fma/s (lane-ops)  %.2f TFLOP/s\n", ms,
                ops / (ms * 1e-3) / 1e12, 2 * ops / (ms * 1e-3) / 1e12);
  }
  // 2. INT32 peak (xor + add per step)
  {
    const size_t items = size_t(1) << 20;
    const int iters = 2048;
    const double ms = median_ms(q, 10, [&] {
      return q.parallel_for<IntK>(
          sycl::nd_range<1>(items, kWG),
          [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(kSG)]] {
            uint32_t x[8];
#pragma unroll
            for (int i = 0; i < 8; ++i)
              x[i] = uint32_t(it.get_global_id(0)) * 8 + i;
            for (int n = 0; n < iters; ++n)
#pragma unroll
              for (int i = 0; i < 8; ++i) x[i] = (x[i] ^ ia) + ib;
            uint32_t s = 0;
#pragma unroll
            for (int i = 0; i < 8; ++i) s ^= x[i];
            if (s == 0x12345678u) out[0] = s;
          });
    });
    const double ops = double(items) * iters * 8 * 2;
    std::printf("[int ] %.3f ms  %.2f T int-ops/s (xor+add, lane-ops)\n", ms,
                ops / (ms * 1e-3) / 1e12);
  }

  // 3/4. read + K rounds
  float* in = sycl::malloc_device<float>(kN, q);
  q.parallel_for(sycl::range<1>(kN), [=](sycl::id<1> i) {
     in[i] = float((i[0] * 2654435761u) & 0xFFFFFF) * (1.0f / 16777216.0f);
   }).wait();
  std::printf("\n[sweep] read 1 GiB fp32 + K topk rounds per element\n");
  double floor_ms = 0;
  sweep<0>(q, in, out, a, b, magic, floor_ms);
  sweep<1>(q, in, out, a, b, magic, floor_ms);
  sweep<2>(q, in, out, a, b, magic, floor_ms);
  sweep<4>(q, in, out, a, b, magic, floor_ms);
  sweep<8>(q, in, out, a, b, magic, floor_ms);
  sweep<16>(q, in, out, a, b, magic, floor_ms);
  sweep<32>(q, in, out, a, b, magic, floor_ms);
  sweep<64>(q, in, out, a, b, magic, floor_ms);

  sycl::free(in, q);
  sycl::free(out, q);
  return 0;
}
