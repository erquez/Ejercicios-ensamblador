datos segment
    T1 db 0A2h,7Fh,0B7h
    T2 db 9Bh,7Fh,37h
    T3 db 3 DUP(?)
datos ends


codigo segment para
    assume cs:codigo, DS:datos, SS:pila

practica2 proc far
mov ax,datos
mov ds,ax

Lea BX,T1
mov al,00h
Xlat ; Recoger primer dato de T1
mov ah,al ;Guardo el dato recogido en AH

Lea BX,T2
mov al,00h
Xlat ; Recoger primer dato de T2
cmp ah,al
ja mayor ;si el dato2>dato1 salto a mayor
jb menor ;si el dato2<dato1 salto a menor
je igual ;si el dato1=dato2 salto a igual

datos2:
Lea BX,T1
mov al,01h
Xlat ; Recoger segundo dato de T1 
mov ah,al

Lea BX,T2
mov al,01h
Xlat ; Recoger segundo dato de T2 

cmp ah,al
ja mayor1 ;si el dato2>dato1 salto a mayor
jb menor1 ;si el dato2<dato1 salto a menor
je igual1 ;si el dato1=dato2 salto a igual

datos3:
Lea BX,T1
mov al,02h
Xlat ; Recoger tercer dato de T1
    
Lea BX,T2
mov al,02h
Xlat ; Recoger tercer dato de T2

cmp ah,al ;comparo ambos datos
ja mayor2 ;si el dato2>dato1 salto a mayor
jb menor2 ;si el dato2<dato1 salto a menor
je igual2 ;si el dato1=dato2 salto a igual
mov al,0ffh;
jmp salir

mayor: sub al,ah
       mov [T3],al
       jmp datos2
       
menor: add al,ah
       mov [T3],al
       jmp datos2
       
igual: mov [T3],0FFh 
       jmp datos2             


mayor1: sub al,ah
       mov [T3+1],al
       jmp datos3
    
menor1: add al,ah
       mov [T3+1],al
       jmp datos3

igual1: mov [T3+1],0FFh
       jmp datos3


mayor2: sub al,ah
       mov [T3+2],al
    jmp salir
menor2: add al,ah
       mov [T3+2],al
    jmp salir
       
igual2: mov [T3+2],0FFh 
    jmp salir           

salir: mov ax,4c00h
    int 21h
practica2 endp

codigo ends


pila segment para stack
    dw 512 dup(?)
pila ends
end practica2