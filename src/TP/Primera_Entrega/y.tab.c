
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 1 "Sintactico.y"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <errno.h>
#include "y.tab.h"

int yystopparser=0;
char * yytext;
                
FILE  *yyin;




/* Line 189 of yacc.c  */
#line 90 "y.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     DECVAR = 258,
     ENDDEC = 259,
     DOS_PUNTOS = 260,
     C_A = 261,
     C_C = 262,
     INTEGER = 263,
     STRING = 264,
     FLOAT = 265,
     REAL = 266,
     COMA = 267,
     ID = 268,
     OPE_ASIG = 269,
     OPE_SUM = 270,
     OPE_RES = 271,
     OPE_MUL = 272,
     OPE_DIV = 273,
     CTE_REAL = 274,
     CTE_STR = 275,
     CTE_INT = 276,
     P_A = 277,
     P_C = 278,
     IF = 279,
     THEN = 280,
     ELSE = 281,
     ENDIF = 282,
     IGUAL = 283,
     DIST = 284,
     MENOR = 285,
     MAYOR = 286,
     MEN_IG = 287,
     MAY_IG = 288,
     AND = 289,
     OR = 290,
     NOT = 291,
     WHILE = 292,
     ENDWHILE = 293,
     CONST = 294,
     WRITE = 295,
     READ = 296,
     PUNTO_COMA = 297,
     L_A = 298,
     L_C = 299
   };
#endif
/* Tokens.  */
#define DECVAR 258
#define ENDDEC 259
#define DOS_PUNTOS 260
#define C_A 261
#define C_C 262
#define INTEGER 263
#define STRING 264
#define FLOAT 265
#define REAL 266
#define COMA 267
#define ID 268
#define OPE_ASIG 269
#define OPE_SUM 270
#define OPE_RES 271
#define OPE_MUL 272
#define OPE_DIV 273
#define CTE_REAL 274
#define CTE_STR 275
#define CTE_INT 276
#define P_A 277
#define P_C 278
#define IF 279
#define THEN 280
#define ELSE 281
#define ENDIF 282
#define IGUAL 283
#define DIST 284
#define MENOR 285
#define MAYOR 286
#define MEN_IG 287
#define MAY_IG 288
#define AND 289
#define OR 290
#define NOT 291
#define WHILE 292
#define ENDWHILE 293
#define CONST 294
#define WRITE 295
#define READ 296
#define PUNTO_COMA 297
#define L_A 298
#define L_C 299




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 220 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  7
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   135

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  45
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  71
/* YYNRULES -- Number of rules.  */
#define YYNRULES  102
/* YYNRULES -- Number of states.  */
#define YYNSTATES  154

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   299

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     6,     7,     8,    12,    13,    18,    20,
      21,    25,    26,    29,    30,    33,    34,    38,    39,    42,
      43,    46,    47,    50,    51,    54,    55,    58,    59,    62,
      63,    69,    70,    75,    76,    81,    82,    85,    86,    89,
      90,    93,    94,    99,   100,   105,   106,   111,   112,   119,
     120,   131,   132,   137,   138,   143,   144,   150,   151,   156,
     157,   162,   163,   168,   169,   174,   175,   180,   181,   186,
     187,   192,   193,   198,   199,   206,   207,   210,   211,   216,
     217,   222,   223,   226,   227,   232,   233,   238,   239,   244,
     245,   248,   249,   252,   253,   256,   257,   260,   261,   268,
     269,   276,   277
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      46,     0,    -1,    49,    53,    -1,    -1,    -1,    49,    47,
      48,    -1,    -1,     3,    51,     4,    50,    -1,    67,    -1,
      -1,    67,    51,    52,    -1,    -1,    55,    54,    -1,    -1,
      58,    56,    -1,    -1,    55,    58,    57,    -1,    -1,    65,
      59,    -1,    -1,    79,    60,    -1,    -1,    96,    61,    -1,
      -1,    74,    62,    -1,    -1,    76,    63,    -1,    -1,   112,
      64,    -1,    -1,    13,    14,    98,    42,    66,    -1,    -1,
      13,     5,    70,    68,    -1,    -1,    13,    12,    67,    69,
      -1,    -1,     8,    71,    -1,    -1,     9,    72,    -1,    -1,
      10,    73,    -1,    -1,    41,    13,    42,    75,    -1,    -1,
      40,    20,    42,    77,    -1,    -1,    40,    13,    42,    78,
      -1,    -1,    24,    82,    43,    55,    44,    80,    -1,    -1,
      24,    82,    43,    55,    44,    26,    43,    55,    44,    81,
      -1,    -1,    22,    86,    23,    83,    -1,    -1,    22,    93,
      23,    84,    -1,    -1,    22,    36,    86,    23,    85,    -1,
      -1,    98,    31,    98,    87,    -1,    -1,    98,    30,    98,
      88,    -1,    -1,    98,    29,    98,    89,    -1,    -1,    98,
      28,    98,    90,    -1,    -1,    98,    33,    98,    91,    -1,
      -1,    98,    32,    98,    92,    -1,    -1,    86,    34,    86,
      94,    -1,    -1,    86,    35,    86,    95,    -1,    -1,    37,
      82,    43,    55,    44,    97,    -1,    -1,   102,    99,    -1,
      -1,    98,    15,   102,   100,    -1,    -1,    98,    16,   102,
     101,    -1,    -1,   107,   103,    -1,    -1,    22,    98,    23,
     104,    -1,    -1,   102,    17,   107,   105,    -1,    -1,   102,
      18,   107,   106,    -1,    -1,    13,   108,    -1,    -1,    21,
     109,    -1,    -1,    19,   110,    -1,    -1,    20,   111,    -1,
      -1,    39,    13,    14,    21,    42,   113,    -1,    -1,    39,
      13,    14,    19,    42,   114,    -1,    -1,    39,    13,    14,
      20,    42,   115,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    62,    62,    62,    63,    62,    67,    67,    71,    71,
      71,    75,    75,    79,    79,    81,    81,    84,    84,    86,
      86,    88,    88,    90,    90,    92,    92,    94,    94,    98,
      98,   102,   102,   104,   104,   109,   109,   111,   111,   113,
     113,   117,   117,   121,   121,   123,   123,   128,   128,   131,
     130,   135,   135,   137,   137,   139,   139,   142,   142,   144,
     144,   146,   146,   148,   148,   150,   150,   152,   152,   155,
     155,   157,   157,   160,   160,   164,   164,   166,   166,   168,
     168,   172,   172,   174,   174,   176,   176,   178,   178,   181,
     181,   183,   183,   185,   185,   187,   187,   191,   191,   193,
     193,   195,   195
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "DECVAR", "ENDDEC", "DOS_PUNTOS", "C_A",
  "C_C", "INTEGER", "STRING", "FLOAT", "REAL", "COMA", "ID", "OPE_ASIG",
  "OPE_SUM", "OPE_RES", "OPE_MUL", "OPE_DIV", "CTE_REAL", "CTE_STR",
  "CTE_INT", "P_A", "P_C", "IF", "THEN", "ELSE", "ENDIF", "IGUAL", "DIST",
  "MENOR", "MAYOR", "MEN_IG", "MAY_IG", "AND", "OR", "NOT", "WHILE",
  "ENDWHILE", "CONST", "WRITE", "READ", "PUNTO_COMA", "L_A", "L_C",
  "$accept", "programa", "$@1", "$@2", "declaracion", "$@3", "definicion",
  "$@4", "inicio", "$@5", "lista_sentencias", "$@6", "$@7", "sentencia",
  "$@8", "$@9", "$@10", "$@11", "$@12", "$@13", "asignacion", "$@14",
  "lista_id", "$@15", "$@16", "tipo_dato", "$@17", "$@18", "$@19",
  "entrada", "$@20", "salida", "$@21", "$@22", "decision", "$@23", "$@24",
  "condicion", "$@25", "$@26", "$@27", "condicion_simple", "$@28", "$@29",
  "$@30", "$@31", "$@32", "$@33", "condicion_doble", "$@34", "$@35",
  "iteracion", "$@36", "expresion", "$@37", "$@38", "$@39", "termino",
  "$@40", "$@41", "$@42", "$@43", "factor", "$@44", "$@45", "$@46", "$@47",
  "constante", "$@48", "$@49", "$@50", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    45,    46,    47,    48,    46,    50,    49,    51,    52,
      51,    54,    53,    56,    55,    57,    55,    59,    58,    60,
      58,    61,    58,    62,    58,    63,    58,    64,    58,    66,
      65,    68,    67,    69,    67,    71,    70,    72,    70,    73,
      70,    75,    74,    77,    76,    78,    76,    80,    79,    81,
      79,    83,    82,    84,    82,    85,    82,    87,    86,    88,
      86,    89,    86,    90,    86,    91,    86,    92,    86,    94,
      93,    95,    93,    97,    96,    99,    98,   100,    98,   101,
      98,   103,   102,   104,   102,   105,   102,   106,   102,   108,
     107,   109,   107,   110,   107,   111,   107,   113,   112,   114,
     112,   115,   112
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     2,     0,     0,     3,     0,     4,     1,     0,
       3,     0,     2,     0,     2,     0,     3,     0,     2,     0,
       2,     0,     2,     0,     2,     0,     2,     0,     2,     0,
       5,     0,     4,     0,     4,     0,     2,     0,     2,     0,
       2,     0,     4,     0,     4,     0,     4,     0,     6,     0,
      10,     0,     4,     0,     4,     0,     5,     0,     4,     0,
       4,     0,     4,     0,     4,     0,     4,     0,     4,     0,
       4,     0,     4,     0,     6,     0,     2,     0,     4,     0,
       4,     0,     2,     0,     4,     0,     4,     0,     4,     0,
       2,     0,     2,     0,     2,     0,     2,     0,     6,     0,
       6,     0,     6
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     3,     0,     0,     8,     1,     0,     0,
       0,     0,     0,     0,     4,     2,    11,    13,    17,    23,
      25,    19,    21,    27,     0,     0,     6,     9,     0,     0,
       0,     0,     0,     0,     0,     0,     5,    12,    15,    14,
      18,    24,    26,    20,    22,    28,    35,    37,    39,    31,
      33,     7,    10,    89,    93,    95,    91,     0,     0,    75,
      81,     0,     0,     0,     0,     0,     0,     0,    45,    43,
      41,    16,    36,    38,    40,    32,    34,    90,    94,    96,
      92,     0,     0,     0,    29,     0,     0,    76,    82,     0,
      51,     0,     0,    53,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    46,    44,    42,    83,    77,
      79,    30,    85,    87,    55,    52,    69,    71,    54,    63,
      61,    59,    57,    67,    65,    47,    73,    99,   101,    97,
      84,    78,    80,    86,    88,    56,    70,    72,    64,    62,
      60,    58,    68,    66,     0,    48,    74,   100,   102,    98,
       0,     0,    49,    50
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,    14,    36,     3,    51,     5,    52,    15,    37,
      16,    39,    71,    17,    40,    43,    44,    41,    42,    45,
      18,   111,     6,    75,    76,    49,    72,    73,    74,    19,
     107,    20,   106,   105,    21,   145,   153,    30,   115,   118,
     135,    62,   141,   140,   139,   138,   143,   142,    63,   136,
     137,    22,   146,    64,    87,   131,   132,    59,    88,   130,
     133,   134,    60,    77,    80,    78,    79,    23,   149,   147,
     148
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -65
static const yytype_int8 yypact[] =
{
       3,    -2,    14,    40,     5,    16,    -2,   -65,    28,    36,
      36,    50,    -8,    65,   -65,   -65,    40,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,    17,    -2,   -65,   -65,    35,    46,
      44,    56,    69,    63,    64,    66,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,    35,     7,    -9,
     -65,    35,   -19,    84,    60,    40,    40,    41,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,    13,    35,    35,   -65,    81,    81,   -65,   -65,    86,
     -65,    35,    35,   -65,    35,    35,    35,    35,    35,    35,
      -6,     0,    68,    70,    71,   -65,   -65,   -65,   -65,    -9,
      -9,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,    80,
      80,    80,    80,    80,    80,    85,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,    72,   -65,   -65,   -65,   -65,   -65,
      40,     6,   -65,   -65
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -65,   -65,   -65,   -65,   -65,   -65,   108,   -65,   -65,   -65,
     -64,   -65,   -65,   -16,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,    91,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -65,   -65,   -65,   -65,   107,   -65,   -65,
     -65,   -40,   -65,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65,   -65,   -65,   -25,   -65,   -65,   -65,    15,   -65,   -65,
     -65,   -65,    18,   -65,   -65,   -65,   -65,   -65,   -65,   -65,
     -65
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -1
static const yytype_uint8 yytable[] =
{
      38,   100,   101,    58,    90,    33,     1,     8,    85,    86,
      24,     4,    34,     8,     7,    91,    92,    25,     9,     8,
      26,    89,    82,    83,     9,    46,    47,    48,    82,    83,
       9,    10,    81,    11,    12,    13,   108,    10,   125,    11,
      12,    13,    28,    10,   126,    11,    12,    13,    53,    84,
     152,   116,   117,     8,    54,    55,    56,    57,    29,    53,
     102,   103,   104,    32,     9,    54,    55,    56,    57,   119,
     120,   121,   122,   123,   124,    82,    83,    10,    35,    11,
      12,    13,    61,    67,    38,    38,   151,    65,    94,    95,
      96,    97,    98,    99,    53,    82,    83,   109,   110,    66,
      54,    55,    56,   112,   113,    68,    69,    93,    70,   114,
     127,   144,   128,   129,    27,   150,    50,    31,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    38
};

static const yytype_int16 yycheck[] =
{
      16,    65,    66,    28,    23,    13,     3,    13,    17,    18,
       5,    13,    20,    13,     0,    34,    35,    12,    24,    13,
       4,    61,    15,    16,    24,     8,     9,    10,    15,    16,
      24,    37,    57,    39,    40,    41,    23,    37,    44,    39,
      40,    41,    14,    37,    44,    39,    40,    41,    13,    42,
      44,    91,    92,    13,    19,    20,    21,    22,    22,    13,
      19,    20,    21,    13,    24,    19,    20,    21,    22,    94,
      95,    96,    97,    98,    99,    15,    16,    37,    13,    39,
      40,    41,    36,    14,   100,   101,   150,    43,    28,    29,
      30,    31,    32,    33,    13,    15,    16,    82,    83,    43,
      19,    20,    21,    85,    86,    42,    42,    23,    42,    23,
      42,    26,    42,    42,     6,    43,    25,    10,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,   151
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,    46,    49,    13,    51,    67,     0,    13,    24,
      37,    39,    40,    41,    47,    53,    55,    58,    65,    74,
      76,    79,    96,   112,     5,    12,     4,    51,    14,    22,
      82,    82,    13,    13,    20,    13,    48,    54,    58,    56,
      59,    62,    63,    60,    61,    64,     8,     9,    10,    70,
      67,    50,    52,    13,    19,    20,    21,    22,    98,   102,
     107,    36,    86,    93,    98,    43,    43,    14,    42,    42,
      42,    57,    71,    72,    73,    68,    69,   108,   110,   111,
     109,    98,    15,    16,    42,    17,    18,    99,   103,    86,
      23,    34,    35,    23,    28,    29,    30,    31,    32,    33,
      55,    55,    19,    20,    21,    78,    77,    75,    23,   102,
     102,    66,   107,   107,    23,    83,    86,    86,    84,    98,
      98,    98,    98,    98,    98,    44,    44,    42,    42,    42,
     104,   100,   101,   105,   106,    85,    94,    95,    90,    89,
      88,    87,    92,    91,    26,    80,    97,   114,   115,   113,
      43,    55,    44,    81
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 3:

/* Line 1455 of yacc.c  */
#line 62 "Sintactico.y"
    {printf("\n---------------------------\n");}
    break;

  case 4:

/* Line 1455 of yacc.c  */
#line 63 "Sintactico.y"
    {printf("\n****COMPILACION EXITOSA****\n");}
    break;

  case 5:

/* Line 1455 of yacc.c  */
#line 64 "Sintactico.y"
    {printf("\n---------------------------\n");}
    break;

  case 6:

/* Line 1455 of yacc.c  */
#line 67 "Sintactico.y"
    {printf("\n***REGLA 1 -> Declaracion:\n");}
    break;

  case 7:

/* Line 1455 of yacc.c  */
#line 68 "Sintactico.y"
    {printf("\t\t\tDeclaracion\n");}
    break;

  case 9:

/* Line 1455 of yacc.c  */
#line 71 "Sintactico.y"
    {printf("\n***REGLA 2 -> Declaracion:\n");}
    break;

  case 10:

/* Line 1455 of yacc.c  */
#line 72 "Sintactico.y"
    {printf("\t\t\tDefiniciones\n");}
    break;

  case 11:

/* Line 1455 of yacc.c  */
#line 75 "Sintactico.y"
    {printf("\n***REGLA 3 -> Inicio:\n");}
    break;

  case 12:

/* Line 1455 of yacc.c  */
#line 76 "Sintactico.y"
    {printf("\t\t\tLista_Sentencias\n");}
    break;

  case 13:

/* Line 1455 of yacc.c  */
#line 79 "Sintactico.y"
    {printf("\n***REGLA 4 -> Lista_Sentencias:\n");}
    break;

  case 14:

/* Line 1455 of yacc.c  */
#line 80 "Sintactico.y"
    {printf("\t\t\tSentencia\n");}
    break;

  case 15:

/* Line 1455 of yacc.c  */
#line 81 "Sintactico.y"
    {printf("\n***REGLA 5 -> Lista_Sentencias:\n");}
    break;

  case 16:

/* Line 1455 of yacc.c  */
#line 82 "Sintactico.y"
    {printf("\t\t\t Lista_Sentencias Sentencia\n");}
    break;

  case 17:

/* Line 1455 of yacc.c  */
#line 84 "Sintactico.y"
    {printf("\n***REGLA 6 -> Sentencia:\n");}
    break;

  case 18:

/* Line 1455 of yacc.c  */
#line 85 "Sintactico.y"
    {printf("\t\t\tAsignacion\n");}
    break;

  case 19:

/* Line 1455 of yacc.c  */
#line 86 "Sintactico.y"
    {printf("\n***REGLA 7 -> Sentencia:\n");}
    break;

  case 20:

/* Line 1455 of yacc.c  */
#line 87 "Sintactico.y"
    {printf("\t\t\tDecision\n");}
    break;

  case 21:

/* Line 1455 of yacc.c  */
#line 88 "Sintactico.y"
    {printf("\n***REGLA 8 -> Sentencia:\n");}
    break;

  case 22:

/* Line 1455 of yacc.c  */
#line 89 "Sintactico.y"
    {printf("\t\t\tIteracion\n");}
    break;

  case 23:

/* Line 1455 of yacc.c  */
#line 90 "Sintactico.y"
    {printf("\n***REGLA 9 -> Sentencia:\n");}
    break;

  case 24:

/* Line 1455 of yacc.c  */
#line 91 "Sintactico.y"
    {printf("\t\t\tEntrada\n");}
    break;

  case 25:

/* Line 1455 of yacc.c  */
#line 92 "Sintactico.y"
    {printf("\n***REGLA 10 -> Sentencia:\n");}
    break;

  case 26:

/* Line 1455 of yacc.c  */
#line 93 "Sintactico.y"
    {printf("\t\t\tSalida\n");}
    break;

  case 27:

/* Line 1455 of yacc.c  */
#line 94 "Sintactico.y"
    {printf("\n***REGLA 11 -> Sentencia:\n");}
    break;

  case 28:

/* Line 1455 of yacc.c  */
#line 95 "Sintactico.y"
    {printf("\t\t\tConstante\n");}
    break;

  case 29:

/* Line 1455 of yacc.c  */
#line 98 "Sintactico.y"
    {printf("\n***REGLA 12 -> Asignacion:\n");}
    break;

  case 30:

/* Line 1455 of yacc.c  */
#line 99 "Sintactico.y"
    {printf("\t\t\tID OPE_ASIG Expresion\n");}
    break;

  case 31:

/* Line 1455 of yacc.c  */
#line 102 "Sintactico.y"
    {printf("\n***REGLA 13 -> Lista_Id:\n");}
    break;

  case 32:

/* Line 1455 of yacc.c  */
#line 103 "Sintactico.y"
    {printf("\t\t\tID\n");}
    break;

  case 33:

/* Line 1455 of yacc.c  */
#line 104 "Sintactico.y"
    {printf("\n***REGLA 14 -> Lista_Id:\n");}
    break;

  case 34:

/* Line 1455 of yacc.c  */
#line 105 "Sintactico.y"
    {printf("\t\t\tID COMA Lista_Id\n");}
    break;

  case 35:

/* Line 1455 of yacc.c  */
#line 109 "Sintactico.y"
    {printf("\n***REGLA 15 -> Tipo_Dato:\n");}
    break;

  case 36:

/* Line 1455 of yacc.c  */
#line 110 "Sintactico.y"
    {printf("\t\t\tInteger\n");}
    break;

  case 37:

/* Line 1455 of yacc.c  */
#line 111 "Sintactico.y"
    {printf("\n***REGLA 16 -> Tipo_Dato:\n");}
    break;

  case 38:

/* Line 1455 of yacc.c  */
#line 112 "Sintactico.y"
    {printf("\t\t\tString\n");}
    break;

  case 39:

/* Line 1455 of yacc.c  */
#line 113 "Sintactico.y"
    {printf("\n***REGLA 17 -> Tipo_Dato:\n");}
    break;

  case 40:

/* Line 1455 of yacc.c  */
#line 114 "Sintactico.y"
    {printf("\t\t\tFloat\n");}
    break;

  case 41:

/* Line 1455 of yacc.c  */
#line 117 "Sintactico.y"
    {printf("\n***REGLA 18 -> Entrada: \n");}
    break;

  case 42:

/* Line 1455 of yacc.c  */
#line 118 "Sintactico.y"
    {printf("\t\t\t ID\n");}
    break;

  case 43:

/* Line 1455 of yacc.c  */
#line 121 "Sintactico.y"
    {printf("\n***REGLA 19 -> Salida:\n");}
    break;

  case 44:

/* Line 1455 of yacc.c  */
#line 122 "Sintactico.y"
    {printf("\t\t\t CTE_STR\n");}
    break;

  case 45:

/* Line 1455 of yacc.c  */
#line 123 "Sintactico.y"
    {printf("\n***REGLA 20 -> Salida:\n");}
    break;

  case 46:

/* Line 1455 of yacc.c  */
#line 124 "Sintactico.y"
    {printf("\t\t\tID\n");}
    break;

  case 47:

/* Line 1455 of yacc.c  */
#line 128 "Sintactico.y"
    {printf("\n***REGLA 23 -> Condicion:\n");}
    break;

  case 48:

/* Line 1455 of yacc.c  */
#line 129 "Sintactico.y"
    {printf("\t\t\t IF Condicion L_A Lista_Sentencias L_C\n");}
    break;

  case 49:

/* Line 1455 of yacc.c  */
#line 131 "Sintactico.y"
    {printf("\n***REGLA 24 -> Condicion:\n");}
    break;

  case 50:

/* Line 1455 of yacc.c  */
#line 132 "Sintactico.y"
    {printf("\t\t\t IF Condicion L_A Lista_Sentencias L_C ELSE L_A Lista_Sentencias L_C\n");}
    break;

  case 51:

/* Line 1455 of yacc.c  */
#line 135 "Sintactico.y"
    {printf("\n***REGLA 25 -> Condicion:\n");}
    break;

  case 52:

/* Line 1455 of yacc.c  */
#line 136 "Sintactico.y"
    {printf("\t\t\t Condicion_Simple\n");}
    break;

  case 53:

/* Line 1455 of yacc.c  */
#line 137 "Sintactico.y"
    {printf("\n***REGLA 26 -> Condicion:\n");}
    break;

  case 54:

/* Line 1455 of yacc.c  */
#line 138 "Sintactico.y"
    {printf("\t\t\t CONDICION_Doble\n");}
    break;

  case 55:

/* Line 1455 of yacc.c  */
#line 139 "Sintactico.y"
    {printf("\n***REGLA 27 -> Condicion:\n");}
    break;

  case 56:

/* Line 1455 of yacc.c  */
#line 140 "Sintactico.y"
    {printf("\t\t\t NOT Condicion_Simple\n");}
    break;

  case 57:

/* Line 1455 of yacc.c  */
#line 142 "Sintactico.y"
    {printf("\n***REGLA 28 -> Condicion_Simple:\n");}
    break;

  case 58:

/* Line 1455 of yacc.c  */
#line 143 "Sintactico.y"
    {printf("\t\t\t Expresion MAYOR Expresion\n");}
    break;

  case 59:

/* Line 1455 of yacc.c  */
#line 144 "Sintactico.y"
    {printf("\n***REGLA 29 -> Condicion_Simple:\n");}
    break;

  case 60:

/* Line 1455 of yacc.c  */
#line 145 "Sintactico.y"
    {printf("\t\t\t Expresion MENOR Expresion\n");}
    break;

  case 61:

/* Line 1455 of yacc.c  */
#line 146 "Sintactico.y"
    {printf("\n***REGLA 30 -> Condicion_Simple:\n");}
    break;

  case 62:

/* Line 1455 of yacc.c  */
#line 147 "Sintactico.y"
    {printf("\t\t\t Expresion DIST Expresion\n");}
    break;

  case 63:

/* Line 1455 of yacc.c  */
#line 148 "Sintactico.y"
    {printf("\n***REGLA 31 -> Condicion_Simple:\n");}
    break;

  case 64:

/* Line 1455 of yacc.c  */
#line 149 "Sintactico.y"
    {printf("\t\t\t Expresion IGUAL Expresion\n");}
    break;

  case 65:

/* Line 1455 of yacc.c  */
#line 150 "Sintactico.y"
    {printf("\n***REGLA 32 -> Condicion_Simple:\n");}
    break;

  case 66:

/* Line 1455 of yacc.c  */
#line 151 "Sintactico.y"
    {printf("\t\t\t Expresion MAY_IG Expresion\n");}
    break;

  case 67:

/* Line 1455 of yacc.c  */
#line 152 "Sintactico.y"
    {printf("\n***REGLA 33 -> Condicion_Simple:\n");}
    break;

  case 68:

/* Line 1455 of yacc.c  */
#line 153 "Sintactico.y"
    {printf("\t\t\t Expresion MEN_IG Expresion\n");}
    break;

  case 69:

/* Line 1455 of yacc.c  */
#line 155 "Sintactico.y"
    {printf("\n***REGLA 34 -> Condicion_Doble:\n");}
    break;

  case 70:

/* Line 1455 of yacc.c  */
#line 156 "Sintactico.y"
    {printf("\t\t\t Condicion_Simple AND Condicion_Simple\n");}
    break;

  case 71:

/* Line 1455 of yacc.c  */
#line 157 "Sintactico.y"
    {printf("\n***REGLA 35 -> Condicion_Doble:\n");}
    break;

  case 72:

/* Line 1455 of yacc.c  */
#line 158 "Sintactico.y"
    {printf("\t\t\t Condicion_Simple OR Condicion_Simple\n");}
    break;

  case 73:

/* Line 1455 of yacc.c  */
#line 160 "Sintactico.y"
    {printf("\n***REGLA 36 -> Iteracion:\n");}
    break;

  case 74:

/* Line 1455 of yacc.c  */
#line 161 "Sintactico.y"
    {printf("\t\t\t WHILE Condicion L_A Lista_Sentencias L_C\n");}
    break;

  case 75:

/* Line 1455 of yacc.c  */
#line 164 "Sintactico.y"
    {printf("\n***REGLA 37 -> Expresion:\n"); }
    break;

  case 76:

/* Line 1455 of yacc.c  */
#line 165 "Sintactico.y"
    {printf("\t\t\t Termino\n");}
    break;

  case 77:

/* Line 1455 of yacc.c  */
#line 166 "Sintactico.y"
    {printf("\n***REGLA 38 -> Expresion:\n"); }
    break;

  case 78:

/* Line 1455 of yacc.c  */
#line 167 "Sintactico.y"
    {printf("\t\t\t Expresion OPE_SUM Termino\n");}
    break;

  case 79:

/* Line 1455 of yacc.c  */
#line 168 "Sintactico.y"
    {printf("\n***REGLA 39 -> EXPRESION:\n");}
    break;

  case 80:

/* Line 1455 of yacc.c  */
#line 169 "Sintactico.y"
    {printf("\t\t\t Expresion OPE_RES Termino\n");}
    break;

  case 81:

/* Line 1455 of yacc.c  */
#line 172 "Sintactico.y"
    {printf("\n***REGLA 40 -> Termino:\n");}
    break;

  case 82:

/* Line 1455 of yacc.c  */
#line 173 "Sintactico.y"
    {printf("\t\t\t Factor\n");}
    break;

  case 83:

/* Line 1455 of yacc.c  */
#line 174 "Sintactico.y"
    {printf("\n***REGLA 41 -> Termino:\n");}
    break;

  case 84:

/* Line 1455 of yacc.c  */
#line 175 "Sintactico.y"
    {printf("\t\t\t P_A expresion P_C\n");}
    break;

  case 85:

/* Line 1455 of yacc.c  */
#line 176 "Sintactico.y"
    {printf("\n***REGLA 42 -> Termino:\n");}
    break;

  case 86:

/* Line 1455 of yacc.c  */
#line 177 "Sintactico.y"
    {printf("\t\t\t Termino OPE_MUL Factor\n");}
    break;

  case 87:

/* Line 1455 of yacc.c  */
#line 178 "Sintactico.y"
    {printf("\n***REGLA 43 -> Termino:\n");}
    break;

  case 88:

/* Line 1455 of yacc.c  */
#line 179 "Sintactico.y"
    {printf("\t\t\t Termino OPE_DIV Factor\n");}
    break;

  case 89:

/* Line 1455 of yacc.c  */
#line 181 "Sintactico.y"
    {printf("\n***REGLA 44 -> Factor:\n");}
    break;

  case 90:

/* Line 1455 of yacc.c  */
#line 182 "Sintactico.y"
    {printf("\t\t\t ID\n");}
    break;

  case 91:

/* Line 1455 of yacc.c  */
#line 183 "Sintactico.y"
    {printf("\n***REGLA 45 -> Factor:\n");}
    break;

  case 92:

/* Line 1455 of yacc.c  */
#line 184 "Sintactico.y"
    {printf("\t\t\t CTE_INT\n");}
    break;

  case 93:

/* Line 1455 of yacc.c  */
#line 185 "Sintactico.y"
    {printf("***REGLA 46 -> Factor:\n");}
    break;

  case 94:

/* Line 1455 of yacc.c  */
#line 186 "Sintactico.y"
    {printf("\t\t\t CTE_REAL\n");}
    break;

  case 95:

/* Line 1455 of yacc.c  */
#line 187 "Sintactico.y"
    {printf("\n***REGLA 47 -> Factor:\n");}
    break;

  case 96:

/* Line 1455 of yacc.c  */
#line 188 "Sintactico.y"
    {printf("\t\t\t CTE_STR\n");}
    break;

  case 97:

/* Line 1455 of yacc.c  */
#line 191 "Sintactico.y"
    {printf("\n***REGLA 48 -> Constante:\n");}
    break;

  case 98:

/* Line 1455 of yacc.c  */
#line 192 "Sintactico.y"
    {printf("\t\t\t CTE_INT\n");}
    break;

  case 99:

/* Line 1455 of yacc.c  */
#line 193 "Sintactico.y"
    {printf("\n***REGLA 49 -> Constante:\n");}
    break;

  case 100:

/* Line 1455 of yacc.c  */
#line 194 "Sintactico.y"
    {printf("\t\t\t CTE_REAL\n");}
    break;

  case 101:

/* Line 1455 of yacc.c  */
#line 195 "Sintactico.y"
    {printf("\n***REGLA  50-> Constante:\n");}
    break;

  case 102:

/* Line 1455 of yacc.c  */
#line 196 "Sintactico.y"
    {printf("\t\t\t CTE_STR\n");}
    break;



/* Line 1455 of yacc.c  */
#line 2265 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1675 of yacc.c  */
#line 200 "Sintactico.y"


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

