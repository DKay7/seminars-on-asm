global main

extern io_print_hex
extern io_print_string
extern io_newline

section .data
    msg_mul  db "MUL example (EAX * EBX): ", 0
    msg_imul db "IMUL example (signed EAX * EBX): ", 0

section .text
main:

    ; ================================
    ; MUL (unsigned)
    ; ================================
    mov eax, msg_mul
    call io_print_string
    call io_newline

    mov eax, 0xFFFFFFFF    ; 4294967295 (unsigned)
    mov ebx, 2

    mul ebx                ; EDX:EAX = EAX * EBX (unsigned)

    push eax
    mov eax, edx           ; high 32 bits
    call io_print_hex
    pop eax                ; low 32 bits
    call io_print_hex
    call io_newline


    ; ================================
    ; IMUL (signed)
    ; ================================
    mov eax, msg_imul
    call io_print_string
    call io_newline

    mov eax, -1            ; 0xFFFFFFFF (signed -1)
    mov ebx, 2

    imul ebx               ; EDX:EAX = EAX * EBX (signed)

    push eax
    mov eax, edx           ; high 32 bits (sign extension)
    call io_print_hex
    pop eax                ; low 32 bits
    call io_print_hex
    call io_newline

    ret
