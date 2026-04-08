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
    sub esp, 16                 ; to keep stack aligned
    mov dword [esp], src_len
    call    malloc
    add     esp, 16
  
    ; check if NULL retured
    test    eax, eax
    jz      .fail
  
    mov     esi, eax

    ; void *memcpy(void *dest, const void *src, size_t n);
    sub esp, 16                 ; to keep stack aligned
    mov dword [esp + 8], src_len
    mov dword [esp + 4], src
    mov dword [esp], esi
    call    memcpy
    add     esp, 16

    ; int puts(const char *s);
    sub esp, 16                 ; to keep stack aligned
    mov dword [esp], esi
    call    puts
    add     esp, 16

    ; void free(void *ptr);
    sub esp, 16                 ; to keep stack aligned
    mov dword [esp], esi
    call    free
    add     esp, 16

    xor     eax, eax         ; return 0
    jmp     .done

.fail:
    mov     eax, 1           ; return 1

.done:
    mov     esp, ebp
    pop     ebp
    ret
