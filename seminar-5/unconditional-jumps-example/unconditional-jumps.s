; RUN: ../../utils/build_asm.sh unconditional-jumps.s

global main

section .text

main:
    jmp .after_skip       ; unconditional jump to local label

.skip:
    nop                   ; never executed

.after_skip:
    call helper           ; call global label (function-like block)
    jmp .done             ; another unconditional jump

.done:
    xor eax, eax
    ret

helper:
    jmp .ret_here         ; local label inside helper scope

.ret_here:
    ret
