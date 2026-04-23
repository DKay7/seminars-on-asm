#!/usr/bin/env bash
set -euo pipefail

nodes="${1:-50000}"
rounds="${2:-1000}"
repeats="${3:-1}"
perf_repeats="${PERF_REPEATS:-3}"

make all

for bin in ./bench_c ./bench_asm; do
    echo
    echo "== $bin: internal timer =="
    "$bin" "$nodes" "$rounds" "$repeats"

    echo
    echo "== $bin: perf stat =="
    if ! perf stat \
        -r "$perf_repeats" \
        -e cycles,instructions,branches,branch-misses,cache-references,cache-misses \
        "$bin" "$nodes" "$rounds" "$repeats"; then
        echo "perf stat failed; check perf_event_paranoid/CAP_PERFMON permissions" >&2
    fi
done
