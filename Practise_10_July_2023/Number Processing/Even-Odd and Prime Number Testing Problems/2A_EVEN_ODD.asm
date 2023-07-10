.model small
.stack 100h

.data
input_msg db "Input:$"
odd_msg db " is a odd number$"
even_msg db " is a even number$"
number db ?

.code

MAIN PROC
    
    mov ax,@data
    mov ds,ax
    
    LEA DX,input_msg
    mov ah,9
    int 21h
    
    ;take input
    mov ah,1
    int 21h
    mov number,al
    
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
      
    
    ;process
    mov al,number
    AND al,00000001b
    cmp al,0
    je even
    jmp odd
    
    even:
        ;print the number
        mov dl,number
        mov ah,2
        int 21h
        
        ;print even message
        mov ah,9
        LEA dx,even_msg
        int 21h
        jmp exit
    odd:
        ;print the number
        mov dl,number
        mov ah,2
        int 21h
        
        ;print even message
        mov ah,9
        LEA dx,odd_msg
        int 21h
        jmp exit
    
    exit:
        mov ah,4ch
        int 21h
        
