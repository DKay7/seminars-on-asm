; Do not forget to change LF to CRLF
; in vscode:
; ctrl + shift + p -> type "eol" -> choose CLRF 

; RUN: tasm hello.asm
; RUN: tlink /t hello.obj
; RUN: .\hello.com

.model tiny
.code
org 100h

start:
 mov ah, 9
 mov dx, offset msg
 int 21h
 mov ax, 4c00h
 int 21h


.data
msg     db "Hello world$"
end start

