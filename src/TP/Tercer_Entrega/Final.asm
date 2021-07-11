
include macros2.asm		 ;incluye macros
include number.asm		 ;incluye el asm para impresion de numeros
.model large
.386
.stack 200h

.DATA

read db 'Ingrese valor por teclado...', '$'
_cte1		  db		  'str 1','$'
_cte2		  db		  'str 2','$'
_cte3		  db		  'str 3','$'
_cte4		  db		  'str 4','$'

aux1 dd ?
aux2 dd ?

.CODE
main:
mov AX,@DATA ;
mov DS,AX ;
finit ;

DisplayString _cte1
newLine 1
DisplayString _cte2
newLine 1
DisplayString _cte3
newLine 1
DisplayString _cte4
newLine 1

mov AX, 4C00h
int 21h
end main