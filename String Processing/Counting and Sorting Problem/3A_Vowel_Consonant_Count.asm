.model small
.stack 100h

.data
VOWELS db "AEIOUaeiou$"

vowel_cnt db 0
cons_cnt db 0
digit_cnt db 0
space_cnt db 0

str db 100 dup('?')

.code

MAIN PROC
    mov ax,@data
    mov ds,ax
    
    mov si,offset str
    
    INPUT:
        mov ah,1
        int 21h
        
        cmp al,13
        je break
       
        mov str[si],al
        inc si
        jmp INPUT
    
    BREAK:
        ;put $ at end for safety
        mov str[si],'$'
        
        ;newline
        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h
        
        mov si,offset str
        
    CHECK_STR:
        mov al,str[si]
        
        cmp al,'$'
        je exit
        
        cmp al,32
        je update_space
        
        cmp al,'9'
        jle check_if_number
        
        cmp al,'A'
        jge check_if_alphabet
    
    update_space:
        inc space_cnt
        inc si
        jmp CHECK_STR
    
    check_if_number:
        cmp al,'0'
        jge update_number
        
    update_number:
        inc digit_cnt
        inc si
        jmp CHECK_STR
    
    check_if_alphabet:
        cmp al,'z'
        jle check_vowel
        jmp CHECK_STR
        
    check_vowel:
        mov di,offset VOWELS
        
        LOOPV:
            cmp VOWELS[di],'$'
            je update_consonant
            
            cmp al,VOWELS[di]
            je update_vowels
            
            inc di
            jmp LOOPV
        
        update_consonant:
            inc cons_cnt
            inc si
            JMP CHECK_STR
        
        update_vowels:
            inc vowel_cnt
            inc si
            JMP CHECK_STR 
    exit:
        mov ah,2
        mov dl,vowel_cnt
        add dl,48
        int 21h
          mov ah,2
        mov dl,cons_cnt
         add dl,48
        int 21h
          mov ah,2
        mov dl,digit_cnt
         add dl,48
        int 21h
          mov ah,2
        mov dl,space_cnt
         add dl,48
        int 21h
        
         