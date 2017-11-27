.model small
.stack 64
.data
    str1 DB "Dividend   :$"
    str2 DB "Divisor    :$"
    str3 DB "Quotient   :$"
    str4 DB "Remainder  :$"
    dividen DB 0
    divisor DB 0
    ten DB 10
    Q DB 0
    R DB 0
.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, str1
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov dividen, al

    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ah, 09h
    lea dx, str2
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov divisor, al

    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ax, 0
    mov al, dividen
    div divisor

    mov Q, al
    mov R, ah
    
    mov ah, 09h
    lea dx, str3
    int 21h

    mov ah, 02h
    mov dl, Q
    add dl, 30h
    int 21h

    mov ah, 02h
    mov dl, 0ah
    int 21h
    
    mov ah, 09h
    lea dx, str4
    int 21h

    mov ah, 02h
    mov dl, R
    add dl, 30h
    int 21h
    
    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ah, 4ch
    int 21h

main endp
    end main
