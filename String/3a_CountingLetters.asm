.model small
.stack 100h
.data
msg db "Enter String :$"
msg1 db "No of Vowels : $"
msg2 db "No of Consonants : $"
msg3 db "No of Digits : $"
msg4 db "No of Spaces :$"
vowels db '0'
consonant db '0'
digit db '0'
spaces db '0'

.code

MAIN PROC
    mov ax,@DATA
    mov ds,ax
    
    mov ah,9
    LEA dx,msg
    int 21h
    
   
    
    input:
        mov ah,1
        int 21h
        
        cmp al,13
        je print
        
        cmp al,32
        je space
        
        cmp al,'a'
        je vowel
        cmp al,'e'
        je vowel
        cmp al,'i'
        je vowel
        cmp al,'o'
        je vowel
        cmp al,'u'
        je vowel
        cmp al,'A'
        je vowel
        cmp al,'E'
        je vowel
        cmp al,'I'
        je vowel
        cmp al,'O'
        je vowel
        cmp al,'U'
        je vowel
        
        cmp al,48
        jge check_digit
        
        inc consonant
        jmp input
    
    vowel:
        inc vowels
        jmp input
    space:
        inc spaces
        jmp input
    check_digit:
        cmp al,57
        jle digitt
        inc consonant
        jmp input
    digitt:
        inc digit
        jmp input
        
    print:
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        LEA DX,msg1
        mov ah,9
        int 21h
       
        mov ah,2
        mov dl,vowels
        int 21h
        
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        LEA DX,msg2
        mov ah,9
        int 21h
       
        mov ah,2
        mov dl,consonant
        int 21h        
        
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        LEA DX,msg3
        mov ah,9
        int 21h
       
        mov ah,2
        mov dl,digit
        int 21h     
        
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        LEA DX,msg4
        mov ah,9
        int 21h
       
        mov ah,2
        mov dl,spaces
        int 21h
    
    exit:
        mov ah,4ch
        int 21h

        
        
         
    
    
