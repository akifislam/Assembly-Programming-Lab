.model small
.stack 100h
.code

MAIN PROC
    mov ah,1
    int 21h
    
    sub al,48
    
    mov bl,al
    inc bl ; n+1
    mul bl; n(n+l)
    
    mov bl,2
    div bl
    
    mov ah,2
    mov dl,al
    add dl,48
    int 21h
    
    
