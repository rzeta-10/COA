.model small
.stack 100h
.data
	w1 db "AND OF TWO NUMBERS:$"
	w2 db "OR OF TWO NUMBERS:$"
	w3 db "XOR OF TWO NUMBERS:$"
	w4 db "NOT OF A NUMBER:$"
.code
	mov ax,@data
	mov ds,ax
	
	mov al,01h
	mov bl,01h
	
	mov cl,al
	
	and al,bl
	add al,30h
	
	mov ah,09h
	lea dx,w1
	int 21h
	
	mov dl,al
	mov ah,02h
	int 21h
	
	mov dl,10 
	mov ah,02h
	int 21h
	
	mov al,cl
	
	or al,bl
	add al,30h
	
	mov ah,09h
	lea dx,w2
	int 21h
	
	mov dl,al
	mov ah,02h
	int 21h
	
	mov dl,10 
	mov ah,02h
	int 21h
	
	mov al,cl
	
	xor al,bl
	add al,30h
	
	mov ah,09h
	lea dx,w3
	int 21h
	
	mov dl,al
	mov ah,02h
	int 21h
	
	mov dl,10 
	mov ah,02h
	int 21h
	
	mov al,cl
	
	not al
	add al,30h
	
	mov ah,09h
	lea dx,w4
	int 21h
	
	mov dl,al
	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
end
