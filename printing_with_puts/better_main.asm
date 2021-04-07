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
