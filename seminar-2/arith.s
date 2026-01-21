; RUN: ../utils/build_asm.sh arith.s

extern io_print_dec
extern io_newline

section .data
    a dd 10
    b dd 3

section .text
global main

main: 
    ; ---------------------------
    ; ADD
    ; ---------------------------
    mov eax, [a]      ; eax = 10
    add eax, [b]      ; eax = 10 + 3 = 13; ADD A, B
    call io_print_dec
    call io_newline

    ; ---------------------------
    ; SUB
    ; ---------------------------
    mov eax, [a]      ; eax = 10
    sub eax, [b]      ; eax = 10 - 3 = 7
    call io_print_dec
    call io_newline

    ; ---------------------------
    ; NEG
    ; ---------------------------
    mov eax, [b]      ; eax = 3
    neg eax           ; eax = -3
    call io_print_dec
    call io_newline

    xor eax, eax
    ret
