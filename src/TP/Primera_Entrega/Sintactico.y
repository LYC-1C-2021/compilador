%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#if defined(_WIN32)
	#include <conio.h>
#endif
#include <errno.h>
#include "y.tab.h"

int yystopparser=0;
char * yytext;

FILE  *yyin;

int yyerror();
int yylex();

void guardarTS_Archivo();

%}

%token DECVAR
%token ENDDEC
%token DOS_PUNTOS
%token C_A
%token C_C
%token INTEGER
%token STRING
%token FLOAT
%token REAL
%token COMA
%token ID
%token OPE_ASIG
%token OPE_SUM
%token OPE_RES
%token OPE_MUL
%token OPE_DIV
%token CTE_REAL
%token CTE_STR
%token CTE_INT
%token P_A
%token P_C
%token IF
%token THEN
%token ELSE
%token ENDIF
%token IGUAL
%token DIST
%token MENOR
%token MAYOR
%token MEN_IG
%token MAY_IG
%token AND
%token OR
%token NOT
%token WHILE
%token ENDWHILE
%token CONST
%token WRITE
%token READ
%token PUNTO_COMA
%token L_A
%token L_C
%token MOV
%token DIV

%%
programa:
		 declaracion inicio{printf("\n---------------------------\n");}
															{printf("\n****COMPILACION EXITOSA****\n");}
															{printf("\n---------------------------\n");} 
		 | declaracion {printf("\n---------------------------\n");}
															{printf("\n****COMPILACION EXITOSA****\n");}
															{printf("\n---------------------------\n");}
		 | entrada {printf("\n---------------------------\n");}
															{printf("\n****COMPILACION EXITOSA****\n");}
															{printf("\n---------------------------\n");}
		| salida {printf("\n---------------------------\n");}
															{printf("\n****COMPILACION EXITOSA****\n");}
															{printf("\n---------------------------\n");}
;

declaracion: DECVAR definicion ENDDEC 	{printf("\n***REGLA 1 -> Declaracion:\n");} 
										{printf("\t\t\tDeclaracion\n");}
;

definicion: lista_id |  lista_id definicion	{printf("\n***REGLA 2 -> Declaracion:\n");}
											{printf("\t\t\tDefiniciones\n");}
;


inicio:	 lista_sentencias 	{printf("\n***REGLA 3 -> Inicio:\n");}
							{printf("\t\t\tLista_Sentencias\n");}
	;

lista_sentencias:sentencia		{printf("\n***REGLA 4 -> Lista_Sentencias:\n");}
								{printf("\t\t\tSentencia\n");}
				|lista_sentencias sentencia		{printf("\n***REGLA 5 -> Lista_Sentencias:\n");}
												{printf("\t\t\t Lista_Sentencias Sentencia\n");}
;
sentencia:asignacion	{printf("\n***REGLA 6 -> Sentencia:\n");}
						{printf("\t\t\tAsignacion\n");}
		  |decision		{printf("\n***REGLA 7 -> Sentencia:\n");}
						{printf("\t\t\tDecision\n");}
		  |iteracion    {printf("\n***REGLA 8 -> Sentencia:\n");}
						{printf("\t\t\tIteracion\n");}
		  |entrada		{printf("\n***REGLA 9 -> Sentencia:\n");}
						{printf("\t\t\tEntrada\n");}
		  |salida       {printf("\n***REGLA 10 -> Sentencia:\n");}
						{printf("\t\t\tSalida\n");}
		 
;

asignacion: ID OPE_ASIG expresion PUNTO_COMA	{printf("\n***REGLA 12 -> Asignacion:\n");}
												{printf("\t\t\tID OPE_ASIG Expresion\n");}
;

lista_id: ID DOS_PUNTOS tipo_dato {printf("\n***REGLA 13 -> Lista_Id:\n");}
			{printf("\t\t\tID\n");}
         |ID  COMA lista_id		{printf("\n***REGLA 14 -> Lista_Id:\n");}
								{printf("\t\t\tID COMA Lista_Id\n");}
;


tipo_dato:INTEGER 				        {printf("\n***REGLA 15 -> Tipo_Dato:\n");}
										{printf("\t\t\tInteger\n");}
          |STRING 						{printf("\n***REGLA 16 -> Tipo_Dato:\n");}
										{printf("\t\t\tString\n");}
		  |FLOAT						{printf("\n***REGLA 17 -> Tipo_Dato:\n");}
										{printf("\t\t\tFloat\n");}
;

entrada: READ ID PUNTO_COMA		{printf("\n***REGLA 18 -> Entrada: \n");}
								{printf("\t\t\t ID\n");}
;

salida: WRITE CTE_STR PUNTO_COMA	{printf("\n***REGLA 19 -> Salida:\n");}
								{printf("\t\t\t CTE_STR\n");}
       |WRITE ID PUNTO_COMA     {printf("\n***REGLA 20 -> Salida:\n");}
								{printf("\t\t\tID\n");}
;


decision:IF condicion L_A lista_sentencias L_C  {printf("\n***REGLA 23 -> Condicion:\n");}
													{printf("\t\t\t IF Condicion L_A Lista_Sentencias L_C\n");}
         |IF condicion L_A lista_sentencias L_C ELSE L_A lista_sentencias L_C
				{printf("\n***REGLA 24 -> Condicion:\n");}
				{printf("\t\t\t IF Condicion L_A Lista_Sentencias L_C ELSE L_A Lista_Sentencias L_C\n");}
;

condicion: P_A condicion_simple P_C	{printf("\n***REGLA 25 -> Condicion:\n");}
									{printf("\t\t\t Condicion_Simple\n");}
          |P_A condicion_doble P_C 	{printf("\n***REGLA 26 -> Condicion:\n");}
									{printf("\t\t\t CONDICION_Doble\n");}
		  |P_A NOT condicion_simple P_C 	{printf("\n***REGLA 27 -> Condicion:\n");}
											{printf("\t\t\t NOT Condicion_Simple\n");}
;
condicion_simple:expresion MAYOR expresion  {printf("\n***REGLA 28 -> Condicion_Simple:\n");}
											{printf("\t\t\t Expresion MAYOR Expresion\n");}
                |expresion MENOR expresion  {printf("\n***REGLA 29 -> Condicion_Simple:\n");}
											{printf("\t\t\t Expresion MENOR Expresion\n");}
                |expresion DIST expresion 	{printf("\n***REGLA 30 -> Condicion_Simple:\n");}
											{printf("\t\t\t Expresion DIST Expresion\n");}
                |expresion IGUAL expresion 	{printf("\n***REGLA 31 -> Condicion_Simple:\n");}
											{printf("\t\t\t Expresion IGUAL Expresion\n");}
                |expresion MAY_IG expresion {printf("\n***REGLA 32 -> Condicion_Simple:\n");}
											{printf("\t\t\t Expresion MAY_IG Expresion\n");}
                |expresion MEN_IG expresion {printf("\n***REGLA 33 -> Condicion_Simple:\n");}
											{printf("\t\t\t Expresion MEN_IG Expresion\n");}
;
condicion_doble:condicion_simple AND condicion_simple 	{printf("\n***REGLA 34 -> Condicion_Doble:\n");}
														{printf("\t\t\t Condicion_Simple AND Condicion_Simple\n");}
                |condicion_simple OR condicion_simple 	{printf("\n***REGLA 35 -> Condicion_Doble:\n");}
														{printf("\t\t\t Condicion_Simple OR Condicion_Simple\n");}
;
iteracion:WHILE condicion L_A lista_sentencias L_C   	{printf("\n***REGLA 36 -> Iteracion:\n");}
														{printf("\t\t\t WHILE Condicion L_A Lista_Sentencias L_C\n");}
;

expresion: termino 								{printf("\n***REGLA 37 -> Expresion:\n"); }
												{printf("\t\t\t Termino\n");}
			|expresion OPE_SUM termino			{printf("\n***REGLA 38 -> Expresion:\n"); }
												{printf("\t\t\t Expresion OPE_SUM Termino\n");}
			|expresion OPE_RES termino 			{printf("\n***REGLA 39 -> EXPRESION:\n");}
												{printf("\t\t\t Expresion OPE_RES Termino\n");}
			|expresion MOD termino 				{printf("\n***REGLA 48 -> EXPRESION:\n");}
												{printf("\t\t\t Expresion MOD Termino\n");}
			|expresion DIV termino 				{printf("\n***REGLA 49 -> EXPRESION:\n");}
												{printf("\t\t\t Expresion DIV Termino\n");}
;
termino:factor 								{printf("\n***REGLA 40 -> Termino:\n");}
											{printf("\t\t\t Factor\n");}
	   |P_A expresion P_C				    {printf("\n***REGLA 41 -> Termino:\n");}
											{printf("\t\t\t P_A expresion P_C\n");}
       |termino OPE_MUL factor 				{printf("\n***REGLA 42 -> Termino:\n");}
											{printf("\t\t\t Termino OPE_MUL Factor\n");}
	   |termino OPE_DIV factor 				{printf("\n***REGLA 43 -> Termino:\n");}
											{printf("\t\t\t Termino OPE_DIV Factor\n");}
;
factor: ID 									{printf("\n***REGLA 44 -> Factor:\n");}
											{printf("\t\t\t ID\n");}
       |CTE_INT 							{printf("\n***REGLA 45 -> Factor:\n");}
											{printf("\t\t\t CTE_INT\n");}
	   |CTE_REAL 							{printf("***REGLA 46 -> Factor:\n");}
											{printf("\t\t\t CTE_REAL\n");}
	   |CTE_STR  							{printf("\n***REGLA 47 -> Factor:\n");}
											{printf("\t\t\t CTE_STR\n");}
;




%%

int main(int argc,char *argv[])
{
  if ((yyin = fopen(argv[1], "rt")) == NULL)
  {
	printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
  }
  else
  {

	yyparse();
	 guardarTS_Archivo();
  }
  fclose(yyin);
  return 0;
}
int yyerror(void)
{
     printf("Syntax Error\n");
	 system ("Pause");
	 exit (1);
}
