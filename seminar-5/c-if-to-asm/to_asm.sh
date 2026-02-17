#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

src="if_drill.c"
out="if_drill_O0_intel.s"

gcc \
  -m32 \
  -O0 \
  -fno-pie \
  -S \
  -masm=intel \
  -fno-asynchronous-unwind-tables \
  -fno-unwind-tables \
  -fno-dwarf2-cfi-asm \
  -fno-ident \
  -fno-stack-protector \
  "$src" \
  -o "$out"

echo "Generated: $out"
