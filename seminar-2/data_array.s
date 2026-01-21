; RUN: ../utils/build_asm.sh data_array.s
; RUN: ls -lah data_array

extern io_print_hex

section .data
    big_array times 1024*1024 dw 0x6565; 2MB

section .text
global main
main:
    movzx eax, WORD [big_array + 7]
    call io_print_hex

    xor eax, eax
    ret
