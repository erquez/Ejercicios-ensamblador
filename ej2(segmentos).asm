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
;AX - Registro acumulador(operaciones matematicas)
;BX - Registro indice (modos de direccionamiento o indicar offset)
;CX - Registro contador (para instrucciones de repeticion o bucle)
;DX - Registro de datos (junto a AX para operaciones aritmeticas de 32 bits)

;SI - Indicar la direccion desde donde comienzan los datos que quiero leer
;DI - Indicar la direccion donde terminan los datos que quiero leer
;BP - Utilizado por instrucciones que quieren acceder a la pila
;SP - Indica el offset sobre la pila donde se localiza el dato al que se desea acceder



RET
Inicio ENDP
Codigo ENDS

 END Inicio