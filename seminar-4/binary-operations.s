

global main
extern io_print_hex
extern io_newline

%macro put_values 0
    mov eax, 12        ; A = 1100b
    mov ebx, 10        ; B = 1010b
%endmacro


%macro print_hex_newline 0
    call io_print_hex
    call io_newline
%endmacro

section .text
main:
    put_values

    ; AND
    and eax, ebx       ; 1100 & 1010 = 1000 (8)
    print_hex_newline

    ; OR
    put_values
    or eax, ebx        ; 1100 | 1010 = 1110 (14 = e)
    print_hex_newline

    ; XOR
    put_values
    xor eax, ebx       ; 1100 ^ 1010 = 0110 (6)
    print_hex_newline

    ; NOT
    put_values
    not eax            ; ~1100 = fffffff3
    print_hex_newline

    ret
