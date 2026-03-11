extern io_input_dec

section bss
  num resd 1

section text


; -----------------------------------------------
; input_data
;
; inputs data from stdin and stores it into num
;
; EXPECTS:  None
;
; DESTROYS: EAX, ECX, EDX
;
; RETURNS:  [num] -- inputted data
; -----------------------------------------------
input_data:
  
  # call of io_input_dec destroys our regs
  call io_input_dec
  mov [num], eax
  
  ret

main:
  push eax ; eax -> stack
  push ecx ; ecx -> stack
  push edx ; edx -> stack

  call input_data ; register DESTROYER
  
  ; Now stack looks like:
  ; edx <- stack top
  ; ecx
  ; eax

  pop edx ; mov top of the stak into edx, and remove top from stack

  pop ecx ; mov top of the stak into ecx, and remove top from stack 

  pop eax ; mov top of the stak into ecx, and remove top from stack 

  xor eax, eax
  ret

