; RUN: ../utils/build_asm.sh printf-example.s 

global  main
extern  printf
extern  scanf

%define EMOJI_MIND_BLOWN 0xF0, 0x9F, 0xA4, 0xAF
        ;   /\
        ;    \ this is just bytecode of an emoji

section .data
    fmt_hello   db "Enter an integer: ", 0
    fmt_in      db "%d", 0

    fmt_out     db "You entered: %d.", 10, "Is odd? : %s ", EMOJI_MIND_BLOWN, 10, \
                    "%d + 2 = %d ", EMOJI_MIND_BLOWN, EMOJI_MIND_BLOWN, EMOJI_MIND_BLOWN, 10, 0

    fmt_err     db "scanf failed", 10, 0
    
    str_true    db "true", 0
    str_false   db "false", 0

section .bss
    x   resd 1

section .text
main:
    push    ebp
    mov     ebp, esp

    ; printf("Enter an integer: ");
    push    fmt_hello
    call    printf
    add     esp, 4

    ; scanf("%d", &x);
    push    x           ; x is ADDRESS HERE
    push    fmt_in
    call    scanf
    add     esp, 8
  
    ; check that everything is readed properly
    ; 
    cmp     eax, 1
    jne     .input_error

    ; printf(You entered: %d.\nIs odd? : %d\n%d + 2 = %d\n, x, x & 1 == 0 ? "true":"false", x, x + 2);

    mov eax, [x]
    add eax, 2
    push eax

    push dword [x]

    mov eax, str_true
    mov ebx, str_false

    mov ecx, [x]
    and ecx, 1
    cmp ecx, 0
    cmove eax, ebx
    push eax

    push    dword [x]
    push    fmt_out
    call    printf
    add     esp, 16

    xor     eax, eax    ; return 0
    jmp     .done

.input_error:
    push    fmt_err
    call    printf
    add     esp, 4

    mov     eax, 1      ; return 1

.done:
    mov     esp, ebp
    pop     ebp
    ret
