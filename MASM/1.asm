.8086
.model small
.stack 100h
.data
    prompt db 13,10,"Enter the number  = $"
.code
    mov ax,@data
    mov ds,ax

    mov ah,9
    lea dx,prompt
    int 21h

    mov ah,1
    int 21h

    sub al,'0'
    mov bh,al
    mov cl,0
    mov bl,1v

    mov dl,10
    mov ah,2
    int 21h

    mov dl,cl
    add dl,'0'
    mov ah,2
    int 21h 
l1:
    cmp bh,0
    je l2

    mov dl,bl
    add dl,'0'
    mov ah,2
    int 21h

    mov ah,bl
    add bl,cl
    mov cl,ah
    dec bh
    jmp l1
l2:
    mov ax,4c00h
    int 21h
end