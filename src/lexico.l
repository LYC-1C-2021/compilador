/* Definiciones */
%{
  # include "sintactico.h"

  void yyerror (char const *s);
%}

/* Opciones y RegEx */
%option noyywrap

DIGITO    [0-9]
LETRA     [aA-zZ]

/* Reglas y acciones */
%%
{DIGITO} { printf("DIGITO: %d\n", DIGITO); return DIGITO; }
{LETRA} { printf("LETRA: %d\n", LETRA); return LETRA;}

"\t"
"\n"
"\r\n"
"\n\t"
" " 

. { yyerror("ERROR: caracter desconocido"); }

%%

void yyerror (char const *s) {
   fprintf (stderr, "%s\n", s);
}
