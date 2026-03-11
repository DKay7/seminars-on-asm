	.file	"funcs.c"
	.intel_syntax noprefix
	.text
	.globl	add_sysv
	.type	add_sysv, @function
add_sysv:
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -24[rbp], esi
	mov	eax, DWORD PTR -20[rbp]
	add	eax, 1
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -24[rbp]
	add	eax, 2
	mov	DWORD PTR -4[rbp], eax
	mov	edx, DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	eax, edx
	pop	rbp
	ret
	.size	add_sysv, .-add_sysv
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
