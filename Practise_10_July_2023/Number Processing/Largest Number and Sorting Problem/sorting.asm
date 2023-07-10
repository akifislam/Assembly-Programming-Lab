.model small
.stack 100h

.data
INPUT db 100 dup('$')

.code

MAIN PROC
    mov ax,@data
    mov ds,ax
    
    mov si,0
    
    START_INPUT:
        mov ah,1
        int 21h
        
        cmp al,13
        je END_INPUT
        
        mov INPUT[si],al
        inc si
        jmp START_INPUT
    
    END_INPUT:
        mov si,0
        mov di,si
        
        LOOP1:
            mov ah,INPUT[si]
            
            cmp ah,'$'
            je END_LOOP1
            
            LOOP2:
                MOV al,INPUT[di]
                cmp al,'$'
                je END_LOOP2
                
                cmp ah,INPUT[DI]
                ;JL SWAP ; keep this for ascending sort
                JG SWAP ; Keep this for descending Sort
                
                inc di
                jmp LOOP2
            
            SWAP:
                mov AL,AH ;AH is now saved at AL
                mov ah, input[di]
                mov input[si],ah
                mov INPUT[di],AL
                inc di
                jmp LOOP2
                
            END_LOOP2:
                mov di,0
                inc si
                jmp LOOP1
        
        END_LOOP1:
            mov ah,2
            mov dl,10
            int 21h
            mov dl,13
            int 21h
            MOV AH,9
            LEA DX,INPUT
            int 21h
                   
        