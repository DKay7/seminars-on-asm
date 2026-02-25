
lazy_chain:
    mov	eax, dword ptr [g_p]
    test	eax, eax
    je	.LBB0_3
    mov	ecx, dword ptr [eax + 4]
    test	ecx, ecx
    je	.LBB0_3
    mov	eax, 1
    cmp	dword ptr [ecx], 0
    jle	.LBB0_3
    ret
.LBB0_3:
    xor	eax, eax
    ret

eager_chain:
    mov	ecx, dword ptr [g_p]
    xor	eax, eax
    test	ecx, ecx
    je	.LBB1_3
    mov	ecx, dword ptr [ecx + 4]
    test	ecx, ecx
    je	.LBB1_3
    xor	eax, eax
    cmp	dword ptr [ecx], 0
    setg	al
.LBB1_3:
    ret
