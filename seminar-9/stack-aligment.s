global main
extern printf

section .data
fmt db "Value = %d", 10, 0

section .text
main:
    push ebp
    mov  ebp, esp

    push eax      ; aligment is broken now!

    and esp, -16  ; aligment is back!

    push 123
    push fmt
    call printf
    add  esp, 8

    xor eax, eax
    leave
    ret
