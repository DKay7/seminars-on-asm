; RUN: ../utils/build_asm.sh vars.s

extern io_print_hex

section .data
    some_2bytes_var dw 0xAABB
    some_4bytes_var dd 0x1234789A
    

section .text

global main

main:
    xor eax, eax ; clear eax
	; mov eax, [some_2bytes_var] ; eax = *some_2bytes_var;
    movzx eax, WORD [some_2bytes_var]

	call io_print_hex

	xor eax, eax 
	ret

