TITLE MULTIPLICACION

Datos SEGMENT
; Declarar las variables aqui

Datos ENDS 
 
 
Pila SEGMENT
   
   DB 64 DUP(0)
     
Pila ENDS 


Codigo SEGMENT

Inicio PROC FAR
    
Assume DS:Datos, CS:Codigo, SS:Pila
PUSH DS
MOV AX,0
PUSH AX

MOV AX,Datos
MOV DS,AX
MOV ES,AX
;Codigo abajo-->


;Multiplicacion:  

;Resultado tipo Byte = Se almacena en AX (8 bits,255 valor max)
MOV AL,255
MOV BL,255
MUL BL

;Resultado tipo palabra = Se almacena en DX/AX (16 bits,65535 valor max)
MOV AX,300
MOV BX,500
MUL BX
;Resultado en DX =0002 y AX = 49F0 es decir, el resultado es 0249F0 = 150000 (concatenar DX con AX)


RET
Inicio ENDP
Codigo ENDS

 END Inicio
