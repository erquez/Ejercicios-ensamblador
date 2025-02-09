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


 
 
;Suma
MOV AL,5 ;despues de esto, AL tendra el valor 5
ADD AL,7 ;despues de esto AL tendra el valor 12 (el valor max es 255 ya que AL tiene 8 bits)

;Resta
MOV AL,5 ;despues de esto, AL=5
SUB AL,3 ;despues de esto, AL=2 




;Multiplicacion
;Resultado tipo Byte = Se almacena en AX (8 bits,255 valor max)
MOV AL,255
MOV BL,255
MUL BL

;Resultado tipo palabra = Se almacena en DX/AX (16 bits,65535 valor max)
MOV AX,300
MOV BX,500
MUL BX
;Resultado en DX =0002 y AX = 49F0 es decir, el resultado es 0249F0 = 150000 (concatenar DX con AX)




;Division de palabra: 
MOV AX,505
MOV BL,3
DIV BL
;Resultado(aparece en AL) = A8 , Residuo(aparece en AH) = 1 


;Division doble palabra entre palabra:
;El principio del numero mas grande se pone en DX y el final en AX
MOV DX,002BH
MOV AX,342AH
;El segundo numero se pone en BX
MOV BX,0FC2FH
DIV BX
;El resultado aparece en AX (2B) y el residuo en DX (D845).


RET
Inicio ENDP
Codigo ENDS

 END Inicio



