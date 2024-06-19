.8086
.model small
.stack 100h

.data
	a_msg db "Enter a = $"
	b_msg db 13,10,"Enter b = $"
	output_msg db 13,10,"The value of a^b = $"
	a db 0
	b db 0

.code
	mov ax,@data
	mov ds,ax

	mov ah,09h
	lea dx,a_msg
	int 21h

	mov ah,1
	int 21h

	mov a,al
	sub a,'0'

	mov ah,09h
	lea dx,b_msg
	int 21h

	mov ah,1
	int 21h

	mov b,al
	sub b,'0'

	mov ax,a
	mov bl,1
	dec b

	l1:
		mul a
		cmp bl,b
		je init
		inc bl
		jmp l1

	init:
		mov cl,ax
		mov ch,0
		mov bl,0

	l2:
		cmp cl,0Ah
		jl l3
		sub cl,10
		inc ch
		jmp l2

	l3:
		cmp ch,0Ah
		jl l4
		sub ch,10
		inc bl
		jmp l3

	l4:
		cmp bl,0Ah
		jl l5
		sub bl,10
		inc bh
		jmp l4

	l5:
		add cl,'0'
		add ch,'0'
		add bl,'0'

	mov ah,09h
	lea dx,output_msg
	int 21h

	mov dl,10
	mov ah,02h
	int 21h

	mov dl,bl
	mov ah,02h
	int 21h

	mov dl,ch
	mov ah,02h
	int 21h

	mov dl,cl
	mov ah,02h
	int 21h

	mov ax,4c00h
	int 21h

end

