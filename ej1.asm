TITLE ESTRUCTURA_BASICA

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





RET
Inicio ENDP
Codigo ENDS

 END Inicio