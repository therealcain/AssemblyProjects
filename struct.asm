  extern printf
extern scanf

section .data
    StartMessage: db 'Enter 2D vector to find unit vector!', 0
    InputMessage: db '%d %d'
    OutputMessage: db 'Your vector is (%d, %d)', 0

    struc Vector
        .x resd 1
        .y resd 1
    endstruc

section .bss
    vector: resd 2

section .text
    global main

main: 
    push rbp
    mov rbp, rsp

    mov rdi, StartMessage
    call printf

    mov rdi, InputMessage
    mov rsi, vector + Vector.x
    mov rdx, vector + Vector.y
    call scanf

    mov rdi, OutputMessage
    mov rsi, [vector + Vector.x]
    mov rdx, [vector + Vector.y]
    call printf

    mov rsp, rbp
    pop rbp
    xor rax, rax
    ret
