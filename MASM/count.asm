.model small
.stack 100h
.data
    prompt db 13,32,"Enter the input string  = $"
    char_count_msg db 13,32,"number of characters = $"
    word_count_msg db 13,32,"word count = $"
    word_count db 0
    char_count db 0
.code
    mov ax,@data
    mov ds,ax

    mov ah,9
    lea dx,prompt
    int 21h

    mov bh,0
    mov bl,0

l1:
    mov ah,1
    int 21h

    cmp al,' '   ;if space is entered increment word count
    je l2

cont:
    cmp al,13   ;till enter is not pressed increment character count
    jne l3

    mov al,char_count
    mov ah,0
    jmp l4

l2:
    inc word_count
    jmp cont

l3:
    inc bl
    jmp check

check:
    cmp bl,0Ah
    jl l1
    sub bl,10
    inc bh
    jmp check

l4:
    add bh,'0'
    add bl,'0'

    mov ah,9
    lea dx,char_count_msg
    int 21h

    mov dl,bh
    mov ah,2
    int 21h

    mov dl,bl
    mov ah,2
    int 21h

    mov dl,10
    mov ah,2
    int 21h

    inc word_count
    add word_count,'0'

    mov ah,9
    lea dx,word_count_msg
    int 21h

    mov dl,word_count
    mov ah,2
    int 21h

    mov ax,4c00h
    int 21h
end
