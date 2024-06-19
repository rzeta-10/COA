
.model small
.stack 100h
.data
    prompt db 13,10,"Enter the string : $"
    yes db 13,10,"The string is a palindrome$"
    no db 13,10,"The string is not a palindrome$"
    x db 50 dup(0)
    len dw 0
    count db 0 
.code   
    mov ax,@data
    mov ds,ax

    mov ah,9
    lea dx,prompt
    int 21h
    mov si,offset x
l1:
    mov ah,1
    int 21h

    cmp al,13
    je l2

    mov [si],al

    inc si
    inc len
    jmp l1

l2:
    mov ax,len
    mov bl,2
    div bl
    mov cl,al
    mov di,offset x
    add di,len
    sub di,1
    mov si,offset x

l3:
    cmp cl,0
    je l4

    mov bl,[si]
    mov dl,[di]
    cmp bl,dl
    jne l5

    inc si    
    dec di 
    dec cl
    jmp l3  

l4:
    mov ah,9
    lea dx,yes
    int 21h
    jmp l6  
l5:
    mov ah,9
    lea dx,no
    int 21h

l6: 
    mov ax,4c00h
    int 21h
end