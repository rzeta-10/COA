.model small
.stack 100h
.data
	word1 db "Enter the number : $"
.code
	mov ax,@data
	mov ds,ax

	mov ah, 09h
	lea dx, word1
	int 21h

	mov ah,1
	int 21h
	sub al,'0'
	mov bl,al

	mov dl,10
	mov ah, 02h ; for new line
	int 21h

	mov cl,0000h
	mov al,0001h

	l1:
		mul bl
		dec bl
		jnz l1

	l10: 
		cmp al,0Ah
		jl l23
		add cl,01h
		sub al,0Ah
		jmp l10
		
	l23:
		cmp cl,0Ah
		jl l230
		add ch,01h
		sub cl,0Ah
		jmp l23
	l230:
		add ch,30h
		add cl,30h
		add al,30h
		mov bh,cl
		mov bl,al

	mov dl,ch; move the result to dl
	mov ah, 02h ; result printing
	int 21h

	mov dl,bh; move the result to dl
	mov ah, 02h ; result printing
	int 21h

	mov dl,bl; move the result to dl
	mov ah, 02h ; result printing
	int 21h

	mov ax, 4c00h
int 21h

end
