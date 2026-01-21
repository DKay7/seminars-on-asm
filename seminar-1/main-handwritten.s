; RUN: ../utils/build_asm.sh main-handwritten.s
; RUN: ./main-handwritten

global main
extern io_print_string ; it is like function declaration in C

section .data
    msg db `Hello, world!\n`, 0 ; define a sequence of bytes, a NULL-terminated string
    len equ $ - msg             ; compute len as difference between cur ptr and msg ptr


section .text
main:
    mov eax, msg            ; io_print_string expects pointer to string in EAX reg
    call io_print_string    ; call io_print_string

    xor eax, eax ; more efficient than mov eax, 0
    ret          ; ret from main with return code = eax = 0
