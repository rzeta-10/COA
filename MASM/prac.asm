.model small
.data
.stack 100h
    msg1 db "enter the numbers $", 13,10
    msg2 db 13,10, " the entered numbers are $"
    x db 25 dup(0) ;array declaration
    result dw ?
.code
    mov ax, @data
    mov ds,ax

    mov si, offset x ; si=starting address of array
    mov ah, 09h
    lea dx, msg1
    int 21h

;loop for reading
l1: 
    mov ah,01h ; Reading numbers
    int 21h
    sub al,'0'
    mov [si],al  ; moving to array

    inc si ; array index incrementing

    add al,'0'

    cmp al,'0' ; comparing with ‘a’
    jne l1


    

mov al,0
mov si,offset x
mov cl,5
mov dl,0
jmp l3

l3:
    add al,[si]
    inc si
    inc dl
    cmp cl,dl
    jne l3
    mov ah,0
    je l4 

l4: 
    cmp al, 0Ah
    jl l7
    sub al,10
    add ah,01
    jmp l4

l7:
    add ah,'0' ; convert to
    add al,'0' ; ASCII
    mov bh,ah
    mov bl,al
    
mov dl,bh
mov ah,02h
int 21h

mov dl, bl
mov ah,02h
int 21h

mov ax,4c00h
int 21h
end