/* Declaraciones */
%{
  # include <stdio.h>
  
  int yylex();
  void yyerror (char const *s);

  FILE *yyin;
%}

%token DIGITO
%token LETRA

/* Reglas gramaticales */
%%
  programa: sentencia           { printf("Regla 1\n"); }
          | programa sentencia  { printf("Regla 2\n"); }
          ;
  
  sentencia: DIGITO { $$ = $1; printf("Regla 3\n"); }
           | LETRA  { $$ = $1; printf("Regla 4\n"); }
           ;
%%

/* Código */
int main(int argc, char * argv[]) {
  if (argc > 1) {
    if ((yyin = fopen(argv[1], "rt")) != NULL ) {
      yyparse();
    } else {
      printf("ERROR: no se pudo abrir el archivo: %s", argv[1]);
    }
    fclose(yyin);
  }
}
