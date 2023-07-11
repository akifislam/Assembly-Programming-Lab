.model small
.stack 100h

.data
E db "Enter a number(0-9)$:"
NP db "NOT PRIME$"
P db "PRIME$"
n db ?

.code

MAIN PROC
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    LEA dx,E
    int 21h
    
    mov ah,1
    int 21h
    sub al,48
    mov n,al
    
    cmp n,2
    jl not_prime
    
    mov bl,2
     
    repeat:
         cmp bl,n
         je prime
          
         mov al,n
         mov ah,0
         div bl
         cmp ah,0
         je not_prime
         
         inc bl
         jmp repeat
    
    prime:
        mov dl,bl
        mov ah,9
        LEA dx,p
        int 21h
        jmp exit
    not_prime:
     mov dl,bl
        mov ah,9
        LEA dx,NP
        int 21h
        jmp exit
    exit:
        mov ah,4ch
        int 21h
        
     
         
           
    
    