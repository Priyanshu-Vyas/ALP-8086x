code segment
assume cs:code
start:
    mov ax,0007h
    mov bx,0004h
    sub ax,bx
    hlt
code ends
end start