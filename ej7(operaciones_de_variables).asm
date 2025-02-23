TITLE OPERACIONES_DE_VARIABLES

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

;Variables para operaciones

;tipo byte
NUM1 DB 7
NUM2 DB 5
RESULTADO1 DB ? ;no esta inicializada ya que es el resultado de la operacion

;tipo word
NUM3 DW 255
NUM4 DW 130
RESULTADO2 DW ?

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



;Operaciones de variables tipo byte
MOV AL,NUM1
ADD AL,NUM2
MOV RESULTADO1,AL 
;Las otras operaciones se hacen de la misma manera pero cambiando ADD por sus respectivos comandos reservados




;Operaciones de variables tipo word
MOV AX,NUM3
ADD AX,NUM4
MOV RESULTADO2,AX
;Las otras operaciones se hacen de la misma manera pero cambiando ADD por sus respectivos comandos reservados


RET
Inicio ENDP
Codigo ENDS

 END Inicio



