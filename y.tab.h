/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    FUNC = 258,
    MAIN = 259,
    ZILCH = 260,
    READ = 261,
    WRITE = 262,
    VAR = 263,
    FINAL = 264,
    ASSUME = 265,
    OTHERWISE = 266,
    REPEAT = 267,
    PARSE = 268,
    ID = 269,
    CHARACTER = 270,
    INT = 271,
    BOOL = 272,
    CHAR = 273,
    NUM = 274,
    LTE = 275,
    GTE = 276,
    EQ = 277,
    NEQ = 278,
    OPENBRACKET = 279,
    CLOSEBRACKET = 280,
    OPENEDGEBRACKET = 281,
    CLOSEEDGEBRACKET = 282,
    OPENCURLYBRACKET = 283,
    CLOSECURLYBRACKET = 284,
    SEMICOLON = 285,
    COMMA = 286,
    COLON = 287,
    ASSIGN = 288,
    LT = 289,
    GT = 290,
    MOD = 291,
    ADD = 292,
    SUB = 293,
    MUL = 294,
    DIV = 295,
    AND = 296,
    OR = 297,
    TRUE = 298,
    FALSE = 299
  };
#endif
/* Tokens.  */
#define FUNC 258
#define MAIN 259
#define ZILCH 260
#define READ 261
#define WRITE 262
#define VAR 263
#define FINAL 264
#define ASSUME 265
#define OTHERWISE 266
#define REPEAT 267
#define PARSE 268
#define ID 269
#define CHARACTER 270
#define INT 271
#define BOOL 272
#define CHAR 273
#define NUM 274
#define LTE 275
#define GTE 276
#define EQ 277
#define NEQ 278
#define OPENBRACKET 279
#define CLOSEBRACKET 280
#define OPENEDGEBRACKET 281
#define CLOSEEDGEBRACKET 282
#define OPENCURLYBRACKET 283
#define CLOSECURLYBRACKET 284
#define SEMICOLON 285
#define COMMA 286
#define COLON 287
#define ASSIGN 288
#define LT 289
#define GT 290
#define MOD 291
#define ADD 292
#define SUB 293
#define MUL 294
#define DIV 295
#define AND 296
#define OR 297
#define TRUE 298
#define FALSE 299

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
