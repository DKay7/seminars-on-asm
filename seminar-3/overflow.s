; RUN: ../utils/build_asm.sh overflow.s

global main
extern io_print_hex
extern io_print_string
extern io_newline


section .text

; -----------------------------------------------
; save_flags
;
; save flags ZF, SF, CF, OF into .data section
;
; EXPECTS:  None
;
; DESTROYS: None
;
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
; print flag to stdout
;
; EXPECTS:  %1 = String to print
;           %2 = Flag value
;
; DESTROYS: None
;
;
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
; prints flags ZF, SF, CF, OF
;
; EXPECTS:  EAX -- header message
;
; DESTROYS: EAX
;
;
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
    
    mov eax, init_msg
    call print_flags

    ; -----------------------------------------------
    ; SIGNED OVERFLOW -- ADD
    ; -----------------------------------------------
    mov eax, 0x7FFFFFFF
    add eax, 1

    mov eax, s_overflow_msg
    call print_flags


    ; -----------------------------------------------
    ; UNSIGNED OVERFLOW  -- ADD
    ; -----------------------------------------------
    
    mov eax, 0xFFFFFFFF
    add eax, 1

    mov eax, u_overflow_msg
    call print_flags


    ; -----------------------------------------------
    ; SIGNED OVERFLOW  -- SUB
    ; -----------------------------------------------
    mov eax, 0x80000000
    sub eax, 1

    mov eax, s_overflow_msg
    call print_flags


    ; -----------------------------------------------
    ; UNSIGNED OVERFLOW  -- SUB
    ; -----------------------------------------------
    mov eax, 0
    sub eax, 1

    mov eax, u_overflow_msg
    call print_flags
    
     ret


section .data
    zf_msg db `ZERO [ZF] = `, 0
    sf_msg db `SIGN [SF] = `, 0
    cf_msg db `UNSIGNED-OVERFLOW (CARRY) [CF] = `, 0
    of_msg db `SIGNED-OVERFLOW [OF] = `, 0
    
    init_msg        db  `Initial state`, 0
    s_overflow_msg  db  `Signed overflow`, 0
    u_overflow_msg  db  `Unsigned overflow`, 0
    zero_res        db  `Result of last instruction is ZERO`, 0
    negative_res    db  `Result of last instruction is NEGATIVE`, 0

    zf_flag db 0
    sf_flag db 0
    cf_flag db 0
    of_flag db 0
