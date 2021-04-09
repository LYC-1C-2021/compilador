#!/bin/bash
cd src
flex lexico.l
cd ..
rm -rf bin && mkdir bin
gcc src/lex.yy.c -o bin/lexico
