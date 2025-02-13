/* A Bison parser, made by GNU Bison 3.7.6.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    VOID = 258,                    /* VOID  */
    INT = 259,                     /* INT  */
    BYTE = 260,                    /* BYTE  */
    BOOL = 261,                    /* BOOL  */
    TRUE = 262,                    /* TRUE  */
    FALSE = 263,                   /* FALSE  */
    IF = 264,                      /* IF  */
    RETURN = 265,                  /* RETURN  */
    WHILE = 266,                   /* WHILE  */
    BREAK = 267,                   /* BREAK  */
    CONTINUE = 268,                /* CONTINUE  */
    SC = 269,                      /* SC  */
    COMMA = 270,                   /* COMMA  */
    ID = 271,                      /* ID  */
    NUM = 272,                     /* NUM  */
    NUM_B = 273,                   /* NUM_B  */
    PLUS = 274,                    /* PLUS  */
    MINUS = 275,                   /* MINUS  */
    MULTIPLY = 276,                /* MULTIPLY  */
    DIVIDE = 277,                  /* DIVIDE  */
    RELOP = 278,                   /* RELOP  */
    EQ = 279,                      /* EQ  */
    NE = 280,                      /* NE  */
    STRING = 281,                  /* STRING  */
    ERROR = 282,                   /* ERROR  */
    ASSIGN = 283,                  /* ASSIGN  */
    OR = 284,                      /* OR  */
    AND = 285,                     /* AND  */
    NOT = 286,                     /* NOT  */
    LPAREN = 287,                  /* LPAREN  */
    RPAREN = 288,                  /* RPAREN  */
    LBRACE = 289,                  /* LBRACE  */
    RBRACE = 290,                  /* RBRACE  */
    ELSE = 291                     /* ELSE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

#ifndef YYPUSH_MORE_DEFINED
# define YYPUSH_MORE_DEFINED
enum { YYPUSH_MORE = 4 };
#endif

typedef struct yypstate yypstate;


int yyparse (void);
int yypush_parse (yypstate *ps);
int yypull_parse (yypstate *ps);
yypstate *yypstate_new (void);
void yypstate_delete (yypstate *ps);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
