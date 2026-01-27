; Do not forget to change LF to CRLF
; in vscode:
; ctrl + shift + p -> type "eol" -> choose CLRF 

; RUN: tasm box.asm
; RUN: tlink /t box.obj
; RUN: .\box.com

.model tiny
.code
org 100h

videoseg    equ 0B800h
color       equ 1Dh      
width       equ 40        
height      equ 10 
start_x     equ 10
start_y     equ 5

start:
    mov ax, videoseg
    mov es, ax

    ; start offset in video mem
    mov di, (start_x + start_y * 80) * 2

    ; --- upper line
    mov ah, color
    mov al, '+'
    stosw ; STOSW -- stores WORD from AX into ES:DI == mov WORD ES:[DI], AX

    mov cx, width - 2
    mov al, '-'
    rep stosw ; REP -- repeats instruction untill CX != 0

    mov al, '+'
    stosw

    ; --- side lines
    mov cx, height-2
draw_sides:
    add di, (80 - width) * 2

    mov al, '|'
    stosw

    add di, (width-2) * 2

    mov al, '|'
    stosw

    loop draw_sides ; LOOP == WHILE CX != 0

    add di, (80 - width) * 2

    mov al, '+'
    stosw

    mov cx, width-2
    mov al, '-'
    rep stosw

    mov al, '+'
    stosw

    mov di, (start_x + 2 + (start_y + height/2) * 80) * 2
    mov si, offset text
    mov ah, color

write_text:
    lodsb
    or al, al
    jz exit
    stosw
    jmp write_text

exit:
    mov ax, 4C00h
    int 21h

; ------------------------
.data
text db 'Hello world', 0

end start
