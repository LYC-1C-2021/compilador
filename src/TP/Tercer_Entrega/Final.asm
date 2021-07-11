
include macros2.asm		 ;incluye macros
include number.asm		 ;incluye el asm para impresion de numeros
.model large
.386
.stack 200h

.DATA

read db 'Ingrese valor por teclado...', '$'
a1		  dd		  ?
a2		  dd		  ?
a3		  dd		  ?
b1		  dd		  ?
variable1		  db		  LEN_LEXEMA DUP(?),'$'
p1		  dd		  ?
p2		  dd		  ?
p3		  dd		  ?
b4		  dd		  ?
b5		  dd		  ?
_cte1		  dd		  1054.23
_cte2		  dd		  5343
_cte3		  dd		  99999.99
_cte4		  dd		  99.
_cte5		  dd		  .9999
_cte6		  dd		  22
_cte7		  dd		  9
_cte8		  dd		  2
_cte9		  db		  'constante string','$'
_cte10		  db		  'ewr','$'
_cte11		  db		  'ewr','$'
_cte12		  dd		  21
_cte13		  dd		  2
_cte14		  dd		  21
_cte15		  dd		  2
_cte16		  dd		  21
_cte17		  dd		  2
_cte18		  dd		  30
_cte19		  dd		  30
_cte20		  dd		  40
_cte21		  db		  'Condicion doble AND','$'
_cte22		  dd		  30
_cte23		  dd		  40
_cte24		  db		  'Condicion doble OR','$'
_cte25		  db		  'str 1','$'
_cte26		  db		  'str 2','$'
_cte27		  db		  'str 3','$'
_cte28		  db		  'str 4','$'

aux1 dd ?
aux2 dd ?

.CODE
main:
mov AX,@DATA ;
mov DS,AX ;
finit ;

fld ; asignacion_cte1
fstp p3
fld ; asignacion_cte2
fstp p3
fld ; asignacion_cte3
fstp a1
fld ; asignacion_cte4
fstp a2
fld ; asignacion_cte5
fstp a3
fld _cte7
fld _cte6
fmul
fstp aux1
fld _cte8
fld aux1
fadd
fstp aux1
fld ; asignacion_cte9
fstp a1
DisplayString _cte10
newLine 1
mov dx, OFFSET read
mov ah, 9
int 21h
newLine 1
GetFloat p1
newLine 1
DisplayString variable1
newLine 1
fld p1
fstp aux1
fld b1
fstp aux2
while1:
fld aux1
fcomp aux2
fstsw ax
fwait
sahf
ffree st(0)
jbe while1
fld ; asignacionb1
fstp a2
DisplayString _cte11
newLine 1
fld _cte13
fld _cte12
fprem
fstp aux1
fld _cte15
fld _cte14
fidiv
fstp aux1
fld _cte17
fld _cte16
fprem
fstp aux1
fld b5
fstp aux1
fld _cte18
fstp aux2
fld aux1
fcomp aux2
fstsw ax
fwait
sahf
ffree st(0)
jne else_if1
fld ; asignacionb5
fstp b4
jmp end_if1
else_if1:
fld a2
fld a1
fadd
fstp aux1
fld b5
fstp aux1
fld _cte19
fstp aux2
fld b5
fstp aux1
fld _cte20
fstp aux2
fld aux1
fcomp aux2
fstsw ax
sahf
ffree st(0)
jbe end_if2
DisplayString _cte21
newLine 1
fld b5
fstp aux1
fld _cte22
fstp aux2
fld b5
fstp aux1
fld _cte23
fstp aux2
fld aux1
fcomp aux2
fstsw ax
sahf
ffree st(0)
jle end_if3
DisplayString _cte24
newLine 1
DisplayString _cte25
newLine 1
DisplayString _cte26
newLine 1
DisplayString _cte27
newLine 1
DisplayString _cte28
newLine 1
end_if3:
jmp end_while
end_while1:

mov AX, 4C00h
int 21h
end main