data segment
arr1 dw 01h,4h,5h,7h
arr2 dw 04h,12h,30h,1h
rarr dw 4 dup(0)

code segment
assume cs:code, ds:data

start:
    mov cx, 04h
    mov ax, data
    mov ds, ax
    mov ax, 00h
    lea si, arr1
    lea di, arr2
    lea bx, rarr
    RPT: 
    mov ax,[si]
    mov dx,[di]
    add ax,dx
    mov [bx],ax
    mov ax, 00h
    add si, 02h
    add di, 02h
    add bx, 02h
    loop RPT
    hlt
code ends
end start