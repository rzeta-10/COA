.8086
.model small
.stack 100h

.data
	msg db 13,10, "Enter the input - $"
	s db 0
	arr db 20 dup(0)
	
.code
	mov ax,@data
	mov ds,ax
	
	mov ah,09h
	lea dx,msg
	int 21h
	
	mov si,offset arr
	
	l1:
		mov ah,01h
		int 21h
		
		cmp al,13
		je la 
		
		sub al,30h
		mov [si],al
		inc si
		inc s
		jmp l1	
	la:
        dec s 
        mov bh,s
	l2:
		mov si,offset arr
		mov bl,s
	
	l3:
		mov dl,[si]
		mov cl,[si+1]
		cmp dl,cl
		jl l4
		xchg dl,[si+1]
		xchg [si],dl
		xchg [si+1],dl
		
	l4:
		inc si
		dec bl
		jnz l3
		dec bh
		jnz l2
	
	mov si,offset arr
    inc s
	mov cl,s
	
	
	l5:
		cmp cl,0
		je exit
		mov dl,[si]
		add dl,30h
		mov ah,02h
		int 21h
		
		inc si
		dec cl
		jmp l5		
		
	exit:
		mov ax,4c00h
		int 21h
end