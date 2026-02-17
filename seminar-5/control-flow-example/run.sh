#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

bin_file="eip-control-flow"
disasm_file="eip-control-flow.objdump.s"

../../utils/build_asm.sh eip-control-flow.s

objdump -d -M intel "./$bin_file" > "$disasm_file"
gdb -q -nx -x gdb-interactive.cmds
