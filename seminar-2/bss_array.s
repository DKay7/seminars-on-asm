; RUN: ../utils/build_asm.sh bss_array.s

extern io_print_hex

section .bss
    big_array resw 1024*1024

section .text
global main

main:
    mov eax, [big_array + 7]
    call io_print_hex

    xor eax, eax
    ret
