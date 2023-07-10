.model small
.stack 100h

.data
input_msg db "Factorial of :$"
output_msg db "Output:$"

.code

MAIN PROC 
    
    mov ax,@DATA
    mov ds,ax
    
    ;Show input message
    mov ah,9
    LEA DX,input_msg
    int 21h
    
    ;take input
    mov ah,1
    int 21h
    mov bl,al
    
    ;newline
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ;Show output message
    mov ah,9
    LEA DX,output_msg
    int 21h
    
    ;process
    sub bl,48
    mov al,1
    
    factorial:
        cmp bl,0
        je print
        
        mul bl
        dec bl
        jmp factorial
    
    print:
        add al,48
        mov dl,al
        mov ah,2
        int 21h
END MAIN
        