datos segment

ends

codigo segment para
    assume cs:codigo, ds:datos, ss:pila
    
    p1 proc far
        
        mov ah,10h
        mov bh,12h
        call p2 ;salto a p2       
        mov cl,05h       
        call p2 ;salto a p2        
        mov ax,4c00h
        int 21h
        
        p1 endp
        
        p2 proc near
            add ah,bh
            inc bh
            ret; retorno a p1
        p2 endp
        
codigo ends

pila segment para stack 
    
    dw 512 dup(?)
    
pila ends

end p1
            