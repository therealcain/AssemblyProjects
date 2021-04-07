; Compile like so:
; $ nasm -f elf32 better_main.asm
; $ gcc better_main.o -m32

global main
extern puts

section .text

msg:
    db 'Hello World', 0

main:
    ; puts(msg);
    push msg
    call puts
    
    ; Cleaning the stack.
    add  esp, 4
    ret
