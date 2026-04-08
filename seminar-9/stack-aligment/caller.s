; RUN: nasm -felf32 caller.s -o caller.o
; RUN: gcc -m32 -fno-pie callee.c caller.o -msse2 -o boom

global  main
extern  i_need_stack_aligned

section .text
main:
    push    ebp
    mov     ebp, esp

    sub     esp, 4  ; breaking stack aligment!
    and esp, -16    ; comment this line to get segfault!

    call    i_need_stack_aligned
    add     esp, 4

    xor     eax, eax
    leave
    ret
