%{
    #include "output.hpp"
    #include "parser.tab.h"

%}

%option yylineno
%option noyywrap

digit            ([0-9])
letter           ([a-zA-Z])
letterdigit      ([a-zA-Z0-9])
whitespace       ([\t\n\r ])
relop            ([<>=!]=|>|<)
binop            ([-+*/])
id               ([a-z][a-z0-9]*)
num              (0|[1-9][0-9]*)
num_b            (0b|[1-9][0-9]*b)
string           ("([^"\n\r\\]|\\[rnt\"\\])*")

%%
VOID                                                                                return VOID;
INT                                                                                 return INT;
BYTE                                                                                return BYTE;
BOOL                                                                                return BOOL;
AND                                                                                 return AND;
OR                                                                                  return OR;
NOT                                                                                 return NOT;
TRUE                                                                                return TRUE;
FALSE                                                                               return FALSE;
RETURN                                                                              return RETURN;
IF                                                                                  return IF;
ELSE                                                                                return ELSE;
WHILE                                                                               return WHILE;
BREAK                                                                               return BREAK;
CONTINUE                                                                            return CONTINUE;
SC                                                                                  return SC;
COMMA                                                                               return COMMA;
LPAREN                                                                              return LPAREN;
RPAREN                                                                              return RPAREN;
LBRACE                                                                              return LBRACE;
RBRACE                                                                              return RBRACE;
ASSIGN                                                                              return ASSIGN;
[<>=!]=|>|<                                                                         return RELOP;
[-+*/]                                                                              return BINOP;
[a-zA-Z][a-zA-Z0-9]*                                                                return ID;
(0|[1-9][0-9]*)                                                                     return NUM;
(0b|[1-9][0-9]*b)                                                                   return NUM_B;
"([^\"\n\r\\]|\\[rnt\"\\])*"                                                        return STRING;
[\t\n\r ]                                                                           ; /* Ignore whitespace */
.                                                                                   return ERROR;
