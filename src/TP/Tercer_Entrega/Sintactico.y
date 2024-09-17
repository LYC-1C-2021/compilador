%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#if defined(_WIN32)
	#include <conio.h>
#endif
#include <errno.h>
#include "y.tab.h"
#define RENGLONES_IMPRESION_ARBOL 1000
#define CARACTERES_RENGLON_ARBOL 1000

#if !defined(_WIN32)
	int yyerror();
	int yylex();
#endif

int yystopparser=0;
char * yytext;
FILE *yyin;
char auxiliarexp[30];
char auxiliarter[30];
FILE *a;
static char asig_final[80];
static char sent_final[80];
int n=0;
static int usar_aux2 = 0, ifs=0, whiles=0, base=0;
static char string_cond[5];
static int cond=0;
int cont=0;

typedef struct {
	char a[30];
} t_info;

typedef struct t_nodo_arbol{
	t_info * info;
	struct t_nodo_arbol * padre;
	struct t_nodo_arbol * nodo_der;
	struct t_nodo_arbol * nodo_izq;
} t_nodo_arbol;

typedef struct {
	t_nodo_arbol * p_nodo;
} t_arbol;

typedef struct {
	t_nodo_arbol * a;
} t_info_sentencias;

typedef struct t_nodo{
	t_info_sentencias * info;
	struct t_nodo * sig_nodo;
} t_nodo;

typedef struct {
	t_nodo * p_nodo;
} t_pila;

typedef struct {
	t_nodo * p_primero;
	t_nodo * p_ultimo;
} t_cola;

typedef struct t_nodo_pila_de_colas{
	t_cola * info;
	struct t_nodo_pila_de_colas * sig_nodo;
} t_nodo_pila_de_colas;

typedef struct {
	t_nodo_pila_de_colas * p_nodo;
} t_pila_de_colas;

void crear_arbol(t_arbol **);
t_info * crear_info(char *);
t_nodo_arbol * crear_nodo_arbol(t_info * info, t_nodo_arbol * p_nodo_izq, t_nodo_arbol * p_nodo_der);
t_nodo_arbol * crear_hoja(t_info*);
t_nodo_arbol * obtener_raiz(t_nodo_arbol *);
void visitar(t_nodo_arbol *);
void recorrer_en_orden(t_nodo_arbol *,void (*f)(t_nodo_arbol*));
void crear_pila(t_pila **);
void insertar_en_pila(t_pila**,t_info_sentencias*);
t_info_sentencias * sacar_de_pila(t_pila **);
t_info_sentencias * crear_info_sentencias(t_nodo_arbol *);
void crear_cola(t_cola **);
void insertar_en_cola(t_cola**,t_info_sentencias*);
t_info_sentencias * sacar_de_cola(t_cola **);
int cola_vacia(t_cola ** p_cola);
void crear_pila_de_colas(t_pila_de_colas ** );
void insertar_en_pila_de_colas(t_pila_de_colas ** , t_cola *);
t_cola * sacar_de_pila_de_colas(t_pila_de_colas **);

void copiar_sin_finalizador(char * dest,char * orig);
void print_t(t_nodo_arbol *tree);
int _print_t(t_nodo_arbol *tree, int is_left, int offset, int depth, char * s, int max);

void crearAssembler(t_nodo_arbol *);
void recorrer_asm(t_nodo_arbol *, int);

void guardarTabladeSimbolosEnUnArchivo();
void guardarLexemas(char *nombre,int val);
int buscar(char * nombre);
void capturaTipo(char * tvar);
void agregar_tipo_a_TS(char *nombre,char *tipo);
int tipos(char *nombre);
void existe_Id(char *id);
int tipos_iguales(char *id,char *exp);
int traer_tipo_con_prefijo(char * nombre);
int tipo_dato(char *exp,char *ter);

t_arbol * arbol_ejecucion;
t_nodo_arbol * nodo_sentencias;
t_nodo_arbol * nodo_sentencia;
t_nodo_arbol * nodo_factor;
t_nodo_arbol * nodo_termino;
t_nodo_arbol * nodo_expresion;
t_nodo_arbol * nodo_expresiones;
t_nodo_arbol * nodo_asignacion;
t_nodo_arbol * nodo_asignacion_str;
t_nodo_arbol * nodo_asignacionmult;
t_nodo_arbol * nodo_condicion;
t_nodo_arbol * nodo_comparacion;
t_nodo_arbol * nodo_compnot;
t_nodo_arbol * nodo_condicional;
t_nodo_arbol * nodo_sentencias_then;
t_nodo_arbol * nodo_sentencias_else;
t_nodo_arbol * nodo_condicion_doble;
t_nodo_arbol * nodo_then;
t_nodo_arbol * nodo_print;
t_nodo_arbol * nodo_print1;
t_nodo_arbol * nodo_read;
t_nodo_arbol * nodo_entsal;
t_nodo_arbol * nodo_iteracion;
t_nodo_arbol * sentencias_while;
t_nodo_arbol * nodo_id;
t_nodo_arbol * nodo_id1;
t_nodo_arbol * nodo_ids;
t_nodo_arbol * nodo_exp;
t_nodo_arbol * nodo_lista_id;
t_nodo_arbol * nodo_lista_exp;
t_nodo_arbol *nodo_asig;
t_nodo_arbol *nodo_div;
t_nodo_arbol *nodo_mod;
t_nodo_arbol *nodo_mult;
t_nodo_arbol *nodo_inicio;
t_nodo_arbol *nodo_programa;
t_nodo_arbol *nodo_start;
t_nodo_arbol *nodo_asigna;

t_pila * pila_asigna;
t_pila * pila_asignacion;
t_pila * pila_asignacionmult;
t_pila * pila_iteracion;
t_pila * pila_condicional;
t_pila * pila_comparaciones;
t_pila * pila_condiciones;
t_cola * cola_sentencias;
t_cola * cola_expresiones;
t_cola * cola_asignacion;
t_cola* cola_id;
t_pila* pila_id;
t_pila * pila_exp;
t_pila * pila_expre;
t_pila * pila_expresiones;
t_pila * pila_factores;
t_pila * pila_terminos;
t_pila_de_colas * pila_de_colas;
t_info_sentencias * p_infocola;
t_info_sentencias * p_infopila;

typedef struct {
	char nombre[50]; // lexema
	char tipoDato[100];
	char valor[30];
	char longitud[25];
} tsimbolos;
tsimbolos ts[100];

%}
%union{
	char *str;
	int *entero;
}

%type <str> expresion
%type <str> termino
%type <str> factor
%type <str> lista_id
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
%token <str>ID
%token OPE_ASIG
%token CTE_REAL
%token <str>CTE_STR
%token <entero>CTE_INT
%token P_A
%token P_C
%token IF
%token THEN
%token ELSE
%token ENDIF
%token IGUAL
%token DIST
%token MEN_IG
%token MAY_IG
%token MENOR
%token MAYOR
%token AND
%token OR
%token NOT
%token WHILE
%token UNTIL
%token ENDWHILE
%token MOD
%token DIV
%token <str>WRITE
%token READ
%token PUNTO_COMA
%token L_A
%token L_C

%left OPE_SUM
%left OPE_RES
%left OPE_MUL
%left OPE_DIV
%left UMINUS

%%
start:	programa	{


	printf("\n---------------------------\n");
	printf("\n****COMPILACION EXITOSA****\n");
	printf("\n---------------------------\n");

	nodo_start=nodo_sentencias;
	arbol_ejecucion->p_nodo = obtener_raiz(nodo_start);

	crearAssembler(arbol_ejecucion->p_nodo);
    //recorrer_en_orden(arbol_ejecucion->p_nodo,&visitar);
}

programa: declaracion  inicio
	| declaracion
	| lista_io
;

/*
	lista_io permite escribir sentencias WRITE "str"
	sin necesidad de escribir un bloque de declaraciones
*/
lista_io: lista_io entsal {
		printf("\n***REGLA 14 -> Sentencia:\n");
		printf("\t\t\tEntSal\n");
		nodo_sentencia = crear_nodo_arbol(crear_info(";"),nodo_entsal,NULL);
		insertar_en_cola(&cola_sentencias,crear_info_sentencias(nodo_sentencia));

		if(cola_sentencias!=NULL) {
			t_info_sentencias * sentencia_apilada = sacar_de_cola(&cola_sentencias);
			nodo_sentencias->nodo_der = sentencia_apilada->a;
			nodo_sentencias->nodo_der->padre = nodo_sentencias;
			nodo_sentencias = sentencia_apilada->a;
		}
	}
 | entsal {
		printf("\n***REGLA 14 -> Sentencia:\n");
		printf("\t\t\tEntSal\n");
		nodo_sentencia = crear_nodo_arbol(crear_info(";"),nodo_entsal,NULL);
		insertar_en_cola(&cola_sentencias,crear_info_sentencias(nodo_sentencia));

		if(cola_sentencias!=NULL) {
			t_info_sentencias * sentencia_apilada = sacar_de_cola(&cola_sentencias);
			nodo_sentencias = sentencia_apilada->a;
		}
 }
;

declaracion: DECVAR definicion ENDDEC {
		printf("\n***REGLA 1 -> Declaracion:\n");
		printf("\t\t\tDeclaracion\n");
	}
;

definicion: lista
	| lista definicion {
		printf("\n***REGLA 2 -> Declaracion:\n");
		printf("\t\t\tDefiniciones\n");
	}
;

lista: ID DOS_PUNTOS tipo_dato {
		printf("\n***REGLA 3 -> Lista_Id:\n");
		printf("\t\t\tID\n");
		printf("%s\n",$1);
		capturaTipo(yytext);
	}
	| ID COMA lista {
		printf("\n***REGLA 4 -> Lista_Id:\n");
		capturaTipo(yytext);
		printf("\t\t\tID COMA Lista_Id\n");
		printf("%s\n",$1);
	}
;

tipo_dato: INTEGER {
		printf("\n***REGLA 5 -> Tipo_Dato:\n");
		printf("\t\t\tInteger\n");
	}
	| STRING {
		printf("\n***REGLA 6 -> Tipo_Dato:\n");
		printf("\t\t\tString\n");
	}
	| FLOAT {
		printf("\n***REGLA 7 -> Tipo_Dato:\n");
		printf("\t\t\tFloat\n");
	}
;

inicio:	lista_sentencias {
		printf("\n***REGLA 8 -> Inicio:\n");
		printf("\t\t\tLista_Sentencias\n");

	}
;

lista_sentencias: sentencia {
		printf("\n***REGLA 9 -> Lista_Sentencias:\n");
		printf("\t\t\tSentencia\n");
		if(cola_sentencias!=NULL) {
			t_info_sentencias * sentencia_apilada = sacar_de_cola(&cola_sentencias);
			nodo_sentencias = sentencia_apilada->a;
			//recorrer_en_orden(nodo_sentencias,&visitar);
		}
	}
	| sentencia lista_sentencias {
		printf("\n***REGLA 10 -> Lista_Sentencias:\n");
		printf("\t\t\t Lista_Sentencias Sentencia\n");
		if(cola_sentencias!=NULL) {
			t_info_sentencias * sentencia_apilada = sacar_de_cola(&cola_sentencias);
			nodo_sentencias->nodo_der = sentencia_apilada->a;
			nodo_sentencias->nodo_der->padre = nodo_sentencias;
			nodo_sentencias = sentencia_apilada->a;
			//recorrer_en_orden(nodo_sentencias,&visitar);
		}
	}
;

sentencia:asignacion {
		printf("\n***REGLA 11 -> Sentencia:\n");
		printf("\t\t\tAsignacion\n");

		nodo_sentencia = crear_nodo_arbol(crear_info(";"),nodo_asignacionmult,NULL);
		insertar_en_cola(&cola_sentencias,crear_info_sentencias(nodo_sentencia));
		//recorrer_en_orden(nodo_sentencia,&visitar);
	}
	| decision {
		printf("\n***REGLA 12 -> Sentencia:\n");
		printf("\t\t\tDecision\n");

		//para esta altura todas las sentencias del bloque deberian haber sido desencoladas
		//printf("La cola de sentencias esta vacia? %d\n",cola_vacia(&cola_sentencias));
		cola_sentencias = sacar_de_pila_de_colas(&pila_de_colas);

		t_info_sentencias * p_info = sacar_de_pila(&pila_condicional);

		nodo_sentencia= crear_nodo_arbol(crear_info(";"),p_info->a,NULL);
		insertar_en_cola(&cola_sentencias,crear_info_sentencias(nodo_sentencia));
		//recorrer_en_orden(nodo_sentencia,&visitar);
	}
	| iteracion {
		printf("\n***REGLA 13 -> Sentencia:\n");
		printf("\t\t\tIteracion\n");
		//para esta altura todas las sentencias del bloque deberian haber sido desencoladas
		// printf("La cola de sentencias esta vacia? %d\n",cola_vacia(&cola_sentencias));
		cola_sentencias = sacar_de_pila_de_colas(&pila_de_colas);

		t_info_sentencias * p_info = sacar_de_pila(&pila_iteracion);
		nodo_sentencia = crear_nodo_arbol(crear_info(";"),p_info->a,NULL);
		//recorrer_en_orden(nodo_sentencia,&visitar);
		insertar_en_cola(&cola_sentencias,crear_info_sentencias(nodo_sentencia));
	}
	| entsal {
		printf("\n***REGLA 14 -> Sentencia:\n");
		printf("\t\t\tEntSal\n");
		nodo_sentencia = crear_nodo_arbol(crear_info(";"),nodo_entsal,NULL);
		insertar_en_cola(&cola_sentencias,crear_info_sentencias(nodo_sentencia));
	    //recorrer_en_orden(nodo_sentencia,&visitar);
	}
;

asignacion: lista_id OPE_ASIG expresion PUNTO_COMA {
		//puts("LLEGOOOOO");
		//if(tipos_iguales($1,$3)==1)
		//{
		//	printf("Error las variables son de diferente tipo\n");
												//	exit(1);
		//}

		printf("\n***REGLA 15 -> Asignacion:\n");
		printf("\t\t\tID OPE_ASIG Expresion\n");
		existe_Id($1);

		/*if(tipo_dato($1,auxiliarexp,auxiliarter)==1)
		{
			printf("Error datos de diferente tipo");
			exit(0);
		}*/

		t_info_sentencias * p_info = sacar_de_pila(&pila_expresiones);
		nodo_asignacionmult = crear_nodo_arbol(crear_info("="),crear_hoja(crear_info($1)),p_info->a);
	}
;

lista_id:ID {
		printf("\n***REGLA 16 -> Lista_id:\n");
		printf("\t\t\tID\n");
		existe_Id($1);

		nodo_id1 = crear_hoja(crear_info($1));
		//insertar_en_cola(&cola_id,crear_info_sentencias(nodo_id1));

		cont=cont +1;
	}
	| lista_id OPE_ASIG ID{

		printf("\n***REGLA 17 -> Lista_id:\n");
		printf("\t\t\tlista_asig OPE_ASIG ID\n");
		existe_Id($1);

		cont=cont +1;
	}
;

entsal: WRITE CTE_STR PUNTO_COMA {
		printf("\n***REGLA 18 -> EntSal: \n");
		printf("\t\t\t WRITE CTE_STR PUNTO_COMA\n");

		agregar_tipo_a_TS(yylval.str,"CTE_STR");

		char cad[10];
		char cad1[10];
		strcpy(cad,"_cte");
		n++;
		sprintf(cad1,"%d",n);
		strcat(cad,cad1);

		nodo_print = crear_nodo_arbol(crear_info("WRITE"),crear_hoja(crear_info(cad)),NULL);
		nodo_entsal=nodo_print;
	}
	| WRITE ID PUNTO_COMA {
		printf("\n***REGLA 19 -> EntSal: \n");
		printf("\t\t\t WRITE ID PUNTO_COMA\n");
		existe_Id($2);
		nodo_print1 = crear_nodo_arbol(crear_info("WRITE"),crear_hoja(crear_info($2)),NULL);
		nodo_entsal=nodo_print1;
	}
	| READ ID PUNTO_COMA {
		printf("\n***REGLA 20 -> EntSal: \n");
		printf("\t\t\t READ ID PUNTO_COMA\n");
		existe_Id($2);

		nodo_read = crear_nodo_arbol(crear_info("READ"),crear_hoja(crear_info($2)),NULL);
		nodo_entsal=nodo_read;
	}
;

decision:IF condicion L_A lista_sentencias L_C {
		printf("\n***REGLA 21 -> Condicion:\n");
		printf("\t\t\t IF Condicion L_A Lista_Sentencias L_C\n");
		nodo_sentencias_then = obtener_raiz(nodo_sentencias);
		t_info_sentencias * p_info = sacar_de_pila(&pila_condiciones);
		//le pongo null porque ahi iria el ELSE y no hay
		nodo_then = crear_nodo_arbol(crear_info("THEN"),nodo_sentencias_then,NULL);
		nodo_condicional = crear_nodo_arbol(crear_info("IF"),p_info->a,nodo_then);
		insertar_en_pila(&pila_condicional,crear_info_sentencias(nodo_condicional));
	}
	| IF condicion L_A lista_sentencias L_C {
		nodo_sentencias_then = obtener_raiz(nodo_sentencias);
	} ELSE L_A lista_sentencias L_C {
		printf("\n***REGLA 22 -> Condicion:\n");
		printf("\t\t\t IF Condicion L_A Lista_Sentencias L_C ELSE L_A Lista_Sentencias L_C\n");
		nodo_sentencias_else = obtener_raiz(nodo_sentencias);
		t_info_sentencias * p_info = sacar_de_pila(&pila_condiciones);
		nodo_then = crear_nodo_arbol(crear_info("<V.F>"),nodo_sentencias_then,nodo_sentencias_else);
		nodo_condicional = crear_nodo_arbol(crear_info("IF"),p_info->a,nodo_then);
		insertar_en_pila(&pila_condicional,crear_info_sentencias(nodo_condicional));
	}
;

condicion: P_A condicion_simple P_C {
		printf("\n***REGLA 23 -> Condicion:\n");
		printf("\t\t\t Condicion_Simple\n");
		insertar_en_pila_de_colas(&pila_de_colas,cola_sentencias);
		crear_cola(&cola_sentencias);

		t_info_sentencias * p_info = sacar_de_pila(&pila_comparaciones);
		nodo_condicion = p_info->a;
		insertar_en_pila(&pila_condiciones,crear_info_sentencias(nodo_condicion));
	}
	| P_A condicion_doble P_C {
		printf("\n***REGLA 24 -> Condicion:\n");
		printf("\t\t\t CONDICION_Doble\n");
		nodo_condicion=nodo_comparacion;
	}
	| P_A NOT condicion_simple P_C {
		printf("\n***REGLA 25 -> Condicion:\n");
		printf("\t\t\t NOT Condicion_Simple\n");
		t_info_sentencias * p_info = sacar_de_pila(&pila_comparaciones);
		nodo_comparacion = crear_nodo_arbol(crear_info("NOT"),p_info->a,NULL);
		nodo_condicion = nodo_comparacion;
		insertar_en_pila(&pila_condiciones,crear_info_sentencias(nodo_condicion));
	}
;

condicion_simple: expresion MAYOR expresion {
		printf("\n***REGLA 26 -> Condicion_Simple:\n");
		printf("\t\t\t Expresion MAYOR Expresion\n");
		/*
			if(tipos_iguales($1,$3)==1)
			{
				printf("Error las variables son de diferente tipo\n");
																	exit(1);
			}
		*/
		t_info_sentencias * p_info1 = sacar_de_pila(&pila_expresiones);
		t_info_sentencias * p_info2 = sacar_de_pila(&pila_expresiones);
		nodo_comparacion = crear_nodo_arbol(crear_info(">"),p_info2->a,p_info1->a);
		insertar_en_pila(&pila_comparaciones,crear_info_sentencias(nodo_comparacion));
	}
	| expresion MENOR expresion {
		printf("\n***REGLA 27 -> Condicion_Simple:\n");
		printf("\t\t\t Expresion MENOR Expresion\n");
		/*
			if(tipos_iguales($1,$3)==1)
			{
				printf("Error las variables son de diferente tipo\n");
																	exit(1);
			}
		*/
		t_info_sentencias * p_info1 = sacar_de_pila(&pila_expresiones);
		t_info_sentencias * p_info2 = sacar_de_pila(&pila_expresiones);
		nodo_comparacion = crear_nodo_arbol(crear_info("<"),p_info2->a,p_info1->a);
		insertar_en_pila(&pila_comparaciones,crear_info_sentencias(nodo_comparacion));
	}
	| expresion DIST expresion {
		printf("\n***REGLA 28 -> Condicion_Simple:\n");
		printf("\t\t\t Expresion DIST Expresion\n");
		/*
			if(tipos_iguales($1,$3)==1)
			{
				printf("Error las variables son de diferente tipo\n");
				exit(1);
			}
		*/
		t_info_sentencias * p_info1 = sacar_de_pila(&pila_expresiones);
		t_info_sentencias * p_info2 = sacar_de_pila(&pila_expresiones);
		nodo_comparacion = crear_nodo_arbol(crear_info("!="),p_info2->a,p_info1->a);
		insertar_en_pila(&pila_comparaciones,crear_info_sentencias(nodo_comparacion));
	}
	| expresion IGUAL expresion {
		printf("\n***REGLA 29 -> Condicion_Simple:\n");
		printf("\t\t\t Expresion IGUAL Expresion\n");
		/*
			if(tipos_iguales($1,$3)==1)
			{
				printf("Error las variables son de diferente tipo\n");
				exit(1);
			}
		*/
		t_info_sentencias * p_info1 = sacar_de_pila(&pila_expresiones);
		t_info_sentencias * p_info2 = sacar_de_pila(&pila_expresiones);
		nodo_comparacion = crear_nodo_arbol(crear_info("=="),p_info2->a,p_info1->a);
		insertar_en_pila(&pila_comparaciones,crear_info_sentencias(nodo_comparacion));
	}
	| expresion MAY_IG expresion {
		printf("\n***REGLA 30 -> Condicion_Simple:\n");
		printf("\t\t\t Expresion MAY_IG Expresion\n");
		/*
			if(tipos_iguales($1,$3)==1)
			{
				printf("Error las variables son de diferente tipo\n");
				exit(1);
			}
		*/
		t_info_sentencias * p_info1 = sacar_de_pila(&pila_expresiones);
		t_info_sentencias * p_info2 = sacar_de_pila(&pila_expresiones);
		nodo_comparacion = crear_nodo_arbol(crear_info(">="),p_info1->a,p_info2->a);
		insertar_en_pila(&pila_comparaciones,crear_info_sentencias(nodo_comparacion));
	}
	| expresion MEN_IG expresion {
		printf("\n***REGLA 31 -> Condicion_Simple:\n");
		printf("\t\t\t Expresion MEN_IG Expresion\n");
		//printf("$1 es: %s\n",$1);
		//printf("$3 es: %s\n",$3);
		/*
		if(tipos_iguales($1,$3)==1)
		{
			printf("Error las variables son de diferente tipo\n");
			exit(1);
		}*/
		t_info_sentencias * p_info1 = sacar_de_pila(&pila_expresiones);
		t_info_sentencias * p_info2 = sacar_de_pila(&pila_expresiones);
		nodo_comparacion = crear_nodo_arbol(crear_info("<="),p_info2->a,p_info1->a);
		insertar_en_pila(&pila_comparaciones,crear_info_sentencias(nodo_comparacion));
	}
;

condicion_doble: condicion_simple AND condicion_simple {
		printf("\n***REGLA 32 -> Condicion_Doble:\n");
		printf("\t\t\t Condicion_Simple AND Condicion_Simple\n");
		insertar_en_pila_de_colas(&pila_de_colas,cola_sentencias);
		crear_cola(&cola_sentencias);

		t_info_sentencias * p_info1 = sacar_de_pila(&pila_comparaciones);
		t_info_sentencias * p_info2 = sacar_de_pila(&pila_comparaciones);
		nodo_condicion_doble = crear_nodo_arbol(crear_info("AND"),p_info2->a,p_info1->a);

		insertar_en_pila(&pila_condiciones,crear_info_sentencias(nodo_condicion_doble));
	}
	| condicion_simple OR condicion_simple {
		printf("\n***REGLA 33 -> Condicion_Doble:\n");
		printf("\t\t\t Condicion_Simple OR Condicion_Simple\n");

		insertar_en_pila_de_colas(&pila_de_colas,cola_sentencias);
		crear_cola(&cola_sentencias);

		t_info_sentencias * p_info1 = sacar_de_pila(&pila_comparaciones);
		t_info_sentencias * p_info2 = sacar_de_pila(&pila_comparaciones);
		nodo_condicion_doble = crear_nodo_arbol(crear_info("OR"),p_info2->a,p_info1->a);

		insertar_en_pila(&pila_condiciones,crear_info_sentencias(nodo_condicion_doble));

	}
;

iteracion:WHILE condicion L_A lista_sentencias  { sentencias_while=obtener_raiz(nodo_sentencias);}L_C {
		printf("\n***REGLA 34 -> Iteracion:\n");
		printf("\t\t\t WHILE Condicion L_A Lista_Sentencias L_C\n");

		t_info_sentencias * p_info = sacar_de_pila(&pila_condiciones);
		nodo_iteracion = crear_nodo_arbol(crear_info("WHILE"),p_info->a,sentencias_while);
		//recorrer_en_orden(nodo_iteracion,&visitar);
		insertar_en_pila(&pila_iteracion,crear_info_sentencias(nodo_iteracion));
	}
;

expresion: termino {
		printf("\n***REGLA 35 -> Expresion:\n");
		printf("\t\t\t Termino\n");
		printf("Estoy en %s\n",$1);
		strcpy(auxiliarter,$1);

		/* guardo la expresion en el arbol de ejecucion */
		t_info_sentencias * p_nodo_termino = sacar_de_pila(&pila_terminos);
		nodo_expresion = p_nodo_termino->a;
		insertar_en_pila(&pila_expresiones,p_nodo_termino);
		insertar_en_cola(&cola_expresiones,p_nodo_termino);
		//recorrer_en_orden(nodo_expresion,&visitar);
	}
	| expresion OPE_SUM termino {
		printf("\n***REGLA 36 -> Expresion:\n");
		printf("\t\t\t Expresion OPE_SUM Termino\n");
		// printf("$1 es %s\n",$1);
		// printf("$3 es %s\n",$3);
		/*
			if(tipo_dato($1,$3)==1)
			{
				printf("Error las variables son de diferente tipo\n");
				exit(1);
			}
		*/

		strcpy(auxiliarexp,$1);
		strcpy(auxiliarter,$3);

		/* guardo la expresion en el arbol de ejecucion */
		t_info_sentencias * p_nodo_expresion = sacar_de_pila(&pila_expresiones);
		t_info_sentencias * p_nodo_termino = sacar_de_pila(&pila_terminos);
		nodo_expresion = crear_nodo_arbol(crear_info("+"),p_nodo_expresion->a,p_nodo_termino->a);
		insertar_en_pila(&pila_expresiones,crear_info_sentencias(nodo_expresion));
		insertar_en_cola(&cola_expresiones,crear_info_sentencias(nodo_expresion));
		free(p_nodo_expresion);
		free(p_nodo_termino);
	}
	| expresion OPE_RES termino {
		printf("\n***REGLA 37 -> Expresion:\n");
		printf("\t\t\t Expresion OPE_RES Termino\n");
		/*
			if(tipos_iguales($1,$3)==1)
			{
			printf("Error las variables son de diferente tipo\n");
			exit(1);
			}
		*/
		strcpy(auxiliarexp,$1);
		strcpy(auxiliarter,$3);
		/* guardo la expresion en el arbol de ejecucion */
		t_info_sentencias * p_nodo_expresion = sacar_de_pila(&pila_expresiones);
		t_info_sentencias * p_nodo_termino = sacar_de_pila(&pila_terminos);
		nodo_expresion = crear_nodo_arbol(crear_info("-"),p_nodo_expresion->a,p_nodo_termino->a);
		insertar_en_pila(&pila_expresiones,crear_info_sentencias(nodo_expresion));
		insertar_en_cola(&cola_expresiones,crear_info_sentencias(nodo_expresion));
		free(p_nodo_expresion);
		free(p_nodo_termino);
	}
	| expresion DIV termino {
		printf("\n***REGLA 38 -> Expresion:\n");
		printf("\t\t\t Expresion DIV Termino\n");
		/*
			if(tipos_iguales($1,$3)==1)
			{
				printf("Error las variables son de diferente tipo\n");
														exit(1);
			}
		*/
		strcpy(auxiliarexp,$1);
		strcpy(auxiliarter,$3);

		t_info_sentencias * p_nodo_expresion = sacar_de_pila(&pila_expresiones);

		t_info_sentencias * p_nodo_termino = sacar_de_pila(&pila_terminos);

		nodo_expresion = crear_nodo_arbol(crear_info("DIV"),p_nodo_expresion->a,p_nodo_termino->a);
		insertar_en_pila(&pila_expresiones,crear_info_sentencias(nodo_expresion));
		insertar_en_cola(&cola_expresiones,crear_info_sentencias(nodo_expresion));
		free(p_nodo_expresion);
		free(p_nodo_termino);
	}
	| expresion MOD termino {
		printf("\n***REGLA 39 -> Expresion:\n");
		printf("\t\t\t Expresion MOD Termino\n");
		/*
			if(tipos_iguales($1,$3)==1)
			{
				printf("Error las variables son de diferente tipo\n");
																	exit(1);
			}
		*/
		strcpy(auxiliarexp,$1);
		strcpy(auxiliarter,$3);

		t_info_sentencias * p_nodo_expresion = sacar_de_pila(&pila_expresiones);
		t_info_sentencias * p_nodo_termino = sacar_de_pila(&pila_terminos);
		nodo_expresion = crear_nodo_arbol(crear_info("MOD"),p_nodo_expresion->a,p_nodo_termino->a);
		insertar_en_pila(&pila_expresiones,crear_info_sentencias(nodo_expresion));
		insertar_en_cola(&cola_expresiones,crear_info_sentencias(nodo_expresion));
		free(p_nodo_expresion);
		free(p_nodo_termino);
	}
;

termino: factor {
		printf("\n***REGLA 40 -> Termino:\n");
		printf("\t\t\t Factor\n");
		/*guardo el termino en el arbol de ejecucion*/
		t_info_sentencias * p_nodo_factor = sacar_de_pila(&pila_factores);
		nodo_termino = p_nodo_factor->a;
		insertar_en_pila(&pila_terminos,p_nodo_factor);
	}
	| termino OPE_MUL factor {
		printf("\n***REGLA 41 -> Termino:\n");
		printf("\t\t\t Termino OPE_MUL Factor\n");
		/*
			if(tipos($3)==0)
			{
				printf("Operacion invalida,se intenta multiplicar un String\n");
				exit(1);
		}
		*/

		/*guardo el termino en el arbol de ejecucion*/
		t_info_sentencias * p_nodo_factor = sacar_de_pila(&pila_factores);
		t_info_sentencias * p_nodo_termino = sacar_de_pila(&pila_terminos);
		nodo_termino = crear_nodo_arbol(crear_info("*"),p_nodo_termino->a,p_nodo_factor->a);
		insertar_en_pila(&pila_terminos,crear_info_sentencias(nodo_termino));

		free(p_nodo_factor);
		free(p_nodo_termino);
	}
	| termino OPE_DIV factor {
		printf("\n***REGLA 42 -> Termino:\n");
		printf("\t\t\t Termino OPE_DIV Factor\n");
		/*
			if(tipos_iguales($1,$3)==1)
			{
				printf("Error las variables son de diferente tipo\n");
				exit(1);
			}
		*/

		/*guardo el termino en el arbol de ejecucion*/
		t_info_sentencias * p_nodo_factor = sacar_de_pila(&pila_factores);
		t_info_sentencias * p_nodo_termino = sacar_de_pila(&pila_terminos);

		nodo_termino = crear_nodo_arbol(crear_info("/"),p_nodo_termino->a,p_nodo_factor->a);
		insertar_en_pila(&pila_terminos,crear_info_sentencias(nodo_termino));

		free(p_nodo_factor);
		free(p_nodo_termino);
	}
;

factor: ID {
		printf("\n***REGLA 43 -> Factor:\n");
		printf("\t\t\t ID\n");
		/*guardo el termino en el arbol de ejecucion*/
		nodo_factor = crear_hoja(crear_info($1));
		insertar_en_pila(&pila_factores,crear_info_sentencias(nodo_factor));
	}
	| CTE_INT {
		printf("\n***REGLA 44 -> Factor:\n");
		printf("\t\t\t CTE_INT\n");
		char aux[10];

		agregar_tipo_a_TS(yylval.str,"CTE_INT");
		//tipos_iguales(auxiliar,yylval.str);
		/*guardo el termino en el arbol de ejecucion*/

		char cad[10];
		char cad1[10];
		strcpy(cad,"_cte");
		n++;
		sprintf(cad1,"%d",n);
		strcat(cad,cad1);

		nodo_factor = crear_hoja(crear_info(cad));
		insertar_en_pila(&pila_factores,crear_info_sentencias(nodo_factor));
	}
	| CTE_REAL {
		printf("\n***REGLA 45 -> Factor:\n");
		printf("\t\t\t CTE_REAL\n");
		//printf("%s\n",yylval.str);

		agregar_tipo_a_TS(yylval.str,"CTE_REAL");
		/*guardo el termino en el arbol de ejecucion*/

		char cad[10];
		char cad1[10];
		strcpy(cad,"_cte");
		n++;
		sprintf(cad1,"%d",n);
		strcat(cad,cad1);

		nodo_factor = crear_hoja(crear_info(cad));
		insertar_en_pila(&pila_factores,crear_info_sentencias(nodo_factor));

	}
	| CTE_STR {
		printf("\n***REGLA 46 -> Factor:\n");
		printf("\t\t\t CTE_STR\n");

		agregar_tipo_a_TS(yylval.str,"CTE_STR");

		char cad[10];
		char cad1[10];
		strcpy(cad,"_cte");
		n++;
		sprintf(cad1,"%d",n);
		strcat(cad,cad1);

       	nodo_factor = crear_hoja(crear_info(cad));
		insertar_en_pila(&pila_factores,crear_info_sentencias(nodo_factor));
	}
	| OPE_RES factor %prec OPE_MUL {
		printf("\n***REGLA 47 -> EXPRESION:\n");
		printf("\t\t\t OPE_RES factor\n");
	}
;

%%

int main(int argc,char *argv[])
{
	if ((yyin = fopen(argv[1], "rt")) == NULL) {
		printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
 	} else {
		crear_pila_de_colas(&pila_de_colas);
		crear_pila(&pila_id);
		crear_cola(&cola_expresiones);
		crear_cola(&cola_sentencias);
		crear_cola(&cola_asignacion);
		crear_pila(&pila_comparaciones);
		crear_pila(&pila_condiciones);
		crear_pila(&pila_factores);
		crear_pila(&pila_terminos);
		crear_pila(&pila_expresiones);
		crear_pila(&pila_exp);
		crear_pila(&pila_expre);
		crear_pila(&pila_asignacionmult);
		crear_pila(&pila_asigna);
		crear_pila(&pila_asignacion);
		crear_arbol(&arbol_ejecucion);

		yyparse();

		guardarTabladeSimbolosEnUnArchivo();
        arbol_ejecucion->p_nodo = obtener_raiz(nodo_start);
	    print_t(arbol_ejecucion->p_nodo);

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

/////////// funciones ////////////////////////////////

void crear_arbol(t_arbol ** p_arbol)
{
	*p_arbol = (t_arbol*) malloc(sizeof(t_arbol));
	(*p_arbol)->p_nodo =NULL;
}

/* Esta funcion crea un t_info a partir de una string, para agregarla
directamente a un nodo de arbol */
t_info * crear_info(char * str)
{
	t_info * p_info = (t_info *) malloc(sizeof(t_info));
	strcpy(p_info->a,str);
	return p_info;
}

t_nodo_arbol * crear_nodo_arbol(t_info * info, t_nodo_arbol * p_nodo_izq, t_nodo_arbol * p_nodo_der)
{
	t_nodo_arbol * p_nodo = (t_nodo_arbol * ) malloc(sizeof(t_nodo_arbol));

	p_nodo->padre = NULL;
	p_nodo->info= info;
	p_nodo->nodo_der = p_nodo_der;
	p_nodo->nodo_izq = p_nodo_izq;


	if(p_nodo_der)
	p_nodo_der->padre = p_nodo;
	if(p_nodo_izq)
	p_nodo_izq->padre = p_nodo;


	return p_nodo;
}

t_nodo_arbol * crear_hoja(t_info * info)
{
	return crear_nodo_arbol(info,NULL,NULL);
}

t_nodo_arbol * obtener_raiz(t_nodo_arbol * p_nodo)
{
	if(p_nodo->padre)
		return obtener_raiz(p_nodo->padre);
	return p_nodo;
}

void visitar(t_nodo_arbol * p_nodo)
{
	if(p_nodo != NULL)
		printf("Visitando el nodo: %s \n", p_nodo->info->a );
}

void recorrer_en_orden(t_nodo_arbol * p_nodo,void (*f)(t_nodo_arbol*))
{
	if(p_nodo == NULL)
		return;

	recorrer_en_orden(p_nodo->nodo_izq,f);
	f(p_nodo);
	recorrer_en_orden(p_nodo->nodo_der,f);
}

int es_hoja(t_nodo_arbol *n)
{
	if(n->nodo_izq != NULL || n->nodo_der != NULL)
		return 0;

	return 1;
}

int _print_t(t_nodo_arbol *tree, int is_left, int offset, int depth, char * s, int max)
{
	int i;
	char b[20];
	int width = 5;

	if (!tree) return 0;

	sprintf(b, "(%s)", tree->info->a);

	int left	= _print_t(tree->nodo_izq, 1, offset, depth + 1, s,max);
	int right = _print_t(tree->nodo_der, 0, offset + left + width, depth + 1, s,max);

	copiar_sin_finalizador(s + (2 * depth)*max + offset + left,b);

	if (depth && is_left) {
		for (i = 0; i < width + right; i++) {
			copiar_sin_finalizador(s + (2 * depth - 1)*max + offset + left + width/2 + i,"-");
		}
		copiar_sin_finalizador(s + (2 * depth - 1)*max + offset + left + width/2 ,"+");
		copiar_sin_finalizador(s + (2 * depth - 1)*max + offset + left + width + right + width/2 ,"+");
	}
	else if (depth && !is_left) {
		for (i = 0; i < left + width; i++) {
			copiar_sin_finalizador(s + (2 * depth - 1)*max + offset - width/2 + i ,"-");
		}
		copiar_sin_finalizador(s + (2 * depth - 1)*max + offset + left + width/2 ,"+");
	}

	return left + width + right;
}

void print_t(t_nodo_arbol *tree)
{
	FILE *f = fopen("intermedia.txt", "w+");
	if (f == NULL) {
		puts("Error abriendo archivo de notacion intermedia");
		exit(1);
	}
	int l;
	char * s = (char *) malloc(sizeof(char) * RENGLONES_IMPRESION_ARBOL * CARACTERES_RENGLON_ARBOL);

	for (l= 0; l < RENGLONES_IMPRESION_ARBOL * CARACTERES_RENGLON_ARBOL; l++) {
		if(l == 0 || l % (CARACTERES_RENGLON_ARBOL - 1))
			sprintf(s + l, "%c", ' ');
		else
			sprintf(s + l, "%c", '\0');
	}

	_print_t(tree, 0, 0, 0, s,CARACTERES_RENGLON_ARBOL);

	for (l = 0; l < RENGLONES_IMPRESION_ARBOL;l++) {
		fprintf(f, "%s\n", s + l*CARACTERES_RENGLON_ARBOL);
	}

	fclose(f);
}

void copiar_sin_finalizador(char * dest,char * orig)
{
	while(*orig && *dest) {
		*dest = *orig;
		orig++;
		dest++;
	}
}

/* INICIO PILA*/
void crear_pila(t_pila ** p_pila)
{
	*p_pila = NULL;
}

void insertar_en_pila(t_pila ** p_pila, t_info_sentencias * p_info)
{
	t_nodo * nodo = (t_nodo*)malloc(sizeof(t_nodo**));

	if(*p_pila == NULL) {
		*p_pila = (t_pila*) malloc(sizeof(t_pila**));
	 	(*p_pila)->p_nodo = NULL;
	}

	nodo->sig_nodo = (*p_pila)->p_nodo;
 	(*p_pila)->p_nodo = nodo;

	nodo->info = p_info;
}

t_info_sentencias * crear_info_sentencias(t_nodo_arbol * p_nodo)
{
	t_info_sentencias * p_info = (t_info_sentencias *) malloc(sizeof(t_info_sentencias));
	p_info->a = p_nodo;
	return p_info;
}

t_info_sentencias * sacar_de_pila(t_pila** p_pila)
{
	if(*p_pila == NULL) return NULL;
	t_nodo * nodo_a_eliminar = (*p_pila)->p_nodo;
	t_info_sentencias * ret_info = (*p_pila)->p_nodo->info;
	(*p_pila)->p_nodo = (*p_pila)->p_nodo->sig_nodo;

	if((*p_pila)->p_nodo == NULL) {
		free(*p_pila);
		*p_pila = NULL;
	}

	if(nodo_a_eliminar != NULL)
	free(nodo_a_eliminar);

	return ret_info;
}

/* INICIO DE COLAS*/
void crear_cola(t_cola ** p_cola)
{
	*p_cola = NULL;
}

int cola_vacia(t_cola ** p_cola)
{
	return (*p_cola) == NULL;
}

void insertar_en_cola(t_cola ** p_cola, t_info_sentencias * p_info)
{
	t_nodo * nodo = (t_nodo*)malloc(sizeof(t_nodo));

	if(*p_cola == NULL) {
		*p_cola = (t_cola*) malloc(sizeof(t_cola));
	 	(*p_cola)->p_primero = (*p_cola)->p_ultimo = nodo;
	} else if ((*p_cola)->p_primero == (*p_cola)->p_ultimo) {
		(*p_cola)->p_primero->sig_nodo = nodo;
	 	(*p_cola)->p_ultimo->sig_nodo = nodo;
	 	(*p_cola)->p_ultimo = nodo;
	} else {
	 	(*p_cola)->p_ultimo->sig_nodo = nodo;
	 	(*p_cola)->p_ultimo = nodo;
	}
 	nodo->sig_nodo = NULL;
	nodo->info = p_info;
	//printf("cola %s\n",nodo->info->a->info);
}

t_info_sentencias * sacar_de_cola(t_cola** p_cola)
{
	if(*p_cola == NULL) return NULL;

	t_nodo * nodo_a_eliminar = (*p_cola)->p_primero;
	t_info_sentencias * ret_info = (*p_cola)->p_primero->info;
	(*p_cola)->p_primero = (*p_cola)->p_primero->sig_nodo;

	if((*p_cola)->p_primero == NULL) {
		free(*p_cola);
		*p_cola = NULL;
	}

	if(nodo_a_eliminar != NULL)
		free(nodo_a_eliminar);

	return ret_info;
}

/* INICIO PILA DE COLAS*/

void crear_pila_de_colas(t_pila_de_colas ** p_pila)
{
	*p_pila = NULL;
}

void insertar_en_pila_de_colas(t_pila_de_colas ** p_pila, t_cola * p_info)
{
	t_nodo_pila_de_colas * nodo = (t_nodo_pila_de_colas*)malloc(sizeof(t_nodo_pila_de_colas));

	if(*p_pila == NULL) {
		*p_pila = (t_pila_de_colas*) malloc(sizeof(t_pila_de_colas**));
	 	(*p_pila)->p_nodo = NULL;
	}

	nodo->sig_nodo = (*p_pila)->p_nodo;
 	(*p_pila)->p_nodo = nodo;

	nodo->info = p_info;
}

t_cola * sacar_de_pila_de_colas(t_pila_de_colas** p_pila)
{
	if(*p_pila == NULL) return NULL;
	t_nodo_pila_de_colas * nodo_a_eliminar = (*p_pila)->p_nodo;
	t_cola * ret_info = (*p_pila)->p_nodo->info;
	(*p_pila)->p_nodo = (*p_pila)->p_nodo->sig_nodo;

	if((*p_pila)->p_nodo == NULL) {
		free(*p_pila);
		*p_pila = NULL;
	}

	if(nodo_a_eliminar != NULL)
		free(nodo_a_eliminar);

	return ret_info;
}
//////////////////////// ASSEMBLER /////////////////////////////////

void crearAssembler(t_nodo_arbol *arbol)
{
	int s;
	//recorrer_en_orden(arbol_ejecucion->p_nodo,&visitar);
	a = fopen("Final.asm", "w");
	if (a == NULL) {
		puts("Error abriendo archivo assembler");
		exit(1);
	}

	fprintf(a, "\ninclude macros2.asm\t\t ;incluye macros");
	fprintf(a, "\ninclude number.asm\t\t ;incluye el asm para impresion de numeros");
	fprintf(a, "\n.model large");
	fprintf(a, "\n.386");
	fprintf(a, "\n.stack 200h");
	fprintf(a, "\n");
	fprintf(a, "\n.DATA\n");

	fprintf(a, "\nread db 'Ingrese valor por teclado...', '$'\n");

	for(s=0;s<100;s++) {
		if(!strcmp(ts[s].tipoDato,"CTE_STR"))
		fprintf(a, "%s		  db		  '%s','$'\n",ts[s].nombre,ts[s].valor);

		if(!strcmp(ts[s].tipoDato,"CTE_REAL")) {
			fprintf(a, "%s		  dd		  %s\n",ts[s].nombre,ts[s].valor);
		}
		if(!strcmp(ts[s].tipoDato,"CTE_INT")) {
			fprintf(a, "%s		  dd		  %s\n",ts[s].nombre,ts[s].valor);
		}
		if(!strcmp(ts[s].tipoDato,"FLOAT")) {
			fprintf(a, "%s		  dd		  ?\n",ts[s].nombre);
		}
		if(!strcmp(ts[s].tipoDato,"STRING")) {
			fprintf(a, "%s		  db		  '$'\n",ts[s].nombre);
		}
		if(!strcmp(ts[s].tipoDato,"INTEGER")) {
			fprintf(a, "%s		  dd		  ?\n",ts[s].nombre);
		}
	}
	fprintf(a, "\naux1 dd ?");
	fprintf(a, "\naux2 dd ?");

	fprintf(a, "\n");
	fprintf(a, "\n.CODE");
	fprintf(a, "\nmain:");
	fprintf(a, "\nmov AX,@DATA ;");
	fprintf(a, "\nmov DS,AX ;");
	fprintf(a, "\nfinit ;\n");
	recorrer_asm(arbol, 0);

	if(ifs>0) {
		fprintf(a, "\nend_if");
		char buf[2];
		sprintf(buf, "%d", ifs);
		fprintf(a, "%s", buf);
		fprintf(a, ":");
		ifs--;

		if(ifs==base) {
			ifs+=10;
			base+=10;
		}
	}

	if(whiles>0) {
		fprintf(a, "\njmp ");
		char buffer[2];//
		sprintf(buffer, "%d", whiles);///
		fprintf(a, "end_while");
		fprintf(a, "%s", buffer);///
		fprintf(a, "\nend_while");
		char buf[2];
		sprintf(buf, "%d", whiles);
		fprintf(a, "%s", buf);
		fprintf(a, ":");
		whiles--;

	}

	fprintf(a, "\n\nmov AX, 4C00h");
	fprintf(a, "\nint 21h");
	fprintf(a, "\nend main");
}

void recorrer_asm(t_nodo_arbol *n, int usar_aux2)
{
	if(n->nodo_izq != NULL)
		recorrer_asm(n->nodo_izq, usar_aux2);

	if(strcmp(n->info->a,"=")==0) {
		if(es_hoja(n->nodo_der)) {
			//Si el nodo derecho es Hoja hace la asignacion
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, ";asignacion");
			fprintf(a, "\nfstp ");
			fprintf(a, "%s", n->nodo_izq->info->a);
		} else if(!es_hoja(n->nodo_der)) {
			//Si no es hoja tiene que poner al final la asignacion y en aux1 va a tener el resultado del resto
			strcpy(asig_final, "\nfld ");
			strcat(asig_final, "aux1");
			strcat(asig_final, "\nfstp ");
			strcat(asig_final, n->nodo_izq->info->a);//coloca el resultado en el Resto
		}
		//Si no es una Asignacion , pregunta si es una +
	}	else if(strcmp(n->info->a,"+")==0) {

		//si el nodo izq y derecho son hojas , resuelve
		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");//apila nodo derecho
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");//Apila nodo izquierdo
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfadd");//Suma
			fprintf(a, "\nfstp ");//desapila resultado en aux1 o aux2

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}
		}
		//Si el hijo izquierdo no es hoja y el derecho es hoja
		else if(!es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");
			fprintf(a, "aux1");//El resultado del nodo izquierdo
			fprintf(a, "\nfadd");
			fprintf(a, "\nfstp ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}
		} else {
			strcpy(sent_final, "\nfld ");//Si ninguno es hoja
			strcat(sent_final, "aux2");//Resultado nodo derecho
			strcat(sent_final, "\nfld ");
			strcat(sent_final, "aux1");//Resultado nodo izquierdo
			strcat(sent_final, "\nfadd ");
			strcat(sent_final, "\nfstp ");
			strcat(sent_final, "aux1");
			usar_aux2 = 1;
		}
	} else if(strcmp(n->info->a,"-")==0) {
		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfsub");
			fprintf(a, "\nfstp ");
			fprintf(a, "aux1");
		} else if(!es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");
			fprintf(a, "aux1");
			fprintf(a, "\nfsub");
			fprintf(a, "\nfstp ");
			fprintf(a, "aux1");
		} else {
			strcpy(sent_final, "\nfld ");
			strcat(sent_final, "aux2");
			strcat(sent_final, "\nfld ");
			strcat(sent_final, "aux1");
			strcat(sent_final, "\nfsub ");
			strcat(sent_final, "\nfstp ");
			strcat(sent_final, "aux1");
			usar_aux2 = 1;
		}
	} else if(strcmp(n->info->a,"*")==0) {
		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfmul");
			fprintf(a, "\nfstp ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
				fprintf(a, "%s", sent_final);
				strcpy(sent_final,"");
			} else {
				fprintf(a, "aux2");
			}
		} else if(!es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}

			fprintf(a, "\nfmul");
			fprintf(a, "\nfstp ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}
		}
	} else if(strcmp(n->info->a,"/")==0) {
		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfdiv");
			fprintf(a, "\nfstp ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
				fprintf(a, "%s", sent_final);
				strcpy(sent_final,"");
			} else {
				fprintf(a, "aux2");
			}
		} else if(!es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}

			fprintf(a, "\nfdiv");
			fprintf(a, "\nfstp ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}
		}
	} else if(strcmp(n->info->a,"DIV")==0) {
		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der))	{
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfdiv");
			fprintf(a, "\nfstp ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
				fprintf(a, "%s", sent_final);
				strcpy(sent_final,"");
			} else {
				fprintf(a, "aux2");
			}
		}	else if(!es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}

			fprintf(a, "\nfdiv");
			fprintf(a, "\nfstp ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}
		}
	// Para calcular resto: FPREM = ST(0) <- REPITE(ST(0)-ST(1))
	} else if(strcmp(n->info->a,"MOD")==0) {
		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfprem");
			fprintf(a, "\nfstp ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
				fprintf(a, "%s", sent_final);
				strcpy(sent_final,"");
			} else {
				fprintf(a, "aux2");
			}
		} else if(!es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfld ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}

			fprintf(a, "\fprem");
			fprintf(a, "\nfstp ");

			if(!usar_aux2) {
				fprintf(a, "aux1");
			} else {
				fprintf(a, "aux2");
			}
		}
	} else if(strcmp(n->info->a,"==")==0) {
		usar_aux2=1;
		strcpy(string_cond, "\njne ");

		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfstp aux1");
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfstp aux2");
		}
	} else if(strcmp(n->info->a,"!=")==0) {
		usar_aux2=1;
		strcpy(string_cond, "\nje ");

		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfstp aux1");
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfstp aux2");
		}
	} else if(strcmp(n->info->a,">")==0) {
		usar_aux2=1;
		strcpy(string_cond, "\njle ");

		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfstp aux1");
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfstp aux2");
		}
	} else if(strcmp(n->info->a,">=")==0) {
		usar_aux2=1;
		strcpy(string_cond, "\njl ");

		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfstp aux1");
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfstp aux2");
		}
	} else if(strcmp(n->info->a,"<")==0) {
		usar_aux2=1;
		strcpy(string_cond, "\njbe ");

		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfstp aux1");
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfstp aux2");
		}
	} else if(strcmp(n->info->a,"<=")==0) {
		usar_aux2=1;
		strcpy(string_cond, "\njb ");

		if(es_hoja(n->nodo_izq) && es_hoja(n->nodo_der)) {
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nfstp aux1");
			fprintf(a, "\nfld ");
			fprintf(a, "%s", n->nodo_der->info->a);
			fprintf(a, "\nfstp aux2");
		}
	} else if(strcmp(n->info->a,"IF")==0) {
		ifs++;

		if(strcmp(n->nodo_der->info->a, "<V.F>")!=0 ) {
			fprintf(a, "\nfld ");
			fprintf(a, "aux1");
			fprintf(a, "\nfcomp ");
			fprintf(a, "aux2");
			fprintf(a, "\nfstsw ax");
			fprintf(a, "\nsahf");
			fprintf(a, "\nffree st(0)");
			fprintf(a, "%s", string_cond);
			fprintf(a, "end_if");
			char buf[2];
			sprintf(buf, "%d", ifs);
			fprintf(a, "%s", buf);
		} else {
			fprintf(a, "\nfld ");
			fprintf(a, "aux1");
			fprintf(a, "\nfcomp ");
			fprintf(a, "aux2");
			fprintf(a, "\nfstsw ax");
			fprintf(a, "\nfwait");
			fprintf(a, "\nsahf");
			fprintf(a, "\nffree st(0)");
			fprintf(a, "%s", string_cond);
			fprintf(a, "else_if");
			char buf[2];
			sprintf(buf, "%d", ifs);
			fprintf(a, "%s", buf);
		}
	} else if(strcmp(n->info->a,"<V.F>")==0) {
		char buf[2];
		sprintf(buf, "%d", ifs);
		fprintf(a, "\njmp ");
		fprintf(a, "end_if");
		fprintf(a, "%s", buf);
		fprintf(a, "\nelse_if");
		fprintf(a, "%s", buf);
		fprintf(a, ":");
	} else if(strcmp(n->info->a,"WHILE")==0) {
		whiles++;
		fprintf(a, "\nwhile");
		char buf3[2];
		sprintf(buf3, "%d", whiles);
		fprintf(a, "%s", buf3);
		fprintf(a, ":");
		fprintf(a, "\nfld ");
		fprintf(a, "aux1");
		fprintf(a, "\nfcomp ");
		fprintf(a, "aux2");
		fprintf(a, "\nfstsw ax");
		fprintf(a, "\nfwait");
		fprintf(a, "\nsahf");
		fprintf(a, "\nffree st(0)");
		fprintf(a, "%s", string_cond);
		fprintf(a, "while");
		char buf[2];
		sprintf(buf, "%d", whiles);
		fprintf(a, "%s", buf);
	} else if(strcmp(n->info->a,"WRITE")==0 && strcmp(n->padre->info->a,";")==0) {
         //printf("%s\n",n->nodo_izq->info->a);
		int tipo = traer_tipo_con_prefijo(n->nodo_izq->info->a);

		if(tipo == 1) {
			fprintf(a, "\nDisplayFloat ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, " 2");
			fprintf(a, "\nnewLine 1");
		} else {
			fprintf(a, "\nDisplayString ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nnewLine 1");
		}
	} else if(strcmp(n->info->a,"READ")==0 && strcmp(n->padre->info->a,";")==0) {
		fprintf(a, "\nmov dx, OFFSET read");
		fprintf(a, "\nmov ah, 9");
		fprintf(a, "\nint 21h");
		fprintf(a, "\nnewLine 1");
		int tipo = traer_tipo_con_prefijo(n->nodo_izq->info->a);

		if(tipo == 1) {
			fprintf(a, "\nGetFloat ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nnewLine 1");
		} else {
			fprintf(a, "\nGetString ");
			fprintf(a, "%s", n->nodo_izq->info->a);
			fprintf(a, "\nnewLine 1");
		}
	}

	if(n->nodo_der != NULL)
		recorrer_asm(n->nodo_der, usar_aux2);
}
