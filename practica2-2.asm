datos segment para
    
   T1 db 14h,29h,45h
   T2 db 45h,29h,14h
   T3 db 3 dup (?)
   
datos ends



codigo segment para
    
    assume CS:codigo, DS:datos, SS:pila
   
prac2 proc far
   
   mov ax,datos
   mov ds,ax 
   
   ;UTLIZANDO XLAT
   ;Primer dato
   Lea BX,T1
   mov al,00h
   Xlat
   mov ah,al
   
   Lea BX,T2
   mov al,00h
   Xlat
   
   add ah,al
   mov [T3],ah
   
   ;Segundo dato
   Lea BX,T1
   mov al,01h
   Xlat
   mov ah,al
   
   Lea BX,T2
   mov al,01h
   Xlat
   
   add ah,al
   mov [T3+1],ah
   
   ;Tercer dato
   Lea BX,T1
   mov al,02h
   Xlat
   mov ah,al
   
   Lea BX,T2
   mov al,02h
   Xlat
   
   add ah,al
   mov [T3+2],ah
   
   
   
   mov ax,4c00h
   int 21h
   
prac2 endp

codigo ends

pila segment para stack
    
    dw 512 dup(?)
    
pila ends

ends prac2
 