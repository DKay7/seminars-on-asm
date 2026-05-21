global main
extern printf
extern scanf

section .data
    fmt_in      db "%lf %lf %lf", 0
    msg_in      db "Enter a b c: ", 0
    msg_two     db "x1 = %lf, x2 = %lf", 10, 0
    msg_one     db "x = %lf", 10, 0
    msg_none    db "No real roots", 10, 0
    msg_any     db "Infinite number of solutions", 10, 0
    msg_no      db "No solutions", 10, 0

    a           dq 0.0
    b           dq 0.0
    c           dq 0.0
    d           dq 0.0
    x1          dq 0.0
    x2          dq 0.0

    two         dq 2.0
    four        dq 4.0
    eps         dq 0.0000001

section .text

main:
    call read_coeffs
    call solve_equation
    xor eax, eax
    ret

read_coeffs:
    push ebp
    mov ebp, esp
    sub esp, 4

    ; printf("Enter a b c: ")
    mov [ebp-4], esp
    sub esp, 4
    and esp, -16
    mov dword [esp], msg_in
    call printf
    mov esp, [ebp-4]

    ; scanf("%lf %lf %lf", &a, &b, &c)
    mov [ebp-4], esp
    sub esp, 16
    and esp, -16
    mov dword [esp], fmt_in
    mov dword [esp+4], a
    mov dword [esp+8], b
    mov dword [esp+12], c
    call scanf
    mov esp, [ebp-4]

    mov esp, ebp
    pop ebp
    ret

solve_equation:
    push ebp
    mov ebp, esp
    sub esp, 4

    ; if abs(a) < eps then linear eq case
    fld qword [a]
    fabs
    fld qword [eps]
    fucomip st0, st1
    fstp st0
    ja linear_case

    ; d = b*b - 4*a*c
    fld qword [b]
    fmul st0, st0

    fld qword [a]
    fmul qword [c]
    fmul qword [four]

    fsubp st1, st0
    fst qword [d]

    ; if d < 0  no real roots
    fldz
    fucomip st0, st1
    fstp st0
    ja no_real_roots

    ; sqrt(d)
    fsqrt

    ; x1 = (-b + sqrt(d)) / (2a)
    fld qword [b]
    fchs
    fadd st0, st1

    fld qword [a]
    fmul qword [two]

    fdivp st1, st0
    fstp qword [x1]

    ; x2 = (-b - sqrt(d)) / (2a)
    fld qword [b]
    fchs
    fsub st0, st1

    fld qword [a]
    fmul qword [two]

    fdivp st1, st0
    fstp qword [x2]

    fstp st0

    ; printf("x1 = %lf, x2 = %lf\n", x1, x2)
    mov [ebp-4], esp
    sub esp, 20
    and esp, -16
    mov dword [esp], msg_two
    mov eax, [x1]
    mov [esp+4], eax
    mov eax, [x1+4]
    mov [esp+8], eax
    mov eax, [x2]
    mov [esp+12], eax
    mov eax, [x2+4]
    mov [esp+16], eax
    call printf
    mov esp, [ebp-4]
    jmp done

linear_case:
    ; if abs(b) < eps then degerate case
    fld qword [b]
    fabs
    fld qword [eps]
    fucomip st0, st1
    fstp st0
    ja degenerate_case

    ; x = -c / b
    fld qword [c]
    fchs
    fdiv qword [b]
    fstp qword [x1]

    ; printf("x = %lf\n", x)
    mov [ebp-4], esp
    sub esp, 12
    and esp, -16
    mov dword [esp], msg_one
    mov eax, [x1]
    mov [esp+4], eax
    mov eax, [x1+4]
    mov [esp+8], eax
    call printf
    mov esp, [ebp-4]
    jmp done

degenerate_case:
    ; if abs(c) < eps then infinite solutions, else no solutions
    fld qword [c]
    fabs
    fld qword [eps]
    fucomip st0, st1
    fstp st0
    ja infinite_solutions

    mov [ebp-4], esp
    sub esp, 4
    and esp, -16
    mov dword [esp], msg_no
    call printf
    mov esp, [ebp-4]
    jmp done

infinite_solutions:
    mov [ebp-4], esp
    sub esp, 4
    and esp, -16
    mov dword [esp], msg_any
    call printf
    mov esp, [ebp-4]
    jmp done

no_real_roots:
    mov [ebp-4], esp
    sub esp, 4
    and esp, -16
    mov dword [esp], msg_none
    call printf
    mov esp, [ebp-4]

done:
    mov esp, ebp
    pop ebp
    ret

