	.text
	.intel_syntax noprefix
	.file	"sum_positive_demo.c"
	.globl	sum_positive_c
	.p2align	4, 0x90
	.type	sum_positive_c,@function
sum_positive_c:
	push	eax
	mov	ecx, dword ptr [esp + 12]
	mov	dword ptr [esp], 0
	test	ecx, ecx
	jle	.done
	mov	eax, dword ptr [esp + 8]
	lea	ecx, [eax + 4*ecx]
	jmp	.loop_head
	.p2align	4, 0x90
.loop_next:
	add	eax, 4
	cmp	eax, ecx
	jae	.done
.loop_head:
	mov	edx, dword ptr [eax]
	test	edx, edx
	jle	.loop_next
	add	dword ptr [esp], edx
	jmp	.loop_next
.done:
	mov	eax, dword ptr [esp]
	pop	ecx
	ret
.func_end:
	.size	sum_positive_c, .func_end-sum_positive_c

	.section	".note.GNU-stack","",@progbits
	.addrsig
