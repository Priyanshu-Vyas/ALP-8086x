data segment
arr db 4h,2h,7h,5h
code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    mov ch,04h
outer:
    mov cl,04h
    lea si,arr
inner:
    mov al,[si]
    mov bl,[si+1]
    cmp al,bl
    jnc skip
    xchg [si],bl
    xchg [si+1],bl
skip:
    inc si
    dec cl
    jnz inner
    dec ch
    jnz outer
hlt
code ends
end start