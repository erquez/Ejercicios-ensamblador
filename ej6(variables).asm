TITLE VARIABLES

Datos SEGMENT
;Declarar las variables aqui

;BYTE
T1 DB 255
;WORD
T2 DW 65535
;ARRAYS
T3 DB 7,7,7,7,7
T4 DW 7,70,700,7000
T5 DB 6 DUP(7) ;para arrays largos
T6 DW 6 DUP(777);para arrays largos

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



