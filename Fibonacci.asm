data segment
fbs dw 10 dup(0)

code segment 
assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    mov cx, 10h
    lea si, fbs
    mov ax, 0h
    mov bx, 1h
    mov [si], ax
    inc si
    mov [si], bx
    inc si
loop1:
    add ax, bx
    mov dx, ax
    mov [si], dx
    mov ax, bx
    mov bx, dx
    inc si
    dec cx
    loop loop1
hlt
code ends
end start