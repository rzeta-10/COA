.8086
.model small
.stack 500h

.data
	msg1 db 13,10, "Enter the input string = $"
	vowel_count_msg db 13,10, "Number of Vowels = $"
	consonant_count_msg db 13,10, "Number of Consonants = $"
	
	vowel_count db 0
	consonant_count db 0
	
.code 
	mov ax,@data
	mov ds,ax
	
	mov ah, 09h
	lea dx, msg1
	int 21h
	
	l1:
	    mov ah,1
	    int 21h

		cmp al,13
		je exit

	    cmp al,'a'
	    je l2
	    
	    cmp al,'e'
	    je l2
	    
	    cmp al,'i'
	    je l2
	    
	    cmp al,'o'
	    je l2
	    
	    cmp al,'u'
	    je l2

		jmp l3

	l2:
	    inc vowel_count
	    jmp l1

	l3:
	    inc consonant_count
	    jmp l1

	exit:
	    mov bl,vowel_count
		mov bh,0
		mov cl,consonant_count
		mov ch,0
		jmp overflow_vowel

	overflow_vowel:
		cmp bl,0Ah
		jl overflow_consonant
		sub bl,10
		inc bh
		jmp overflow_vowel
	
	overflow_consonant:
		cmp cl,0Ah
		jl l4
		sub cl,10
		inc ch
		jmp overflow_consonant

	l4:
		add ch,'0'
		add cl,'0'
	    add bh,'0'
	    add bl,'0'

    mov ah,09h
    lea dx,vowel_count_msg
    int 21h

    mov dl,bh
    mov ah,02h
    int 21h

    mov dl,bl
    mov ah,02h
    int 21h

    mov dl,10
    mov ah,02h
    int 21h

    mov ah,09h
    lea dx,consonant_count_msg
    int 21h

    mov dl,ch
    mov ah,02h
    int 21h

    mov dl,cl
    mov ah,02h
    int 21h

	mov dl,10
    mov ah,02h
    int 21h

    mov ax,4c00h
    int 21h
end
