data segment
arr1 dw 7h,24h,48h
arr2 dw 4h,12h,30h
rarr dw 3 dup(0)

code segment
assume cs:code, ds:data

start:
    mov cx, 03h
    mov ax, data
    mov ds, ax
    mov ax, 00h
    lea si, arr1
    lea di, arr2
    lea bx, rarr
    RPT: 
    mov ax, [si]
    mov dx, [di]
    sub ax, dx
    mov [bx], ax
    mov ax, 00h
    add si, 02h
    add di, 02h
    add bx, 02h
    loop RPT
    hlt
code ends
end start