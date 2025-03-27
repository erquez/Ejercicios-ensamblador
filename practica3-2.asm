datos segment
    T1 db 0A2h,7Fh,0B7h
    T2 db 9h,7Fh,37h
    T3 db 3 DUP(?)
datos ends


codigo segment para
    assume cs:codigo, DS:datos, SS:pila

practica2 proc far
mov ax,datos
mov ds,ax 
mov cx,0000h

bucle:
Lea BX,T1
mov al,00h
add al,cl
Xlat ; Recoger dato de T1
mov ah,al ;Guardo el dato recogido en AH

Lea BX,T2
mov al,00h
add al,cl
Xlat ; Recoger dato de T2


cmp ah,al
 
ja mayor ;si el dato2>dato1 salto a mayor
jb menor ;si el dato2<dato1 salto a menor
mov ah,0ffh
jmp seguir


mayor: sub al,ah
       
menor: add al,ah
       jmp seguir
       
seguir:lea BX,T3
add bx,cx
mov [BX],ah
inc cx
cmp cx,0003h
jne bucle

                        

mov ax,4c00h
int 21h
practica2 endp

codigo ends


pila segment para stack
    dw 512 dup(?)
pila ends
end practica2
