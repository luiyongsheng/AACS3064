.model small
.stack 64
.data
    str1 DB "Please enter a digit: $"
    str2 DB " times $"
    str3 DB " returns: $"
    input DB 0
    result DB ?
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
    mov input, al

    mov ah, 02h
    mov dl, 0ah
    int 21h

    mov ah, 02h
    mov dl, input
    add dl, 30h
    int 21h

    mov ah, 09h
    lea dx, str2
    int 21h

    mov ah, 02h
    mov dl, input
    add dl, 30h
    int 21h

    mov ah, 09h
    lea dx, str3
    int 21h

    mov al, input
    mov bl, al
    mul input
    mov result, al
    aam

    add ah, 30h
    add al, 30h

    mov bx, ax

    mov ah, 02h
    mov dl, bh
    int 21h

    mov ah, 02h
    mov dl, bl
    int 21h

    mov ah, 4ch
    int 21h

main endp
    end main
