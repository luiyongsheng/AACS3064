.model small
.stack 64
.data
    str1 DB "Please enter a digit: $"
    str2 DB " times $"
    str3 DB " returns: $"
    input DB 0
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, str1
    int 21h

    mov ah, 01h
    int 21h

    mov input, al

    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ah, 02h
    mov dl, input
    int 21h

    mov ah, 09h
    lea dx, str2
    int 21h

    mov ah, 02h
    mov dl, input
    int 21h

    mov ah, 09h
    lea dx, str3
    int 21h

    mov al, input
    sub al, 30h
    mul al
    add al, 30h

    mov dl, al

    mov ah, 02h
    int 21h

    mov ah, 4ch
    int 21h

main endp
    end main
