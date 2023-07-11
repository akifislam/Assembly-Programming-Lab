.model small
.stack 100h

.data

    str db 100 dup('$')
    input_msg db "Input String : $" 
    output_msg db "Output String : $"

.code

MAIN PROC
    
    ;Load
    MOV AX, @DATA
    MOV DS, AX
    
    ; Input Message (ex: Input String : )
    MOV AH,9
    LEA dx,input_msg
    int 21h
    
    ; Set for(i=0;i<str.length();i++) thing. Setting i=0
    MOV SI, offset str
    
    input:
        ; take character input one by one
        mov ah,1
        int 21h
        
        ; if input==enter? go to output
        cmp al,13
        je break
        
        
        ; save it to array index
        mov str[si],al
        inc si
        jmp input
        
    break:
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
    
    ; output message
    mov ah,9
    lea dx,output_msg
    int 21h
    
    mov cx,5
    mov si, offset str
    
    output:
        mov bl,[si]
        cmp bl,'$'
        je exit
        cmp bl,65
        jge inner
        jmp print
        
    inner:
        cmp bl,122
        jle convert
        jmp print
        
    convert:
        cmp bl, 90
        jle tolower
        cmp bl,97
        jge toupper
        jmp print
    
    tolower:
        add bl, 32
        jmp print
    toupper:
        sub bl,32
        jmp print
                  
    print:
        mov dl,bl
        mov ah,2
        int 21h
        inc si
        jmp output
    exit:
    mov ah,4ch
    int 21h
main endp

end main
    
          
