/* Definiciones */
%{
  // TODO: Incluir codigo C
  # include "token.h"
  # define FMT_TOKEN_VAL "{ %s; \"%s\" }"
%}

/* Opciones y RegEx */
%option noyywrap

DIGITO [0-9]
LETRA [aA-zZ]
LETRA_MIN [a-z]
LETRA_MAY [A-Z]
ESPACIO [ ]
/* 1.a) */
CODIGO_POSTAL     ^[1-9]({DIGITO}{3})$
/* 1.b) */
ARG_AUTO          ^({LETRA_MAY}{2}){ESPACIO}({DIGITO}{3}){ESPACIO}({LETRA_MAY}{2})$
ARG_MOTO          ^({LETRA_MAY}{DIGITO}{2}){ESPACIO}({DIGITO}{LETRA_MAY}{3})$
BRA_AUTO          ^({LETRA_MAY}{3})({DIGITO}{LETRA_MAY}{DIGITO}{2})$
BRA_MOTO          ^({LETRA_MAY}{3}){ESPACIO}({DIGITO}{LETRA_MAY}{DIGITO}{2})$
BOL_AUTO          ^({LETRA_MAY}{2}){ESPACIO}({DIGITO}{5})$
PAR_AUTO          ^({LETRA_MAY}{4}){ESPACIO}({DIGITO}{3})$
PAR_MOTO          ^({DIGITO}{3}){ESPACIO}({LETRA_MAY}{4})$
URU_AUTO_MOTO     ^({LETRA_MAY}{3}){ESPACIO}({DIGITO}{4})$
PATENTE_MERCOSUR  ^({ARG_AUTO}|{ARG_MOTO}|{BRA_AUTO}|{BRA_MOTO}|{BOL_AUTO}|{PAR_AUTO}|{PAR_MOTO}|{URU_AUTO}|{URU_MOTO})$
/* 1.c) */
COMENTARIO (\/\*)([" "|\n|\t]*[a-zA-Z]*)*(\*\/)
/* 1.d) */
ID ^[aA-zZ]([aA-zZ]|[0-9]|[-])*(([aA-zZ]|[0-9]))$
/* 1.e) */
CONSTANTE_DECIMAL       ^[1-9][0-9]*$
CONSTANTE_OCTAL         ^(0[o]?)[0-7]*$
CONSTANTE_HEXA          ^(0[xX])([0-9]|[aA-fF])*$
CONSTANTE_BINARIA       ^(0[b])[0-1]*$
/* 1.f) */
CONSTANTE_FLOTANTE      ^([0-9]|[1-9][0-9])[.][0-9]{1,2}$
/* 1.g) */
CONSTANTE_STRING ^["][^"]*["]$

/* Reglas y acciones */
%%
"IF"      { printf(FMT_TOKEN_VAL, TOKEN_RW_IF, yytext); }
"WHILE"   { printf(FMT_TOKEN_VAL, TOKEN_RW_WHILE, yytext); }
"DECVAR"  { printf(FMT_TOKEN_VAL, TOKEN_RW_DECVAR, yytext); }
"ENDDEC"  { printf(FMT_TOKEN_VAL, TOKEN_RW_ENDDEC, yytext); }
"INTEGER" { printf(FMT_TOKEN_VAL, TOKEN_RW_INTEGER, yytext); }
"FLOAT"   { printf(FMT_TOKEN_VAL, TOKEN_RW_FLOAT, yytext); }
"WRITE"   { printf(FMT_TOKEN_VAL, TOKEN_RW_WRITE, yytext); }

"=="      { printf(FMT_TOKEN_VAL, TOKEN_OP_EQ, yytext); }
"!="      { printf(FMT_TOKEN_VAL, TOKEN_OP_NEQ, yytext); }
">="      { printf(FMT_TOKEN_VAL, TOKEN_OP_GE, yytext); }
"<="      { printf(FMT_TOKEN_VAL, TOKEN_OP_LE, yytext); }
">"       { printf(FMT_TOKEN_VAL, TOKEN_OP_GT, yytext); }
"<"       { printf(FMT_TOKEN_VAL, TOKEN_OP_LT, yytext); }
"||"      { printf(FMT_TOKEN_VAL, TOKEN_OP_OR, yytext); }
"&&"      { printf(FMT_TOKEN_VAL, TOKEN_OP_AND, yytext); }

"!"       { printf(FMT_TOKEN_VAL, TOKEN_OP_NOT, yytext); }
"|"       { printf(FMT_TOKEN_VAL, TOKEN_OP_OR_BIN, yytext); }
"&"       { printf(FMT_TOKEN_VAL, TOKEN_OP_AND_BIN, yytext); }
"^"       { printf(FMT_TOKEN_VAL, TOKEN_OP_XOR_BIN, yytext); }

"+"       { printf(FMT_TOKEN_VAL, TOKEN_OP_SUM, yytext); }
"-"       { printf(FMT_TOKEN_VAL, TOKEN_OP_SUB, yytext); }
"/"       { printf(FMT_TOKEN_VAL, TOKEN_OP_DIV, yytext); }
"*"       { printf(FMT_TOKEN_VAL, TOKEN_OP_MUL, yytext); }
"="       { printf(FMT_TOKEN_VAL, TOKEN_OP_ASIG, yytext); }
"%"       { printf(FMT_TOKEN_VAL, TOKEN_OP_MOD, yytext); }

{CODIGO_POSTAL} { printf(FMT_TOKEN_VAL, TOKEN_CODIGO_POSTAL, yytext); }
{ARG_AUTO}      { printf(FMT_TOKEN_VAL, TOKEN_ARG_AUTO, yytext); }
{ARG_MOTO}      { printf(FMT_TOKEN_VAL, TOKEN_ARG_MOTO, yytext); }
{BRA_AUTO}      { printf(FMT_TOKEN_VAL, TOKEN_BRA_AUTO, yytext); }
{BRA_MOTO}      { printf(FMT_TOKEN_VAL, TOKEN_BRA_MOTO, yytext); }
{BOL_AUTO}      { printf(FMT_TOKEN_VAL, TOKEN_BOL_AUTO, yytext); }
{PAR_AUTO}      { printf(FMT_TOKEN_VAL, TOKEN_PAR_AUTO, yytext); }
{PAR_MOTO}      { printf(FMT_TOKEN_VAL, TOKEN_PAR_MOTO, yytext); }
{URU_AUTO_MOTO} { printf(FMT_TOKEN_VAL, TOKEN_URU_AUTO_MOTO, yytext); }
{COMENTARIO}    { printf(FMT_TOKEN_VAL, TOKEN_COMENTARIO, yytext); }
{ID}            { printf(FMT_TOKEN_VAL, TOKEN_ID, yytext); }
{CONSTANTE_DECIMAL}   { printf(FMT_TOKEN_VAL, TOKEN_CONSTANTE_DECIMAL, yytext); }
{CONSTANTE_OCTAL}     { printf(FMT_TOKEN_VAL, TOKEN_CONSTANTE_OCTAL, yytext); }
{CONSTANTE_HEXA}      { printf(FMT_TOKEN_VAL, TOKEN_CONSTANTE_HEXA, yytext); }
{CONSTANTE_BINARIA}   { printf(FMT_TOKEN_VAL, TOKEN_CONSTANTE_BINARIA, yytext); }
{CONSTANTE_FLOTANTE}  { printf(FMT_TOKEN_VAL, TOKEN_CONSTANTE_FLOTANTE, yytext); }
{CONSTANTE_STRING}    { printf(FMT_TOKEN_VAL, TOKEN_CONSTANTE_STRING, yytext); }

{DIGITO}  { printf(FMT_TOKEN_VAL, TOKEN_DIGITO, yytext); }
{LETRA}   { printf(FMT_TOKEN_VAL, TOKEN_LETRA, yytext); }
%%

/* Código */
int main() {
  yylex();
}