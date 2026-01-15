; main-handwritten (NASM, Linux x86-64)
; RUN: nasm -f elf64 main-handwritten.asm -o main.o
; RUN: ld main.o -o main-handwritten
; RUN: ./hello
; RUN: hexdump main.o -C
; RUN: objdump main.o -s

global _start

section .data
msg db "Hello, world!", 10 ; 10 is ASCII-code of \n

len equ $ - msg

array db 100 dup 10
array_len equ $ - array

section .text
_start:
    ; write(1, msg, len)
    mov rax, 1          ; syscall nummber: sys_write
    mov rdi, 1          ; fd = stdout
    mov rsi, msg        ; buffer
    mov rdx, len        ; count
    syscall

    ; exit(0)
    mov rax, 60         ; syscall number: sys_exit xor rdi, rdi        ; status = 0
    mov rdi, 0
    syscall

