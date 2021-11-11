; nasm -f elf64 test.asm | gcc test.o -no-pie

extern printf

NEW_LINE equ 10

section .data
    message: db '[1] = %d', NEW_LINE, '[2] = %d', NEW_LINE, '[3] = %d', NEW_LINE, '[4] = %d', NEW_LINE, 0
    num: db 32, 54, 11, 65

section .bss
section .text
    global main

main: 
    push rbp
    mov rbp, rsp

    mov rdi, message
    movzx rsi, byte [num + 0]
    movzx rdx, byte [num + 1]
    movzx rcx, byte [num + 2]
    movzx r8, byte [num + 3]
    call printf

    mov rsp, rbp
    pop rbp
    xor rax, rax
    ret
