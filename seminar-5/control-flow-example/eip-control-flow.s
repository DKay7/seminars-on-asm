; RUN: ./run.sh

global main
extern io_print_string
extern io_newline

section .data
    negative_msg db `NEGATIVE`, 0
    zero_msg db `ZERO`, 0
    positive_msg db `POSITIVE`, 0

section .text


dispatch_sign:
    cmp eax, 0
    jl .neg
    je .zero

.pos:
    mov eax, positive_msg
    jmp print_msg

.zero:
    mov eax, zero_msg
    jmp print_msg

.neg:
    mov eax, negative_msg

print_msg:
    call io_print_string
    call io_newline
    ret

main:
    mov eax, -1
    call dispatch_sign

    xor eax, eax
    ret
