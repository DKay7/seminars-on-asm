; RUN: ../../utils/build_asm.sh loops.s
; RUN: ./loops

global main
extern io_print_hex
extern io_newline

section .text

main:
    xor ebx, ebx            ; i = 0

.loop:
    cmp ebx, 5              ; while (i < 5)
    jge .done

    mov eax, ebx
    call io_print_hex
    call io_newline

    inc ebx
    jmp .loop

.done:
    xor eax, eax
    ret
