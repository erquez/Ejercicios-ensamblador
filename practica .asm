datos segment
    fila db ?
datos ends

codigo segment para
    
    assume cs:codigo ,ds:datos, ss:pila
    
    p1 proc far
        
        mov AX,datos
        mov DS,AX
        mov ah,00h
        mov al,03h
        int 10h
        cero:mov cl,00h
        uno:inc cl
        cmp cl,10h
        je escribe
        jmp uno
        escribe: call pantalla
        jmp cero
        mov ax,4c00h
        int 21h
        p1 endp
        colocacursor macro columna,pagina
        mov ah,02h
        mov bh,pagina
        mov dh,[0000]
        mov dl,columna
        int 10h
        endm
        pantalla proc near
            push cx
            colocacursor 00,00
            mov ah,09h 
            mov al,"A"
            mov bh,00h
            mov cx,0001h
            mov bl,0F0h
            int 10
            colocacursor 40,00
            mov ah,09h
            mov al,"B"
            mov bh,00h
            mov cx,0001h
            mov bl,0F0h
            int 10h
            colocacursor 79,00
            mov ah,09h
            mov al,"C"
            mov bh,00h
            mov cx,0001h
            mov bl,0F0h
            int 10h
            add [0000h],01h
            pop cx
            ret ;retorno a P1
     pantalla endp
codigo ends
        
pila segment para stack
     dw 512 dup (?)
pila ends


end p1