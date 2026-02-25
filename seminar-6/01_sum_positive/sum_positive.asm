global sum_positive_asm
section .text

; int sum_positive_asm(const int *a, int n)
; Human version (intentionally worse):
; hot path uses taken branch + always executes extra jmp.
sum_positive_asm:
    mov esi, [esp + 4]      ; p = a
    mov ecx, [esp + 8]      ; n

    mov edx, ecx
    shl edx, 2
    add edx, esi            ; end = a + n*4 (without LEA)
    xor eax, eax            ; sum = 0

.loop:
    cmp esi, edx
    jae .done

    mov ecx, [esi]
    test ecx, ecx
    jg .add_hot             ; hot path uses taken branch (suboptimal layout)
    jmp .next

.add_hot:
    add eax, ecx
    jmp .next               ; extra jump even on hot path

.next:
    add esi, 4
    jmp .loop

.done:
    ret

