.model small
.data
.stack 100h
.data
    x db 25 dup(0)
    n db (0)
    p db (0)
.code
    mov ax, @data
    mov ds,ax
    mov si, offset x 
    mov bl,00h
    mov [si],bl
    inc si
    mov bl,01h
    mov [si],bl

    mov ah,1
    int 21h
    sub al,'0'
    mov n,al
    mov p,al
    inc p
    inc p

    mov dl,10          ;going to next line
    mov ah,02h
    int 21h

    mov ax,00h

    l102:
        mov cl,[si-1]
        add cl,[si]
        inc si
        mov [si],cl
        dec n
        jz l100
        jmp l102
    l100:
        mov si, offset x
        jmp l109
    l109:
        mov al,[si]
        inc si
        add al,48
        mov dl,al
        mov ah, 02h
        int 21h
        dec p
        jne l109

    mov ax,4c00h
    int 21h
end