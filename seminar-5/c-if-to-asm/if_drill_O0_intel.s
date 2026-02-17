	.file	"if_drill.c"
	.intel_syntax noprefix
	.text
	.globl	sum_even_only
	.type	sum_even_only, @function
sum_even_only:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	mov	DWORD PTR [ebp-4], 0
	mov	DWORD PTR [ebp-8], 0
	jmp	.L2
.L4:
	mov	eax, DWORD PTR [ebp-4]
	and	eax, 1
	test	eax, eax
	jne	.L3
	mov	eax, DWORD PTR [ebp-4]
	add	DWORD PTR [ebp-8], eax
.L3:
	add	DWORD PTR [ebp-4], 1
.L2:
	mov	eax, DWORD PTR [ebp-4]
	cmp	eax, DWORD PTR [ebp+8]
	jl	.L4
	mov	eax, DWORD PTR [ebp-8]
	leave
	ret
	.size	sum_even_only, .-sum_even_only
	.globl	main
	.type	main, @function
main:
	push	ebp
	mov	ebp, esp
	push	10
	call	sum_even_only
	add	esp, 4
	leave
	ret
	.size	main, .-main
	.section	.note.GNU-stack,"",@progbits
