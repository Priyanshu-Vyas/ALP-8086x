data segment
array db 01h,02h,03h
data ends
code segment
assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax
    mov cl,03h
    mov ax,0000h
add1:
    mov bl, array[si]
    add al, bl
    inc si
    loop add1
    hlt
code ends
end start