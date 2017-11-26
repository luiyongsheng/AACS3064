;; set model size
.model small
;; set stack size
.stack 64
;; data segment
;; (your constants and variables here)
.data

.code 

main proc           ;; start up program
    mov ax, @data   ;; predef symbol to retrieve info
    mov ds, ax      ;; initialize data segment register

    ;; instructions

    mov ah, 4ch ;; or mov ax, 4c00h
    int 21h
main endp
    end main