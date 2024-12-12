%{
    #include "output.hpp"
    #include "parser.tab.h"
    #include "nodes.hpp"
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
void        { printf("hello world !!! 1\n"); yylval = std::make_shared<ast::Type>(ast::BuiltInType::VOID); return VOID; }
int         return INT;
byte        return BYTE;
bool        return BOOL;
and         return AND;
or          return OR;
not         return NOT;
true        return TRUE;
false       return FALSE;
return      return RETURN;
if          return IF;
else        return ELSE;
while       return WHILE;
break       return BREAK;
continue    return CONTINUE;
;           return SC;
,           return COMMA;
\(           {printf("check 1\n"); return LPAREN;}
\)           {printf("check 2\n"); return RPAREN;}
\{           return LBRACE;
\}           return RBRACE;
=           return ASSIGN;
[<>=!]=|>|< return RELOP;
[-+*/]      return BINOP;
[a-zA-Z][a-zA-Z0-9]* { printf("hello world !!! 2\n"); yylval = std::make_shared<ast::ID>(yytext); return ID; }
(0|[1-9][0-9]*)      return NUM;
(0b|[1-9][0-9]*b)    return NUM_B;
"([^\"\n\r\\]|\\[rnt\"\\])*" { return STRING; }
[\t\n\r ] ; /* Ignore whitespace */
.          return ERROR;

