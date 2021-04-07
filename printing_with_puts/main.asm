; My first every x86 assembly program.

global main
extern puts

section .text

msg:
    db 'Hello World', 0

main:
    ; Initializing stack frame.
    push  ebp
    mov   ebp, esp
    sub   esp, 12
    
    ; Passing msg as argument and calling puts.
    ; puts(msg)
    push  msg
    call  puts

    ; Clearingstack frame.
    mov   esp, ebp
    pop   ebp
    ret
