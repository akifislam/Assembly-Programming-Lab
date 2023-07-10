.model small
.stack 100h

.data
no_of_input db "no of input :$"
enter_numbers db "enter numbers:$"
largest_number db "Largest Number:$"
MAX db 0

.code

MAIN PROC
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,no_of_input
    int 21h
    
    mov ah,1
    int 21h
    
    sub al,48
    mov bl,al
    
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
 
    
    mov ah,9
    lea dx,enter_numbers
    int 21h
    
    repeat:
        cmp bl,0
        je exit
        
        mov ah,1
        int 21h
        
        cmp al,MAX
        jge update
         
        dec bl 
        jmp repeat
        
    update:
        mov MAX,al
        dec bl
        jmp repeat  
        
    exit:
        ;newline
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov ah,9
        lea dx,largest_number
        int 21h
        
        mov ah,2
        mov dl,MAX
  
        int 21h
        mov ah,4ch
        int 21h