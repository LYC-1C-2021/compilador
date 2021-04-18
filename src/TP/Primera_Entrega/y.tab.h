
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
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

extern YYSTYPE yylval;


