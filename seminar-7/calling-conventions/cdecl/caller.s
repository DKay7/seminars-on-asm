global main

extern add_cdecl
extern printf

section .data
fmt: db "cdecl result = %d", 10, 0

section .text

main:
    push ebp
    mov ebp, esp
    sub esp, 8

    ; add_cdecl(30,40)
    push 40
    push 30
    call add_cdecl
    add esp, 8

    ; printf("cdecl result = %d\n", result)
    push eax
    push fmt
    call printf
    add esp, 8

    xor eax, eax
    mov esp, ebp
    pop ebp
    ret
