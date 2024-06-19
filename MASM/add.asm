.8086
.model small
.stack 100h

.data
    msg db 13,10, "Enter the numbers - $"

.code
    mov ax,@data
    mov ds,ax

    mov ah,09h
    lea dx,msg
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov cl,10
    mul cl
    mov bl,al

    mov ah,01h
    int 21h
    sub al,30h
    add bl,al

    mov ah,01h
    int 21h
    sub al,30h
    mov dl,10
    mul dl
    mov cl,al

    mov ah,01h
    int 21h
    sub al,30h
    add cl,al

    add bl,cl
    mov bh,0

    l1:
        cmp bl,10
        jl l2
        sub bl,10
        inc bh
        jmp l1
    
    l2:
        mov dl,bh
        add dl,30h
        mov ah,02h
        int 21h

        mov dl,bl
        add dl,30h
        mov ah,02h
        int 21h

    mov ax,4c00h
    int 21h
end
