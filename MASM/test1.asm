.model small
.stack 100h
.data
wrd db "Display of the characters : $"
.code

	mov ax,@data
	mov ds,ax

	mov ah,09h
	lea dx,wrd
	int 21h

	mov cl,10

	L1:
	mov dl,10
	mov ah,02h
	int 21h
	
	mov ah,1
	int 21h
	
	mov bl,al
	
	mov dl,bl
	mov ah,02h
	int 21h
	
	DEC cl
	JNZ L1

	mov ax,4c00h
	int 21h
end
