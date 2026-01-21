; RUN: ../utils/build_asm.sh mov.s

extern io_print_hex
extern io_newline

section .data
    byte_var   db 0xFF          ; 8 bit
    word_var   dw 0x1234        ; 16 bit
    dword_var  dd 0x12345678    ; 32 bit

section .text
global main

main:
    ; --------------------------------------------------
    ; 1. LOADING ADDRESS
    ; --------------------------------------------------
    mov eax, byte_var
    call io_print_hex
    call io_newline

    ; --------------------------------------------------
    ; 2. LOADING VALUE
    ; --------------------------------------------------
    mov eax, [byte_var]
    call io_print_hex           ; some-trash ff
    call io_newline

    ; --------------------------------------------------
    ; 3. ZERO-EXTENDED
    ; --------------------------------------------------
    movzx eax, byte [byte_var]
    call io_print_hex           ; 000000FF
    call io_newline

    ; --------------------------------------------------
    ; 4. SIGN-EXTENDED
    ; --------------------------------------------------
    movsx eax, byte [byte_var]
    call io_print_hex           ; FFFFFFFF (-1)
    call io_newline

    ; --------------------------------------------------
    ; 5. read WROD from memory
    ; --------------------------------------------------
    movzx eax, word [word_var]
    call io_print_hex           ; 00001234
    call io_newline

    ; --------------------------------------------------
    ; 6. just reading from memory 
    ; --------------------------------------------------
    mov eax, [dword_var]
    call io_print_hex           ; 12345678
    call io_newline

    ; --------------------------------------------------
    ; 7. write to memory with size
    ; --------------------------------------------------
    mov byte  [byte_var], 0x7F
    movzx eax, byte [byte_var]
    call io_print_hex           ; 0000007F
    call io_newline

    ; --------------------------------------------------
    ; 8. an error!
    ; --------------------------------------------------
    mov eax, [word_var]         ; reading 4 bytes, but we have only 2!
    call io_print_hex           ; gonna see something like 00001234 and trash
    call io_newline

    xor eax, eax
    ret
