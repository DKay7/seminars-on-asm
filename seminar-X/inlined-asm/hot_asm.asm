global hot_function

section .text

; uint32_t hot_function(Node *head, uint32_t rounds)
;   [esp + 16] = head
;   [esp + 20] = rounds
;
; Node layout from main.c:
;   offset 0 = uint32_t value
;   offset 4 = Node *next
hot_function:
    push ebx
    push esi
    push edi

    mov esi, [esp + 16]     ; head
    mov edi, [esp + 20]     ; rounds
    xor eax, eax            ; sum = 0

.outer_loop:
    test edi, edi
    jz .done

    mov edx, esi            ; node = head

.inner_loop:
    test edx, edx
    jz .next_round

    mov ebx, [edx]          ; value
    xor ecx, ecx            ; selected = 0
    test ebx, ebx           ; high bit set means value >= 0x80000000
    cmovs ecx, ebx          ; selected = value if sign flag is set
    add eax, ecx            ; sum += selected
    mov edx, [edx + 4]      ; node = node->next
    jmp .inner_loop

.next_round:
    dec edi
    jmp .outer_loop

.done:
    pop edi
    pop esi
    pop ebx

    ret

