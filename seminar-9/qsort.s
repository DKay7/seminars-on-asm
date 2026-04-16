; RUN: ../utils/build_asm.sh qsort.s

section .data
    array dd 10, 3, 5, 1, 9, 8, 2, 7, 4, 6   ; array
    elem_size dd 4                           ; sizeof(int)
    count dd 10                              ; size of array

section .text
    global main
    extern qsort
    extern io_print_dec
    extern io_print_char

; comparator:
; int cmp(const void *a, const void *b)
; returns 
;   > 0, if a > b; 
;     0, if a == b;
;   < 0, if a < b
cmp:
    push ebp
    mov ebp, esp

    mov eax, dword [ebp + 8]    ; a;  sizeof(a)  = ptr = 4 bytes = dword
    mov eax, dword [eax]        ; *a; sizeof(*a) = int = 4 bytes = dword

    mov edx, dword [ebp + 12]   ; b
    mov edx, dword [edx]        ; *b

    sub eax, edx                ; return *a - *b

    pop ebp
    ret

main:
    push ebp
    mov ebp, esp
    
    and esp, -16  ; stack aligment

    ; qsort(array, count, elem_size, cmp)
    sub esp, 16             ; for aligment

    mov dword [esp + 12], cmp     ; cmp is a label which is also a pointer to comparator function
  
    mov eax, dword [elem_size]
    mov [esp + 8 ], eax

    mov eax, dword [count] 
    mov [esp + 4 ], eax 

    mov dword [esp], array
    
    call qsort
    add esp, 16           ; cleaning stack
  
    mov ecx, 0
  
.out_loop:
    mov eax, [array + ecx * 4] ; assume that elem_size = 4
    push ecx
    call io_print_dec
    mov eax, 10                ; \n
    call io_print_char
    pop ecx

    inc ecx
    cmp ecx, [count]
    jl .out_loop

    xor eax, eax
    leave
    ret
