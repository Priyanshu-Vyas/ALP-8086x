code segment
assume cs:code
start:
    mov al,0003h
    mov bl,0001h
    add al,bl
    hlt
code ends
end start