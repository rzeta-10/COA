.model small
.stack 200h
.data
    input_prompt db "Enter the value of n : $", 13,10
    sum_msg db 13,10, "The sum : $"
    avg_msg db 13,10, "The average : $"
    remainder_msg db 13,10, "Remainder : $"
    data_array db 25 dup(0) ; array declaration
    sum_result db ?
    input_count db ?
    remainder db ?
   
.code
    mov ax, @data
    mov ds, ax

    mov si, offset data_array ; si=starting address of array
    mov ah, 09h
    lea dx, input_prompt
    int 21h

    mov ah, 01h      ; Reading numbers
    int 21h
    sub al, '0'
    mov input_count, al
    mov cl, al
   
    mov al, 1
   
	;loop for reading
	l1:
	    mov [si], al     ; moving to array
	    inc si           ; array index incrementing
	    inc al
	    cmp al, cl       ; comparing with cl
	    jbe l1
	   
	mov [si], al
	mov al, 0
	mov si, offset data_array
	mov cl, input_count
	mov dl, 0
	jmp l3

	l3:
	    add al, [si]
	    inc si
	    inc dl
	    cmp cl, dl
	    jne l3
	    mov ah, 0
	    je divide

	divide:
	mov sum_result,al
	jmp l4

	l4:
	    cmp al, 0Ah
	    jl l7
	    sub al, 10
	    add ah, 01
	    jmp l4

	l7:
	    add ah, '0' ; convert to ASCII
	    add al, '0' ; ASCII
	    mov bh, ah
	    mov bl, al
	   
	; Calculate average
	mov ah, 0
	mov al, sum_result     ; Load the sum into AL
	div input_count       ; Divide the sum by the count
	mov sum_result, al  ; Store the quotient (average)
	mov remainder,ah
	add remainder,'0'
	add sum_result,'0'
	mov ah, 09h
	lea dx, sum_msg
	int 21h

	mov dl, bh
	mov ah, 02h
	int 21h

	mov dl, bl
	mov ah, 02h
	int 21h

	mov ah, 09h
	lea dx, avg_msg
	int 21h

	mov dl, sum_result ; Convert average to ASCII
	mov ah, 02h
	int 21h

	mov ah,9
	lea dx,remainder_msg
	int 21h

	mov dl,remainder
	mov ah,2
	int 21h;

	mov ax, 4c00h
	int 21h
end
