// Kernel fixed-overhead / per-row parallelism micro-benchmark (SYCL, XPU).
// Same cases as cuda_bench.py; compare the printed tables directly.
//
// One work-group per row, a row = 16384 bf16 (32 KB), like the cand top-k.
// Cases:
//   empty     each work-item writes one word (launch + dispatch floor)
//   read      load the row (16 B vectors) into registers, xor, write
//   read+bar1 read + 1 work-group barrier
//   read+bar5 read + 5 barriers
//   read+alu  read + a 16-op dependent integer chain per 32-bit word
//   read+atom read + one SLM atomic per element (bin = low byte, ~uniform)
// alu / atom are run for several work-group sizes and sub-group widths with
// the same total work per row (W=256: 64 elements per work-item, 1024: 16).
//
// Time: SYCL event profiling (command_start..command_end), median of 51.
// Build: icpx -fsycl -O3 xpu_bench.cpp -o xpu_bench
// Run:   ./xpu_bench

#include <sycl/sycl.hpp>

#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <vector>

constexpr uint32_t kRowElems = 16384;       // bf16 per row
constexpr uint32_t kRowVecs = kRowElems / 8;  // 16 B vectors per row

enum Case { EMPTY, READ, BAR1, BAR5, ALU, ATOM };
static const char* kCaseName[] = {"empty", "read", "read+bar1", "read+bar5",
                                  "read+alu", "read+atom"};

using LocalAtomic = sycl::atomic_ref<uint32_t, sycl::memory_order::relaxed,
                                     sycl::memory_scope::work_group,
                                     sycl::access::address_space::local_space>;

template <int CASE, int W, int SG>
double run_once(sycl::queue& q, const uint32_t* in, uint32_t* out,
                uint32_t rows) {
  constexpr uint32_t kVecs = kRowVecs / W;  // 16 B vectors per work-item
  auto ev = q.submit([&](sycl::handler& h) {
    sycl::local_accessor<uint32_t, 1> slm(sycl::range<1>(256), h);
    h.parallel_for(
        sycl::nd_range<1>(rows * W, W),
        [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(SG)]] {
          const uint32_t tx = it.get_local_linear_id();
          const uint32_t g = it.get_group(0);
          uint32_t acc = tx;
          if constexpr (CASE == ATOM) {
            for (uint32_t i = tx; i < 256; i += W) slm[i] = 0;
          }
          if constexpr (CASE != EMPTY) {
            const uint32_t* row = in + size_t(g) * (kRowElems / 2);
            uint32_t v[kVecs][4];
#pragma unroll
            for (uint32_t i = 0; i < kVecs; ++i) {
              // contiguous slice per work-item, as in the cand kernel
              const auto w = *reinterpret_cast<const sycl::vec<uint32_t, 4>*>(
                  row + (tx * kVecs + i) * 4);
              v[i][0] = w[0]; v[i][1] = w[1]; v[i][2] = w[2]; v[i][3] = w[3];
            }
            if constexpr (CASE == BAR1 || CASE == BAR5 || CASE == ATOM)
              sycl::group_barrier(it.get_group());
            if constexpr (CASE == BAR5) {
#pragma unroll
              for (int b = 0; b < 4; ++b) sycl::group_barrier(it.get_group());
            }
#pragma unroll
            for (uint32_t i = 0; i < kVecs; ++i) {
#pragma unroll
              for (uint32_t j = 0; j < 4; ++j) {
                uint32_t x = v[i][j];
                if constexpr (CASE == ALU) {
#pragma unroll
                  for (int r = 0; r < 16; ++r) x = x * 1664525u + 1013904223u;
                } else if constexpr (CASE == ATOM) {
                  LocalAtomic(slm[x & 0xFFu]).fetch_add(1u);
                  LocalAtomic(slm[(x >> 16) & 0xFFu]).fetch_add(1u);
                }
                acc ^= x;
              }
            }
            if constexpr (CASE == ATOM) {
              sycl::group_barrier(it.get_group());
              acc += slm[tx & 255u];
            }
          }
          out[size_t(g) * W + tx] = acc;
        });
  });
  ev.wait();
  const auto t0 =
      ev.template get_profiling_info<sycl::info::event_profiling::command_start>();
  const auto t1 =
      ev.template get_profiling_info<sycl::info::event_profiling::command_end>();
  return (t1 - t0) * 1e-3;  // us
}

template <int CASE, int W, int SG>
void bench(sycl::queue& q, const uint32_t* in, uint32_t* out) {
  for (uint32_t rows : {1u, 32u}) {
    for (int i = 0; i < 5; ++i) run_once<CASE, W, SG>(q, in, out, rows);
    std::vector<double> t;
    for (int i = 0; i < 51; ++i) t.push_back(run_once<CASE, W, SG>(q, in, out, rows));
    std::sort(t.begin(), t.end());
    printf("%-10s %5d %3d %5u %10.3f %10.3f\n", kCaseName[CASE], W, SG, rows,
           t[t.size() / 2], t.front());
  }
}

int main() {
  sycl::queue q{sycl::gpu_selector_v, sycl::property::queue::enable_profiling{}};
  printf("device: %s\n", q.get_device().get_info<sycl::info::device::name>().c_str());
  const size_t words = size_t(32) * kRowElems / 2;
  std::vector<uint32_t> h(words);
  uint32_t s = 12345;
  for (auto& x : h) { s = s * 1664525u + 1013904223u; x = s; }
  uint32_t* in = sycl::malloc_device<uint32_t>(words, q);
  uint32_t* out = sycl::malloc_device<uint32_t>(32 * 1024, q);
  q.memcpy(in, h.data(), words * 4).wait();

  printf("%-10s %5s %3s %5s %10s %10s\n", "case", "WG", "SG", "rows",
         "median(us)", "min(us)");
  bench<EMPTY, 512, 32>(q, in, out);
  bench<READ, 512, 32>(q, in, out);
  bench<BAR1, 512, 32>(q, in, out);
  bench<BAR5, 512, 32>(q, in, out);
  bench<ALU, 256, 32>(q, in, out);
  bench<ALU, 512, 32>(q, in, out);
  bench<ALU, 1024, 32>(q, in, out);
  bench<ALU, 512, 16>(q, in, out);
  bench<ALU, 1024, 16>(q, in, out);
  bench<ATOM, 256, 32>(q, in, out);
  bench<ATOM, 512, 32>(q, in, out);
  bench<ATOM, 1024, 32>(q, in, out);
  bench<ATOM, 512, 16>(q, in, out);
  bench<ATOM, 1024, 16>(q, in, out);
  sycl::free(in, q);
  sycl::free(out, q);
  return 0;
}
