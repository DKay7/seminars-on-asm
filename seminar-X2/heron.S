
; S = sqrt(p(p - a)(p - b)(p - c))
; p = (a + b + c) / 2

section .data
  a qword 0.0

section .text
main:

  ; p = (a + b + c) / 2
  fld qword [a]
  fadd qword [b]
  fadd qword [c]
  fdiv [two]
  
  ; ST0 = p - c
  ; ST1 = p - b
  ; ST2 = p - a
  ; ST3 = p

  ; p(p - a)(p - b)(p - c)
  fst st1
  
  fsub qword [a]

  fld st1
  fsub qword [b]

  fld st2
  fsub qword [c]

  fmul st0, st1
  fmul st0, st2
  fmul st0, st3
    
  fsqrt

  ; st0 = S
  
  fst qword [result]

  push [result]
  push [result + 4]

  push fmt
  call printf

