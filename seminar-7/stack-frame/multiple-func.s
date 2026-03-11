
section .text
global main

main:
    push ebp
    mov  ebp, esp
    sub  esp, 4              ; local variable x

    mov  DWORD PTR [ebp-4], 10
    call func1

    mov  esp, ebp
    pop  ebp
    ret

func1:
    push ebp
    mov  ebp, esp
    sub  esp, 8              ; local variables a, b

    mov  DWORD PTR [ebp-4], 1
    mov  DWORD PTR [ebp-8], 2

    call func2

    mov  esp, ebp
    pop  ebp
    ret

func2:
    push ebp
    mov  ebp, esp
    sub  esp, 8              ; local variables p, q

    mov  DWORD PTR [ebp-4], 100
    mov  DWORD PTR [ebp-8], 200

    mov  eax, [ebp-4]
    add  eax, [ebp-8]

    mov  esp, ebp
    pop  ebp
    ret

