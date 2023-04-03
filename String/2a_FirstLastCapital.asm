;self coded

.model small
.stack 100h
.data

str db 100 dup('$')
len dw 0
msg1 db "Enter String: $"
msg2 db "First Capital: $"
msg3 db "Last Capital: $"
msg4 db "No Capital$"
flag db 0

.code

MAIN PROC
    mov ax,@DATA
    mov ds,ax
    
    mov ah,9
    LEA DX,msg1
    int 21h
    
    mov si,offset str
    inc si
    
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
        
        mov si,offset str
        inc si
        
   search_first_capital:
        mov bl, str[si]
        
        cmp bl,'$'
        je search_last_capital
        
        cmp bl,90
        jle checkinrange
        
        inc si
        jmp search_first_capital
   
   checkinrange:
        cmp bl,65
        jge setflag
   setflag:
        mov flag,1
        mov ah,9
        LEA DX,msg2
        int 21h
        
        mov ah,2
        mov dl,bl
        int 21h
        
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov si,offset str
        add si,len
        
        jmp search_last_capital
   
   search_last_capital:
        mov bl, str[si]
        
        cmp bl,'$'
        je exit
        
        cmp bl,90
        jle checkinrange2
        
        dec si
        jmp search_last_capital
  
  checkinrange2:
        cmp bl,65
        jge setflag2
  
  setflag2:
        mov flag,1
        mov ah,9
        LEA DX,msg3
        int 21h
        
        mov ah,2
        mov dl,bl
        int 21h
        
        jmp exit     
         
    exit:
        cmp flag,0
        je no_capital
        mov ah,4ch
        int 21h
    no_capital:
        mov ah,9
        LEA DX,msg4
        int 21h
        mov flag,5
        jmp exit 
        
