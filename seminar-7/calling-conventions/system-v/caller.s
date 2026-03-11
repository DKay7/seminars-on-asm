global main

extern add_sysv
extern printf

section .data
fmt: db "sysv result = %d", 10, 0

section .text

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16

    ; add_sysv(10,20)
    mov edi, 10
    mov esi, 20
    call add_sysv

    mov [rbp-4], eax

    ; printf("sysv result = %d\n", result)
    mov esi, [rbp-4]     ; 2nd arg
    lea rdi, [rel fmt]   ; 1st arg
    xor eax, eax         ; required for variadic functions
    call printf

    xor eax, eax
    leave
    ret
