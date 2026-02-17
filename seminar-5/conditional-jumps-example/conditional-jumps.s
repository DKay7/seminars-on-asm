; RUN: ../../utils/build_asm.sh conditional-jumps.s
; RUN: ./conditional-jumps

global main
extern io_print_string
extern io_newline

section .data
    intro_msg db `CMP EAX, EBX where EAX = 0xFFFFFFFF and EBX = 1`, 0
    signed_msg db `signed: JL is taken (-1 < 1)`, 0
    unsigned_msg db `unsigned: JA is taken (0xFFFFFFFF > 1)`, 0

section .text

print_line:
    call io_print_string
    call io_newline
    ret

main:
    mov eax, intro_msg
    call print_line

    ; signed compare: -1 < 1
    mov eax, 0xFFFFFFFF
    mov ebx, 1
    cmp eax, ebx
    jl .signed_less
    jmp .after_signed

.signed_less:
    mov eax, signed_msg
    call print_line

    ; fall-thrugh to after_signed

.after_signed:
    ; unsigned compare: 0xFFFFFFFF == INT_MAX  > 1
    mov eax, 0xFFFFFFFF
    mov ebx, 1
    cmp eax, ebx
    ja .unsigned_above
    jmp .done

.unsigned_above:
    mov eax, unsigned_msg
    call print_line

.done:
    xor eax, eax
    ret
