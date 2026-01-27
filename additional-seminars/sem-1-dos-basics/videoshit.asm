; Do not forget to change LF to CRLF
; in vscode:
; ctrl + shift + p -> type "eol" -> choose CLRF 

; RUN: tasm videoshit.asm
; RUN: tlink /t videoshit.obj
; RUN: .\videoshit.com

.model tiny
.code
org 100h                 ; COM programs start at offset 100h

start:
    mov ah, 9
    mov dx, offset msg
    int 21h

    mov ax, cs            ; In TINY model CS = DS = ES initially
    mov ds, ax            ; Ensure DS points to our code segment

    mov ax, 0B800h        ; Segment of text mode video memory
    mov es, ax            ; ES -> video memory (0xB8000)

    mov si, 100h          ; SI points to the beginning of our code
    xor di, di            ; Start at the top-left corner of the screen
    mov cx, 80 * 25 * 2            ; Number of code bytes to display

write_loop:
    lodsw                 ; Load word from DS:SI into AL, increment SI by 2
    stosw                 ; Store AX to ES:DI, increment DI by 2

    loop write_loop

    ; finalize program
    mov ah, 4ch
    mov al, 00h
    int 21h


.data
msg     db "All is gonna be insane...$"
end start
