
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
variable1		  db		  '$'
p1		  dd		  ?
p2		  dd		  ?
p3		  dd		  ?
b4		  dd		  ?
b5		  dd		  ?
_cte1		  dd		  1054.23
_cte2		  dd		  343
_cte3		  dd		  99999.99
_cte4		  dd		  99.
_cte5		  dd		  .9999
_cte6		  dd		  22
_cte7		  dd		  9
_cte8		  dd		  2
_cte9		  db		  'constante string','$'
_cte10		  dd		  21
_cte11		  dd		  2
_cte12		  dd		  21
_cte13		  dd		  2
_cte14		  dd		  21
_cte15		  dd		  2
_cte16		  dd		  30
_cte17		  dd		  30
_cte18		  dd		  40
_cte19		  db		  'Condicion doble AND','$'
_cte20		  dd		  30
_cte21		  dd		  40
_cte22		  db		  'Condicion doble OR','$'
_cte23		  db		  'str 1','$'
_cte24		  db		  'str 2','$'
_cte25		  db		  'str 3','$'
_cte26		  db		  'str 4','$'

aux1 dd ?
aux2 dd ?

.CODE
main:
mov AX,@DATA ;
mov DS,AX ;
finit ;

fld _cte1;asignacion
fstp p3
fld _cte2;asignacion
fstp b4
fld _cte3;asignacion
fstp a1
fld _cte4;asignacion
fstp a2
fld _cte5;asignacion
fstp a3
fld _cte7
fld _cte6
fmul
fstp aux1
fld _cte8
fld aux1
fadd
fstp aux1
fld _cte9;asignacion
fstp a1
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
fld b4
fstp aux2
while1:
fld aux1
fcomp aux2
fstsw ax
fwait
sahf
ffree st(0)
jbe while1
fld b1;asignacion
fstp a2
fld _cte11
fld _cte10
fprem
fstp aux1
fld _cte13
fld _cte12
fdiv
fstp aux1
fld _cte15
fld _cte14
fprem
fstp aux1
fld b5
fstp aux1
fld _cte16
fstp aux2
fld aux1
fcomp aux2
fstsw ax
fwait
sahf
ffree st(0)
jne else_if1
fld b5;asignacion
fstp b4
jmp end_if1
else_if1:
fld a2
fld a1
fadd
fstp aux1
fld b5
fstp aux1
fld _cte17
fstp aux2
fld b5
fstp aux1
fld _cte18
fstp aux2
fld aux1
fcomp aux2
fstsw ax
sahf
ffree st(0)
jbe end_if2
DisplayString _cte19
newLine 1
fld b5
fstp aux1
fld _cte20
fstp aux2
fld b5
fstp aux1
fld _cte21
fstp aux2
fld aux1
fcomp aux2
fstsw ax
sahf
ffree st(0)
jle end_if3
DisplayString _cte22
newLine 1
DisplayString _cte23
newLine 1
DisplayString _cte24
newLine 1
DisplayString _cte25
newLine 1
DisplayString _cte26
newLine 1
end_if3:
jmp end_while1
end_while1:

mov AX, 4C00h
int 21h
end main