.model small
.stack 100h

.data
    num1 db ?
    num2 db ?
    gcd db ?

.code
    main proc
        mov ax, @data
        mov ds, ax

        ; Input first number
        mov ah, 01h
        int 21h
        sub al, 30h
        mov num1, al

        ; Input second number
        mov ah, 01h
        int 21h
        sub al, 30h
        mov num2, al

        ; Calculate GCD
        mov al, num1
        mov bl, num2
        call calculate_gcd

        ; Display GCD
        add al, 30h
        mov ah, 02h
        mov dl, al
        int 21h

        mov ah, 4Ch
        int 21h

    main endp

    calculate_gcd proc
        cmp al, bl
        jz gcd_found
        jb swap_numbers

    gcd_loop:
        sub al, bl
        cmp al, bl
        jz gcd_found
        jb swap_numbers
        jmp gcd_loop

    swap_numbers:
        xchg al, bl
        jmp gcd_loop

    gcd_found:
        mov gcd, al
        ret

    calculate_gcd endp

end main