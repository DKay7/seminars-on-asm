

extern io_print_hex
extern io_newline

section .text
global main

main:

    ; ----------------------------
    ; SHL - shift left LOGICAL
    ; ----------------------------
    mov eax, 0x00000011      ;  0001 0001b
    shl eax, 1               ;  0010 0010b == 0x22
    call io_print_hex
    call io_newline

    ; ----------------------------
    ; SHR - shift right LOGICAL
    ; ----------------------------
    mov eax, 0x00000011      ; 0001 0001b
    shr eax, 1               ; 0000 1000b = 0x8
    call io_print_hex
    call io_newline

    ; ----------------------------
    ; SAR - shift right ARITHMETIC
    ; ----------------------------
    xor eax, eax
    mov ah, 0b10000001      ; negative value = -2 == 1000 0000 0000 0000 0000 0000 0001 0001
    sar ah, 1               ; highest bit ( = sign bit) is saved == 0xc0000008
    call io_print_hex
    call io_newline

    ; ----------------------------
    ; SAL - shift left ARITHMETIC
    ; ----------------------------
    mov eax, 0x00000011
    sal eax, 1
    call io_print_hex
    call io_newline

    ; ----------------------------
    ; ROL - ROtate Left = cyclic shift left
    ; ----------------------------
    mov eax, 0x80000001      ; 
    rol eax, 1               ; highest bit becomes lowest one
    call io_print_hex
    call io_newline

    ; ----------------------------
    ; ROR - ROtate Right = cyclic shift right
    ; ----------------------------
    mov eax, 0x80000001
    ror eax, 1
    call io_print_hex
    call io_newline

    ; ----------------------------
    ; RCL — Rotate Carry left -- cyclic shift via CF
    ; ----------------------------
    clc
    ;stc                      ; makes CF = 1
    mov eax, 0x80000000
    rcl eax, 1               ; CF is used here
    call io_print_hex
    call io_newline

    ; ----------------------------
    ; RCR — Rotate Carry Right -- cyclic shift via CF
    ; ----------------------------
    stc                      ; makes CF = 1
    mov eax, 0x00000001
    rcr eax, 2
    call io_print_hex
    call io_newline

    ret
