.model small
.stack 64
.data
    charA DB "a$"
    charB DB "k$"
    charC DB "($"
    charD DB ")$"
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 02h
    mov dl, charC
    int 21h

    mov ah, 02h
    mov dl, charA
    int 21h

    mov ah, 02h
    mov dl, ","
    int 21h

    mov ah, 02h
    mov dl, charB
    int 21h

    mov ah, 02h
    mov dl, charD
    int 21h

    mov ah, 02h
    mov dl, 10h
    int 21h

    mov ah, 02h
    mov dl, charC
    int 21h

    mov bl, charA
    xchg bl, charB
    mov charA, bl

    mov ah, 02h
    mov dl, charA 
    int 21h

    mov ah, 02h
    mov dl, ","
    int 21h

    mov ah, 02h
    mov dl, charB
    int 21h

    mov ah, 02h
    mov dl, charD
    int 21h


    mov ax, 4c00h
    int 21h

main endp
    end main
