
; // encrypts with ceasers cypher
; void asm_encrypt(char *buffer, int shift);

section .data
  read_mode db "r", 0
  write_mode db "w", 0
  fmt_str db "%m[^", 10, "]", 0
  fmt_str_printf db "%s", 0

section .text
global asm_encrypt
global asm_read_file
global asm_write_file

extern fscanf
extern fprintf
extern fopen
extern fclose

; void asm_encrypt(char *buffer, int shift);
%define shift   byte [ebp + 12]
%define buffer  dword [ebp + 8]
%define idx     dword [ebp - 4]
asm_encrypt:
  ; push ebp
  ; mov ebp, esp
  ; sub esp, 4
  enter 4, 0

  push esi
  push edi
  
  mov idx, 0

.loop:
  mov esi, buffer
  mov ecx, idx
  mov al, byte [esi + ecx]
  
  cmp al, 0
  je .end
  
  add al, shift
  mov byte [esi + ecx], al
  inc idx
  
  jmp .loop
  
.end:
  pop edi
  pop esi
  
  add esp, 4
  leave
  ret

%undef buffer  
%undef shift   
%undef idx     

;
; reads file to buffer
; void asm_read_file(char* name, char** buffer);

%define name    dword [ebp + 8]
%define buffer  dword [ebp + 12]

%define input_file dword [ebp - 4]
asm_read_file:
  enter 4, 0
   
  mov input_file, 0
  ; and esp, -16

  ; FILE *input = fopen(argv[1], "r");
  sub esp, 16
  mov [esp + 4], dword read_mode
  mov eax, name
  mov [esp], eax
  call fopen
  add esp, 16
  
  mov input_file, eax
  

  ; fscanf(input_file, "%ms", &buffer);
  sub esp, 16
  mov eax, buffer
  mov [esp + 8], eax
  mov [esp + 4], dword fmt_str
  mov eax, input_file
  mov [esp], eax
  call fscanf
  add esp, 16
  
  ; fclose
  sub esp, 16
  mov eax, input_file
  mov [esp], eax
  call fclose
  add esp, 16
  
  leave 
  ret

%undef name    
%undef buffer  
%undef input_file  
; writes file from buf
; void asm_write_file(char* name, char* buffer)


%define name    [ebp + 8]
%define buffer  [ebp + 12]
%define input_file [ebp - 4]

asm_write_file:
  enter 4, 0
  ;and esp, -16
  
  mov dword input_file, 0

  ; FILE *input = fopen(argv[1], "w");
  sub esp, 16
  mov [esp + 4], dword write_mode
  mov eax, name
  mov [esp], eax
  call fopen
  add esp, 16

  mov input_file, eax

  ; fprintf(input_file, "%s", buffer);
  sub esp, 16
  mov eax, buffer
  mov [esp + 8], eax
  mov [esp + 4], dword fmt_str_printf
  mov eax, input_file
  mov [esp], eax
  call fprintf
  add esp, 16

  ; fclose
  sub esp, 16
  mov eax, input_file
  mov [esp], eax
  call fclose
  add esp, 16
  
  leave
  ret


