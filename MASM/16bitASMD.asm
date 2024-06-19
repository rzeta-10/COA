.8086
.model small
.stack 100h

.data
    num1 dw ?
    num2 dw ?
    result dw ?

    addition_msg db "The result of addition is: $"
    subtraction_msg db "The result of subtraction is: $"
    multiplication_msg db "The result of multiplication is: $"
    division_msg db "The result of division is: $"

.code
    main proc
        mov ax, @data
        mov ds, ax

        mov ah, 01h
        int 21h
        sub al, '0'
        mov bl, al

        mov ah, 01h
        int 21h
        sub al, '0'

        xchg al, bl
        mov ah, 0
        mov cl, 10
        mul cl
        add bl, al
        mov ax, bx
        mov num1, ax

        mov ah, 01h
        int 21h
        sub al, '0'
        mov bl, al

        mov ah, 01h
        int 21h
        sub al, '0'

        xchg al, bl
        mov ah, 0
        mov cl, 10
        mul cl
        add bl, al
        mov ax, bx
        mov num2, ax

        mov ax, num1
        add ax, num2
        mov result, ax

        mov ah, 09h
        lea dx, addition_msg
        int 21h
        mov ax, result
        call print_num
        call print_nl

        mov ax, num1
        sub ax, num2
        mov result, ax

        mov ah, 09h
        lea dx, subtraction_msg
        int 21h
        mov ax, result
        call print_num
        call print_nl

        mov ax, num1
        mov bx, num2
        mul bx
        mov result, ax

        mov ah, 09h
        lea dx, multiplication_msg
        int 21h
        mov ax, result
        call print_num
        call print_nl

        mov ax, num1
        mov dx, 0
        mov cx, num2
        div cx
        mov result, ax

        mov ah, 09h
        lea dx, division_msg
        int 21h
        mov ax, result
        call print_num
        call print_nl

        mov ah, 4Ch
        int 21h
    main endp

    print_num proc
        push ax
        push bx
        push cx
        push dx

        xor bx, bx
        mov cx, 10
        mov ax, result

        L1:
            xor dx, dx
            div cx
            push dx
            inc bx
            test ax, ax
            jnz L1

        L2:
            pop dx
            add dl, '0'
            mov ah, 02h
            int 21h
            dec bx
            jnz L2

        pop dx
        pop cx
        pop bx
        pop ax
        ret
    print_num endp

    print_nl proc
        mov dl, 0Dh
        mov ah, 02h
        int 21h
        mov dl, 0Ah
        int 21h
        ret
    print_nl endp

end main

