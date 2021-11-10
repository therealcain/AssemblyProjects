; nasm -f elf64 printf_and_scanf.asm
; gcc test.o -no-pie

extern printf
extern scanf

section .data
    Message: db 'Please enter a number: ', 0
    InputMessage: db '%d'
    OutputMessage: db 'Your number is: %d', 0

section .bss
    num: resd 1

section .text
    global main

main: 
    push rbp
    mov rbp, rsp

    ; Message output
    mov rdi, Message
    call printf

    ; Message input
    mov rdi, InputMessage
    mov rsi, num
    call scanf

    ; Message output
    mov rdi, OutputMessage
    mov rsi, [num]
    call printf

    mov rsp, rbp
    pop rbp
    xor rax, rax
    ret

