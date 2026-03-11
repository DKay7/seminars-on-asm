
prologue_example:
    push ebp
    mov  ebp, esp
    sub  esp, 8        ; allocate 8 bytes on stack

    mov  DWORD PTR [ebp-4], 5   ; int a = 5
    mov  DWORD PTR [ebp-8], 7   ; int b = 7

    mov  eax, [ebp-4]           ; eax = a
    add  eax, [ebp-8]           ; eax = a + b

    mov  esp, ebp
    pop  ebp
    ret

# higher adresses
# +----------------+
# | return address |
# +----------------+
# | saved ebp      | <- ebp
# +----------------+
# | a = 5          | [ebp-4]
# +----------------+
# | b = 7          | [ebp-8]
# +----------------+
# lower addresses
