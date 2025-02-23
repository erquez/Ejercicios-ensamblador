TITLE COMPARACIONES_SALTOS

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

;Comparacion:

;En caso de que sean iguales
MOV AL,7
CMP AL,7 ;Se activara ZF(zero flag), lo que significa que son iguales.
JZ ES_CERO ;Salta a ES_CERO si se activa ZF
JNZ NO_CERO ;Salta a NO_CERO si no se activa ZF
JMP EXIT ;Salta a EXIT

ES_CERO:
MOV BL,55

NO_CERO:
MOV BL,33
;En caso de que no sean iguales:


;Menor: se activa la SF(sign flag), lo que significa que es menor.
MOV AL,7
CMP AL,8


EXIT:
RET
Inicio ENDP
Codigo ENDS

 END Inicio