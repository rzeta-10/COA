.8086
.model small
.stack 100h
.data
    msg db 13,10, "Enter the characters - $"
.code
    mov ax,@data
    mov ds,ax

    mov ah,09h
    lea dx,msg
    int 21h

    l1:
        mov ah,01h
        int 21h

        cmp al,13
        je exit

        mov dl,al
        mov ah,02h
        int  21h

        jmp l1
    
    exit:
        mov ax,4c00h
        int 21h
end