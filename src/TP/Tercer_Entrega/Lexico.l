%{
#include <stdio.h>
#include <stdlib.h>
#if defined(_WIN32)
	#include <conio.h>
#endif
#include <string.h>
#include <math.h>
#include "y.tab.h"

#define LIM_REAL 2147483647
#define LIM_INT 32768
#define LIM_STR 32			// Incluye las comillas de inicio y fin de cadena


FILE  *yyin;

void errorCharInvalido();
int verificarTamanio(int opc);
void guardarTabladeSimbolosEnUnArchivo();
void guardarLexemas(char *,int);
void guardarTabladeSimbolo(char *);
int buscar(char *);
void agregar_tipo_a_TS(char *,char *);
int tipos_iguales(char *, char *);
int tipos(char *);
void existe_Id(char *);
int tipo_dato(char *,char *);
int traer_tipo_con_prefijo(char * );

int i=0;
int k=0;
int p=0;

void capturaTipo(char *);

typedef struct {
       		    char nombre[50]; // lexema
                char tipoDato[100];
                char valor[30];
				char longitud[25];
	            } tsimbolos;
//pila con lexemas para agregar a la TS, puede guardar 100 lexemas.
tsimbolos ts[100];
%}

%option noyywrap
%option yylineno

DIGITO [0-9]
LETRA  [a-zA-Z]
ID     {LETRA}({LETRA}|{DIGITO}|"_")*
CTE_INT       {DIGITO}+
CTE_REAL		{DIGITO}+"."{DIGITO}+|{DIGITO}*"."{DIGITO}+|{DIGITO}+"."{DIGITO}*
COMILLAS	   	"\""
ESPACIO			" "
CTE_STR       {COMILLAS}({LETRA}|{DIGITO}|{ESPACIO}|_|@|%)*{COMILLAS}
COMENT_SIMPLE	"-/"({LETRA}|{DIGITO}|_|{ESPACIO}|":"|"="|"."|"+"|"("|")"|"["|"]"|",")*"/-"
COMENT_DOBLE	"-/"({LETRA}|{DIGITO}|_|{ESPACIO}|":"|"="|"."|"+"|"("|")"|"["|"]"|","|{COMENT_SIMPLE})*"/--"


FLOAT			"FLOAT"|"float"|"Float"
INTEGER			"INTEGER"|"integer"|"Integer"
STRING			"STRING"|"string"|"String"

IF     "IF"|"if"|"If"
ENDIF   "endif"|"ENDIF"|"Endif"
THEN       "THEN"|"then"|"Then"
ELSE       "ELSE"|"else"|"Else"
WHILE  "while"|"WHILE"|"While"
UNTIL   "UNTIL"|"until"
ENDWHILE "endwhile"|"ENDWHILE"|"Endwhile"
MOD		"MOD"|"mod"|"Mod"|"%"
DIV		"DIV"|"div"|"Div"
ANY				.

AND "AND"|"and"|"And"
OR "OR"|"or"|"Or"
NOT "NOT"|"not"|"Not"
WRITE "WRITE"|"write"|"Write"
READ "READ"|"read"|"Read"

%%

"DECVAR"			{ return DECVAR; }
"ENDDEC"		{ return ENDDEC; }
{FLOAT}			{return FLOAT; }
{INTEGER}		{return INTEGER; }
{STRING}		{return STRING;}
{IF}			{ return IF; }
{THEN}			{ return THEN; }
{ELSE}			{ return ELSE; }
{ENDIF}			{ return ENDIF; }
{AND}      	 	{ return AND; }
{OR}        	{ return OR; }
{NOT}       	{ return NOT; }
{WHILE}        { return WHILE; }
{UNTIL}          { return UNTIL; }
{ENDWHILE}     { return ENDWHILE; }
{MOD}	    { return MOD; }
{DIV}	    { return DIV; }
{WRITE}	    { return WRITE; }
{READ}	    { return READ; }
{COMENT_SIMPLE}	{  }
{COMENT_DOBLE}	{  }

"=="		{ return IGUAL; }
"!="		{ return DIST; }
"<="		{ return MEN_IG; }
">="		{ return MAY_IG; }
"<"			{ return MENOR; }
">"			{ return MAYOR; }


{CTE_STR}		{
					if(verificarTamanio(CTE_STR) == 0)
					{
						printf("-------------ERROR-------------\n");
						printf("   Cte string fuera de rango.  \n");
						system ("Pause");
						exit(1);
					}
					else
					{
						guardarLexemas(yytext,1);
						yylval.str =strdup(yytext);
						return CTE_STR;
					}
				}


{CTE_INT}		{
					if(verificarTamanio(CTE_INT) == 0)
					{
						printf("-------------ERROR-------------\n");
						printf("     Integer fuera de rango.   \n");
						system ("Pause");
						exit(1);

					}
					else
					{
						guardarLexemas(yytext,2);
						yylval.str =strdup(yytext);
						return CTE_INT;
					}

				}

{CTE_REAL}	{
				if(verificarTamanio(CTE_REAL) == 0)
					{
						printf("-------------ERROR-------------\n");
						printf("       Real fuera de rango.    \n");
						system ("Pause");
						exit(1);

					}
					else
					{
						guardarLexemas(yytext,3);
						yylval.str =strdup(yytext);
						return CTE_REAL;

					}


				}

{ID}     	{yylval.str =strdup(yytext);guardarLexemas(yytext,0);return ID; }


","			{ return COMA;}
"="		{ return OPE_ASIG; }
":"			{ return DOS_PUNTOS; }
"["			{ return C_A; }
"]"			{ return C_C; }
";"			{ return PUNTO_COMA; }
"+"			{ return OPE_SUM; }
"-"			{ return OPE_RES; }
"*"			{ return OPE_MUL; }
"/"			{ return OPE_DIV; }
"("			{ return P_A; }
")"			{ return P_C; }
"{"			{ return L_A; }
"}"			{ return L_C; }



"\n"
"\t"
" "
"\r\n"
.           { errorCharInvalido(); }
%%

void guardarTabladeSimbolosEnUnArchivo()
{
FILE* arch;
int x;

    arch = fopen("ts.txt", "w+");

	if (!arch){
		printf("Error. No se pudo crear el archivo ts.txt");
	exit(1);
	}
	fprintf(arch,"%-23s%-15s%-28s%8s\n","Nombre","Tipo","Valor","Longitud");
	for(x=0;x<i;x++){

	fprintf(arch,"%-23s%-15s%-20s%8s",ts[x].nombre,ts[x].tipoDato,ts[x].valor,ts[x].longitud);
	fprintf(arch,"\n");
	}

	 fclose(arch);
}

void guardarLexemas(char *nombre,int val)
{

     if(val==0)
	{

	   if(buscar(nombre)!=0)
	   {
	      strcpy(ts[i].nombre,nombre);

		  i++;//incremento para conocer la cantidad de id que hay en la ctes
	   }


	}
    if(val==1)
	{
	    char *s=nombre;
		s++;//adelanto el puntero para que no tome la 1eras comillas
		int n=strlen(nombre)-2;//le resto 2 para que no copie las comillas (iniciales y finales)
		strncpy(nombre,s,n);
		while(n > 1)//llevo el puntero hasta la posicion que debe finalizar el string
		{
			n--;
		    s++;
		}
	    memset(s, '\0',n);//marco el fin del string

	  if(buscar(nombre)!=0)
	  {


	   char aux[10];
	   char aux1[10];
	   strcpy(aux,"cte");
	   p++;
     sprintf(aux1,"%d",p);
	   strcat(aux,aux1);

	   strcpy(ts[i].nombre,"_");
       strcat(ts[i].nombre,aux);

	   strcpy(ts[i].valor,nombre);
     sprintf(ts[i].longitud,"%lu",strlen(nombre));

        i++;//incremento para conocer la cantidad de id que hay en la ctes
      }

	}
   if(val==2)
	{

    if(buscar(nombre)!=0)
	 {

	   char aux[10];
	   char aux1[10];
	   strcpy(aux,"cte");
	   p++;
     sprintf(aux1,"%d",p);
	   strcat(aux,aux1);

	   strcpy(ts[i].nombre,"_");
       strcat(ts[i].nombre,aux);
	    strcpy(ts[i].valor,nombre);
	    i++;//incremento para conocer la cantidad de id que hay en la ctes
      }


	}
     if(val==3)
	{

    if(buscar(nombre)!=0)
	 {
	   //strcpy(ts[i].nombre,"_");
       //strcat(ts[i].nombre,nombre);
	   char aux[10];
	   char aux1[10];
	   strcpy(aux,"cte");
	   p++;
     sprintf(aux1,"%d",p);
	   strcat(aux,aux1);

	   strcpy(ts[i].nombre,"_");
       strcat(ts[i].nombre,aux);
	   strcpy(ts[i].valor,nombre);

	   i++;//incremento para conocer la cantidad de id que hay en la ctes
      }


	}
}

int buscar(char * nombre)
{
 int x;

  for(x=0;x<i;x++){//50 cantidad de lexemas en la tabla
  if(strcmp(ts[x].nombre,nombre)==0)
   return 0;
  }

   return 1;
}



void capturaTipo(char * tvar)
 {
	strcpy(ts[k].tipoDato,tvar);
	k++;
}

int verificarTamanio(int opc){
	switch(opc){
		case CTE_INT:
			if(atoi(yytext) >= -LIM_INT && atoi(yytext) <= LIM_INT-1)
				return 1;
			return 0;
			break;
		case CTE_STR:
			if(strlen(yytext) <= LIM_STR)
				return 1;
			return 0;
			break;
		case CTE_REAL:
			if(atof(yytext) >= -LIM_REAL && atof(yytext) <= LIM_REAL-1)
				return 1;
			return 0;
			break;
	}
	return 0;
}

void errorCharInvalido()
{
	printf("-------------ERROR-------------\n");
	printf("  Caracter invalido ingresado.\n");
	system ("Pause");
    exit (1);
}

void agregar_tipo_a_TS(char *nombre,char *tipo)
{
	int h;
	char aux[30];
	//printf("%s\n",nombre);
    //printf("%s\n",tipo);
	for(h=0;h<100;h++)
	{
	  if(strcmp(ts[h].valor,nombre)==0)
	  {
		  strcpy(ts[h].tipoDato,tipo);
       }
	}
}



int tipos(char *nombre)
{
  int n;
  	for(n=0;n<100;n++)
	{
	  if(strcmp(ts[n].nombre,nombre)==0 && strcmp(ts[n].nombre,"CTE_STR")==0)
	  {
		return 0;
       }
	}
	return 1;
}

void existe_Id(char *id)
{
	int n,index;

	for(n=0;n<100;n++)
	{
	   if(strcmp(ts[n].nombre,id)==0)
	     index=n;

	}

    if(strcmp(ts[index].tipoDato,"")==0)
	{
       printf("\nvariable no declarada pero usada\n");
			 exit(1);
	}
}

int tipo_dato(char *exp,char *ter)//Modificada
{
	puts("ENTROOOOOOO");
    int v,b,index1,index2;
	char aux[30],aux1[30];

	strcpy(aux,"_");
    strcat(aux,exp);
	for(v=0;v<100;v++)
	{
	  if(strcmp(ts[v].nombre,aux)==0)
	     index1=v;
	}

	strcpy(aux1,"_");
    strcat(aux1,ter);
	for(b=0;b<100;b++)
	{
	  if(strcmp(ts[b].nombre,aux1)==0)
	     index2=b;
	}
	printf("tipo %s es: %s\n",exp, ts[index1].tipoDato);
	printf("tipo %s es: %s\n", ter, ts[index2].tipoDato);

	if((strcmp(ts[index1].tipoDato,"INTEGER")==0 && strcmp(ts[index2].tipoDato,"CTE_INT")==0) ||
    (strcmp(ts[index1].tipoDato,"FLOAT")==0 && strcmp(ts[index2].tipoDato,"CTE_REAL")==0) ||
    (strcmp(ts[index1].tipoDato,"STRING")==0 && strcmp(ts[index2].tipoDato,"CTE_STR")==0) ||
    (strcmp(ts[index1].tipoDato,"INTEGER")==0 && strcmp(ts[index2].tipoDato,"CTE_INT")==0) ||
    (strcmp(ts[index1].tipoDato,"FLOAT")==0 && strcmp(ts[index2].tipoDato,"CTE_REAL")==0))
	{
       return 0;
	}else
	{
      return 1;
	}

}


int tipos_iguales(char *id,char *exp)
{
    int c,v,b,index,index2,index3;
	char aux[30],aux1[30];

	for(c=0;c<100;c++)
	{
	  if(strcmp(ts[c].nombre,id)==0)
	     index=c;
	}
	for(b=0;b<100;b++)
	{
	  if(strcmp(ts[b].nombre,exp)==0)
	     index3=b;
	}

	//printf("tipo %s es: %s\n",id, ts[index].tipoDato);
	//printf("tipo %s es: %s\n", exp, ts[index3].tipoDato);

	if((strcmp(ts[index].tipoDato,"INTEGER")==0 && strcmp(ts[index3].tipoDato,"INTEGER")==0) ||
	  (strcmp(ts[index].tipoDato,"FLOAT")==0 && strcmp(ts[index3].tipoDato,"FLOAT")==0))
	{
       return 0;
	}
	else
   {
    //printf("%s",exp);
	strcpy(aux1,"_");
    strcat(aux1,exp);
    for(v=0;v<100;v++)
	{
	  if(strcmp(ts[v].nombre,aux1)==0)
	     index2=v;
	}
	printf("tipo %s es: %s\n",id, ts[index].tipoDato);
    printf("tipo %s es: %s\n", exp, ts[index2].tipoDato);
	if((strcmp(ts[index].tipoDato,"INTEGER")==0 && strcmp(ts[index2].tipoDato,"CTE_INT")==0) ||
    (strcmp(ts[index].tipoDato,"FLOAT")==0 && strcmp(ts[index2].tipoDato,"CTE_REAL")==0) ||
    (strcmp(ts[index].tipoDato,"FLOAT")==0 && strcmp(ts[index2].tipoDato,"CTE_INT")==0) ||
    (strcmp(ts[index].tipoDato,"STRING")==0 && strcmp(ts[index2].tipoDato,"CTE_STR")==0))
	{
       return 0;
	}else
	{
      return 1;
	}

}
}

int traer_tipo_con_prefijo(char * nombre) {

	int u;


	for(u=0;u<100;u++)
	{
	  if(strcmp(ts[u].nombre,nombre)==0){

	    if(strcmp(ts[u].tipoDato,"CTE_STR" )==0 ||strcmp(ts[u].tipoDato,"STRING" )==0)
        return 0;
	   else if (strcmp(ts[u].tipoDato,"CTE_REAL")==0 || strcmp(ts[u].tipoDato,"FLOAT" )==0)
       return 1;

	  }

	}
	return 0;

}
