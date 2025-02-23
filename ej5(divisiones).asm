TITLE DIVISION

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



