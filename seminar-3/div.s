global main

extern io_print_hex
extern io_print_dec
extern io_print_string
extern io_newline

section .data
    msg_div  db "DIV example (unsigned EDX:EAX / EBX): ", 0
    msg_idiv db "IDIV example (signed EDX:EAX / EBX): ", 0

section .text
main:

    ; ================================
    ; DIV (unsigned)
    ; ================================
    mov eax, msg_div
    call io_print_string
    call io_newline

    mov eax, 10
    xor edx, edx            ; high part = 0
    mov ebx, 3

    div ebx                 ; EAX = 3, EDX = 1

    push edx
    call io_print_hex       ; quotient
    call io_newline

    pop edx               
    mov eax, edx            ; remainder
    call io_print_hex
    call io_newline


    ; ================================
    ; IDIV (signed)
    ; ================================
    mov eax, msg_idiv
    call io_print_string
    call io_newline

    mov eax, -20            ; 0xFFFFFFF6
    cdq                     ; convert DW to QW: sign-extend EAX into EDX:EAX
    mov ebx, 3

    idiv ebx                ; EAX = -3, EDX = -1

    push edx
    call io_print_dec       ; quotient
    call io_newline

    pop edx
    mov eax, edx            ; remainder (signed)
    call io_print_dec
    call io_newline

    ret
