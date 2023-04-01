.model small
.stack 100h

.data
    str db 100 dup('$')
    len dw 0

.code

main proc
    mov ax,@DATA
    mov ds,ax
    
    mov si,offset str
    inc si

    ; loop input
    input:
        mov ah,1
        int 21h
        
        cmp al,13
        je break
        
        mov str[si],al
        inc si
        inc len
        jmp input
        
    
    break:
       mov ah,2
       mov dl,10
       int 21h
       
       mov dl,13
       int 21h
       
       ; loop reverse output
       mov si, offset str
       add si,len
    
    output:
        mov dl,[si]
        cmp dl,'$'
        je exit
        
        mov ah,2
        int 21h
        
        dec si
        jmp output
   exit:
       mov ah,4ch
       int 12h
       main endp
end main
        
       