	.file	"if_drill.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Is even!"
.LC1:
	.string	"Is odd!"
	.text
	.globl	is_odd
	.type	is_odd, @function
is_odd:
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	mov	eax, DWORD PTR [ebp+8]
	and	eax, 1
	test	eax, eax
	jne	.L2
	sub	esp, 12
	push	OFFSET FLAT:.LC0
	call	puts
	add	esp, 16
	mov	eax, 1
	jmp	.L3
.L2:
	sub	esp, 12
	push	OFFSET FLAT:.LC1
	call	puts
	add	esp, 16
	mov	eax, 0
.L3:
	leave
	ret
	.size	is_odd, .-is_odd
	.globl	main
	.type	main, @function
main:
	lea	ecx, [esp+4]
	and	esp, -16
	push	DWORD PTR [ecx-4]
	push	ebp
	mov	ebp, esp
	push	ecx
	sub	esp, 4
	sub	esp, 12
	push	10
	call	is_odd
	add	esp, 16
	mov	ecx, DWORD PTR [ebp-4]
	leave
	lea	esp, [ecx-4]
	ret
	.size	main, .-main
	.section	.note.GNU-stack,"",@progbits
