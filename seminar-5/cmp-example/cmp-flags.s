; RUN: ../../utils/build_asm.sh cmp-flags.s
; RUN: ./cmp-flags

global main
extern io_print_hex
extern io_print_string
extern io_newline

section .text

; -----------------------------------------------
; save_flags
;
; save ZF, SF, CF, OF from current EFLAGS into .data
;
; EXPECTS:  None
; DESTROYS: None
; RETURNS:  None
; -----------------------------------------------
save_flags:
    setz byte [zf_flag]
    sets byte [sf_flag]
    setc byte [cf_flag]
    seto byte [of_flag]
    ret

; -----------------------------------------------
; MACRO print_one_flag
;
; print one flag as 0/1 in hex
;
; EXPECTS:  %1 = text label, %2 = byte memory with flag
; DESTROYS: EAX
; RETURNS:  None
; -----------------------------------------------
%macro print_one_flag 2
    mov eax, %1
    call io_print_string

    movzx eax, byte %2
    call io_print_hex
    call io_newline
%endmacro

; -----------------------------------------------
; print_flags
;
; print case title and saved flags
;
; EXPECTS:  EAX -- pointer to case title
; DESTROYS: EAX
; RETURNS:  None
; -----------------------------------------------
print_flags:
    call save_flags

    call io_print_string
    call io_newline

    print_one_flag zf_msg, [zf_flag]
    print_one_flag sf_msg, [sf_flag]
    print_one_flag cf_msg, [cf_flag]
    print_one_flag of_msg, [of_flag]

    call io_newline
    ret

main:
    mov eax, intro_msg
    call io_print_string
    call io_newline
    call io_newline

    ; CASE 1: EAX == EBX
    mov eax, 5
    mov ebx, 5
    cmp eax, ebx
    mov eax, case1_msg
    call print_flags

    ; CASE 2: unsigned borrow (1 < 2)
    mov eax, 1
    mov ebx, 2
    cmp eax, ebx
    mov eax, case2_msg
    call print_flags

    ; CASE 3: signed overflow in comparison (-2147483648 ? 1)
    mov eax, 0x80000000
    mov ebx, 1
    cmp eax, ebx
    mov eax, case3_msg
    call print_flags

    ; CASE 4: -1 ? 1
    mov eax, 0xFFFFFFFF
    mov ebx, 1
    cmp eax, ebx
    mov eax, case4_msg
    call print_flags

    ; CASE 5: 1 ? -1
    mov eax, 1
    mov ebx, 0xFFFFFFFF
    cmp eax, ebx
    mov eax, case5_msg
    call print_flags

    xor eax, eax
    ret

section .data
    intro_msg db `Guess relation from flags first, then verify by running.`, 0

    case1_msg db `CASE 1: cmp eax=5, ebx=5`, 0
    case2_msg db `CASE 2: cmp eax=1, ebx=2`, 0
    case3_msg db `CASE 3: cmp eax=0x80000000, ebx=1`, 0
    case4_msg db `CASE 4: cmp eax=0xFFFFFFFF, ebx=1`, 0
    case5_msg db `CASE 5: cmp eax=1, ebx=0xFFFFFFFF`, 0

    zf_msg db `ZF = `, 0
    sf_msg db `SF = `, 0
    cf_msg db `CF = `, 0
    of_msg db `OF = `, 0

    zf_flag db 0
    sf_flag db 0
    cf_flag db 0
    of_flag db 0
