#!/bin/bash
cd src
flex lexico.l
cd .. 
mkdir bin
gcc src/lex.yy.c -o bin/lexico
