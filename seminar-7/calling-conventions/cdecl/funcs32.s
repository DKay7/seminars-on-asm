	.file	"funcs.c"
	.intel_syntax noprefix
	.text
	.globl	add_cdecl
	.type	add_cdecl, @function
add_cdecl:
	push	ebp
	mov	ebp, esp
	sub	esp, 16
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	mov	eax, DWORD PTR 8[ebp]
	add	eax, 3
	mov	DWORD PTR -8[ebp], eax
	mov	eax, DWORD PTR 12[ebp]
	add	eax, 4
	mov	DWORD PTR -4[ebp], eax
	mov	edx, DWORD PTR -8[ebp]
	mov	eax, DWORD PTR -4[ebp]
	add	eax, edx
	leave
	ret
	.size	add_cdecl, .-add_cdecl
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
