; nasm -f elf64 -g -F dwarf count.asm -l count.lst
; gcc -o count count.o -no-pie
; ./count

extern printf

section .data
    Iterations dq 10                        ; Number of iterations
    Format     db "%d", 10, 0               ; Integer string
    Message    db "Loop Finished!", 10, 0   ; Message string

section .bss
section .text
    global main
    
main:
    push rbp
    mov rbp, rsp

    mov rbx, 0 ; counter = 0

loop:
    inc rbx ; counter++

    mov rdi, Format
    mov rsi, rbx
    mov rax, 0
    call printf ; printf(Format, counter)
    
    cmp rbx, [Iterations]
    jl loop ; if(rbx < Iterations) goto loop;

    mov rdi, Message
    mov rax, 0
    call printf ; printf(Message)

    mov rsp, rbp
    pop rbp
    ret
