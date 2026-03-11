#!/usr/bin/env bash
set -e

echo "building x86-64 version..."
cd system-v

# more flags to make asm more readable
gcc -O0 -fno-omit-frame-pointer -no-pie funcs.c -S -masm=intel -fcf-protection=none -fno-asynchronous-unwind-tables -fno-unwind-tables -o funcs64.s

gcc -O0 -fno-omit-frame-pointer -no-pie -c funcs.c -o funcs64.o
nasm -f elf64 caller.s -o main64.o
gcc -no-pie main64.o funcs64.o -o calling-conv64
rm *.o
cd -

echo "building x86-32 version..."
cd cdecl

# more flags to make asm more readable
gcc -m32 -O0 -fno-omit-frame-pointer -no-pie -S -masm=intel funcs.c -fcf-protection=none -fno-asynchronous-unwind-tables -fno-unwind-tables -o funcs32.s

gcc -m32 -O0 -fno-omit-frame-pointer -no-pie -c funcs.c -o funcs32.o
nasm -f elf32 caller.s -o main32.o
gcc -m32 -no-pie main32.o funcs32.o -o calling-conv32
rm *.o
cd -

echo "done"
