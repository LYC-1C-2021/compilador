/* Definiciones */
%{
  // TODO: Incluir codigo C
  # define TOKEN_DIGITO "DIGITO"
  # define TOKEN_LETRA "LETRA"
%}

/* Opciones y RegEx */
%option noyywrap

DIGITO [0-9]
LETRA [aA-zZ]

/* Reglas y acciones */
%%
{DIGITO} { printf("%s", TOKEN_DIGITO); }
{LETRA} { printf("%s", TOKEN_LETRA); }
%%

/* Código */
int main() {
  yylex();
}