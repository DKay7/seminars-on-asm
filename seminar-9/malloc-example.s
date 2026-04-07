; RUN: ../utils/build_asm.sh malloc-example.s

global  main

; We have to EXTERN our functions
; It is much similar to what `#include` does in C
extern  malloc
extern  free
extern  memcpy
extern  puts

section .data
    src     db "I'd love to be allocated in heap", 0
    src_len equ $ - src

section .text
main:
    ; stack is aligned when enetered main

    push    ebp
    mov     ebp, esp

    ; void *malloc(size_t size);
    push    src_len
    call    malloc
    add     esp, 4
  
    ; check if NULL retured
    test    eax, eax
    jz      .fail
  
    mov     esi, eax

    ; void *memcpy(void *dest, const void *src, size_t n);
    push    src_len          ; n
    push    src              ; src
    push    esi              ; dest
    call    memcpy
    add     esp, 12

    ; int puts(const char *s);
    push    esi
    call    puts
    add     esp, 4

    ; void free(void *ptr);
    push    esi
    call    free
    add     esp, 4

    xor     eax, eax         ; return 0
    jmp     .done

.fail:
    mov     eax, 1           ; return 1

.done:
    mov     esp, ebp
    pop     ebp
    ret
