# Compilador
UNLaM - Lenguajes y Compiladores - 1er Cuatrimestre 2021

## Integrantes
  - Romina Paola Tilla
  - Paola Vanesa Servis
  - Brian Servis
  - Ezequiel Silvero
  - Bruno Sendras


### Para compilar

Primera parte
```
cd src\TP\Primera_Entrega
Flex Lexico.l
Bison -dyv Sintactico.y
gcc lex.yy.c y.tab.c -o Primera
```

### Ejecutar
```
.\Primera prueba.txt
```
