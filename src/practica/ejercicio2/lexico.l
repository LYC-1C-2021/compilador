/* Definiciones */
%{
  # include "token.h"
  # define FMT_TOKEN_VAL "{ %s; \"%s\" }\n"
  # define MAX_SIMBOLOS 3000
  FILE *yyin;

  /* TODO: Implementar tabla de simbolos en memoria
  typedef struect simbolo_s {

  } simbolo_t

  simbolo_t tabla_simbolos[MAX_SIMBOLOS]
  */
  
  void guardarEnTabla(char *tk, char *n, char *t, char *v, int l);
%}

/* Opciones y RegEx */
%option noyywrap
%option yylineno

DIGITO [0-9]
LETRA [aA-zZ]
LETRA_MIN [a-z]
LETRA_MAY [A-Z]
ESPACIO [ ]


ID                  [aA-zZ]([aA-zZ]|[0-9]|[-])*(([aA-zZ]|[0-9]))

CONSTANTE_ENTERA    [0-9]{1,3}

CONSTANTE_FLOTANTE  ([0-9]{1,3})[.][0-9]{1,4}

CONSTANTE_STRING    ["][^"]*["]

/* Reglas y acciones */
%%
"DECVAR"  { printf(FMT_TOKEN_VAL, TOKEN_RW_DECVAR, yytext); }
"ENDDEC"  { printf(FMT_TOKEN_VAL, TOKEN_RW_ENDDEC, yytext); }
"while"   { printf(FMT_TOKEN_VAL, TOKEN_RW_WHILE, yytext); }
"if"      { printf(FMT_TOKEN_VAL, TOKEN_RW_IF, yytext); }
"else"    { printf(FMT_TOKEN_VAL, TOKEN_RW_ELSE, yytext); }
"write"   { printf(FMT_TOKEN_VAL, TOKEN_RW_WRITE, yytext); }
"Integer" { printf(FMT_TOKEN_VAL, TOKEN_RW_INTEGER, yytext); }
"Float"   { printf(FMT_TOKEN_VAL, TOKEN_RW_FLOAT, yytext); }

"=="      { printf(FMT_TOKEN_VAL, TOKEN_OP_EQ, yytext); }
"!="      { printf(FMT_TOKEN_VAL, TOKEN_OP_NE, yytext); }
">="      { printf(FMT_TOKEN_VAL, TOKEN_OP_GE, yytext); }
"<="      { printf(FMT_TOKEN_VAL, TOKEN_OP_LE, yytext); }
">"       { printf(FMT_TOKEN_VAL, TOKEN_OP_GT, yytext); }
"<"       { printf(FMT_TOKEN_VAL, TOKEN_OP_LT, yytext); }

"+"       { printf(FMT_TOKEN_VAL, TOKEN_OP_SUM, yytext); }
"*"       { printf(FMT_TOKEN_VAL, TOKEN_OP_MUL, yytext); }
"/"       { printf(FMT_TOKEN_VAL, TOKEN_OP_DIV, yytext); }
":"       { printf(FMT_TOKEN_VAL, TOKEN_OP_ASIG, yytext); }

","       { printf(FMT_TOKEN_VAL, TOKEN_COMMA, yytext); }
"{"       { printf(FMT_TOKEN_VAL, TOKEN_BRA_O, yytext); }
"}"       { printf(FMT_TOKEN_VAL, TOKEN_BRA_C, yytext); }
"("       { printf(FMT_TOKEN_VAL, TOKEN_PAR_O, yytext); }
")"       { printf(FMT_TOKEN_VAL, TOKEN_PAR_C, yytext); }

{ID}                  { guardarEnTabla(TOKEN_ID, yytext, "", "", strlen(yytext)); }
{CONSTANTE_ENTERA}    { guardarEnTabla(TOKEN_CONSTANTE_ENTERA, yytext, "", "", 0); }
{CONSTANTE_FLOTANTE}  { guardarEnTabla(TOKEN_CONSTANTE_FLOTANTE, yytext, "", "", 0); }
{CONSTANTE_STRING}    { guardarEnTabla(TOKEN_CONSTANTE_STRING, yytext, "", "", strlen(yytext)); }

"\t"
"\n"
"\r"
"\r\n"
" "
";"

.           { printf("\nCaracter invalido! %s\n", yytext);  exit(1);}

%%

/* Código */
int main(int argc, char *argv[]) {
  if (argc > 0) {
    if((yyin = fopen(argv[1], "rt")) != NULL) {
      yylex();
    } else {
      printf("Error abriendo el archivo de entrada\n");
    }
  }
}

void guardarEnTabla(char *tk, char *n, char *t, char *v, int l) {
  FILE *ts;
  if ((ts = fopen("tabla.txt", "a")) != NULL ){
    if (l > 0) {
      fprintf(ts, "%-30s\t%-30s\t%s\t%s\t%d\n", tk, n, t, v, l);
    } else {
      fprintf(ts, "%-30s\t%-30s\t%s\t%s\n", tk, n, t, v);
    }
    fclose(ts);
  }
}; 
