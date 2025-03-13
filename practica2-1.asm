datos segment para
 
 T1 db 14h,29h,45h;
 T2 db 45h,29h,14h
 T3 db 3 dup (?)
 
datos ends


codigo segment para
    
ASSUME CS:codigo,DS:datos,SS:pila

prac2 proc far
    
    mov ax,datos
    mov ds,ax  
    
    ;DIRECCIONAMIENTO ABSOLUTO
    
    ;Primer dato
    mov AH,[0000] ;Primer dato T1
    mov AL,[0003] ;Primer dato T2
    add AH,AL  ;Sumar ambos datos
    mov [0006],AH  ;Dejar el resultado en el primer dato de T3
    
    ;Segund dato
    mov AH,[0001] ;Segundo dato T1
    mov AL,[0004] ;Segundo dato T2
    add AH,AL  ;Sumar ambos datos
    mov [0007],AH  ;Dejar el resultado en el segundo dato de T3
    
    ;Tercer dato
    mov AH,[0002] ;Tercer dato T1
    mov AL,[0005] ;Tercer dato T3
    add AH,AL  ;Sumar ambos datos
    mov [0008],AH  ;Dejar el resultado en el segundo dato de T3
    
    mov ax,4c00h
    int 21h

prac2 endp


codigo ends


pila segment para stack
    
    dw 512 dup(?)
    
pila ends

end prac2