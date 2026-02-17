; RUN: ./run.sh

global main
extern io_print_string
extern io_newline

section .data
    negative_msg db `NEGATIVE`, 0
    zero_msg db `ZERO`, 0
    positive_msg db `POSITIVE`, 0

section .text

; -----------------------------------------------
; dispatch_sign
;
; select message by signed value in EAX
;
; EXPECTS:  EAX -- signed value
; DESTROYS: EAX
; RETURNS:  None
; -----------------------------------------------
dispatch_sign:
    cmp eax, 0
    jl .neg
    je .zero

.pos:
    mov eax, positive_msg
    jmp print_msg

.zero:
    mov eax, zero_msg
    jmp print_msg

.neg:
    mov eax, negative_msg
    jmp print_msg

; -----------------------------------------------
; print_msg
;
; print zero-terminated string from EAX
;
; EXPECTS:  EAX -- pointer to string
; DESTROYS: EAX
; RETURNS:  None
; -----------------------------------------------
print_msg:
    call io_print_string
    ret

; -----------------------------------------------
; main
;
; run one demonstration case for dispatch_sign
;
; EXPECTS:  None
; DESTROYS: EAX
; RETURNS:  EAX = 0
; -----------------------------------------------
main:
    mov eax, -1
    call dispatch_sign

    xor eax, eax
    ret
