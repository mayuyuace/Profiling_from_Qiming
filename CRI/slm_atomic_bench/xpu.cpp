// SLM atomic throughput micro-benchmark (SYCL / Intel XPU).
// Same kernel logic as cuda.cu; compare the printed numbers directly.
//
// One WG = 512 work-items (sub-group 32). Each work-item does N operations on
// SLM at an address given by `pattern`; the per-op cost is the slope
// (t(N) - t(0)) / N, so launch / barrier / write-back cancel out.
//
// Modes:   atom      fetch_add, result unused (non-returning atomic)
//          atom_ret  fetch_add, result accumulated (returning atomic)
//          plain     volatile load + store (non-atomic RMW), same addresses
//          alu       no SLM, integer ALU only (loop overhead floor)
// Patterns (per sub-group of 32 lanes):
//          uniq      32 distinct consecutive words        (no conflict)
//          k2/k4/k8  lanes share an address in groups of k (k-way same addr)
//          k32       whole sub-group on one address
//          wg        whole WG on one address
//          bank      32 distinct words, stride 32 words   (same bank)
//          xsg       lane L -> word L for every sub-group (no conflict inside
//                    a message, all 16 sub-groups hit the same 32 words)
//
// Build: icpx -fsycl -O3 xpu.cpp -o xpu_bench
// Run:   ./xpu_bench [N=1024]

#include <sycl/sycl.hpp>

#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <vector>

constexpr uint32_t kWG = 512;
constexpr uint32_t kRegion = 2048;           // words per address region
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

inline uint32_t addr_of(int pat, uint32_t k, uint32_t lane, uint32_t sg) {
  if (pat == KWAY) return sg * 32 + lane / k;
  if (pat == BANK) return lane * 32 + sg;
  if (pat == XSG) return lane;
  return 0;
}

template <int MODE>
double run_once(
    sycl::queue& q, uint32_t* out, uint32_t groups, int n, int pat,
    uint32_t k) {
  auto ev = q.submit([&](sycl::handler& h) {
    sycl::local_accessor<uint32_t, 1> slm(sycl::range<1>(kSlmWords), h);
    h.parallel_for(
        sycl::nd_range<1>(groups * kWG, kWG),
        [=](sycl::nd_item<1> it) [[sycl::reqd_sub_group_size(32)]] {
          const uint32_t tid = it.get_local_id(0);
          const uint32_t lane = tid & 31u;
          const uint32_t sg = tid >> 5;
          uint32_t* S = &slm[0];
          for (uint32_t i = tid; i < kSlmWords; i += kWG) S[i] = 0;
          sycl::group_barrier(it.get_group());

          const uint32_t a = addr_of(pat, k, lane, sg);
          uint32_t acc = 0;
          for (int i = 0; i < n; ++i) {
            // alternate two regions so consecutive ops are not foldable
            const uint32_t ai = a + (static_cast<uint32_t>(i) & 1u) * kRegion;
            if constexpr (MODE == ATOM) {
              sycl::atomic_ref<
                  uint32_t, sycl::memory_order::relaxed,
                  sycl::memory_scope::work_group,
                  sycl::access::address_space::local_space>(S[ai])
                  .fetch_add(1u);
            } else if constexpr (MODE == ATOM_RET) {
              acc += sycl::atomic_ref<
                         uint32_t, sycl::memory_order::relaxed,
                         sycl::memory_scope::work_group,
                         sycl::access::address_space::local_space>(S[ai])
                         .fetch_add(1u);
            } else if constexpr (MODE == PLAIN) {
              volatile uint32_t* V = S;
              V[ai] = V[ai] + 1u;
            } else {
              acc = acc * 1664525u + ai;
            }
          }
          sycl::group_barrier(it.get_group());
          out[it.get_global_id(0)] = S[tid] + acc;
        });
  });
  ev.wait();
  const auto t0 =
      ev.template get_profiling_info<sycl::info::event_profiling::command_start>();
  const auto t1 =
      ev.template get_profiling_info<sycl::info::event_profiling::command_end>();
  return (t1 - t0) * 1e-3;  // us
}

template <int MODE>
double run_med(
    sycl::queue& q, uint32_t* out, uint32_t groups, int n, int pat,
    uint32_t k) {
  for (int w = 0; w < 3; ++w) run_once<MODE>(q, out, groups, n, pat, k);
  std::vector<double> t;
  for (int r = 0; r < 21; ++r)
    t.push_back(run_once<MODE>(q, out, groups, n, pat, k));
  std::sort(t.begin(), t.end());
  return t[t.size() / 2];
}

template <int MODE>
void bench(
    sycl::queue& q, uint32_t* out, uint32_t units, uint32_t groups, int n,
    const PatDesc& p) {
  const double t0 = run_med<MODE>(q, out, groups, 0, p.pat, p.k);
  const double tn = run_med<MODE>(q, out, groups, n, p.pat, p.k);
  const double dt = tn - t0;                            // us
  const double ops = double(groups) * kWG * n;          // lane-ops total
  const double per_unit = ops / (dt * 1e3) / std::min(groups, units);
  printf(
      "%-9s %-5s %6u %10.2f %10.2f %12.3f %16.3f\n", kModeNames[MODE], p.name,
      groups, t0, tn, dt * 1e3 / n, per_unit);
}

int main(int argc, char** argv) {
  const int n = argc > 1 ? atoi(argv[1]) : 1024;
  sycl::queue q{sycl::gpu_selector_v, sycl::property::queue::enable_profiling{}};
  const auto d = q.get_device();
  uint32_t units = 0;
  if (d.has(sycl::aspect::ext_intel_gpu_slices) &&
      d.has(sycl::aspect::ext_intel_gpu_subslices_per_slice))
    units = d.get_info<sycl::ext::intel::info::device::gpu_slices>() *
            d.get_info<sycl::ext::intel::info::device::gpu_subslices_per_slice>();
  if (units == 0) units = d.get_info<sycl::info::device::max_compute_units>();
  printf(
      "device: %s | units (XeCore): %u | WG %u | N %d\n",
      d.get_info<sycl::info::device::name>().c_str(), units, kWG, n);

  const uint32_t full = units * 4;  // 4 x 512 = 2048 work-items per unit
  uint32_t* out = sycl::malloc_device<uint32_t>(size_t(full) * kWG, q);

  printf(
      "%-9s %-5s %6s %10s %10s %12s %16s\n", "mode", "pat", "WGs", "t0(us)",
      "tN(us)", "ns/iter/WG", "lane-ops/ns/unit");
  for (uint32_t groups : {1u, full}) {
    for (const auto& p : kPats) {
      bench<ATOM>(q, out, units, groups, n, p);
      bench<ATOM_RET>(q, out, units, groups, n, p);
      bench<PLAIN>(q, out, units, groups, n, p);
    }
    bench<ALU>(q, out, units, groups, n, kPats[0]);
  }
  sycl::free(out, q);
  return 0;
}
