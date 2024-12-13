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
void                            { yylval = std::make_shared<ast::Type>(ast::BuiltInType::VOID); return VOID; }
int                             { yylval = std::make_shared<ast::Type>(ast::BuiltInType::INT); return INT; }
byte                            { yylval = std::make_shared<ast::Type>(ast::BuiltInType::BYTE); return BYTE; }
bool                            { yylval = std::make_shared<ast::Type>(ast::BuiltInType::BOOL); return BOOL; }
and         return AND;
or          return OR;
not         return NOT;
true                            { yylval = std::make_shared<ast::Bool>(true); return TRUE; }
false                           { yylval = std::make_shared<ast::Bool>(false); return FALSE; }
return      return RETURN;
if          return IF;
else        return ELSE;
while       return WHILE;
break       return BREAK;
continue    return CONTINUE;
;                               { yylval = nullptr; return SC; }
,           return COMMA;
\(                              {return LPAREN;}
\)                              {return RPAREN;}
\{           return LBRACE;
\}           return RBRACE;
=           return ASSIGN;
[<>=!]=|>|< return RELOP;
[-+*/]      return BINOP;
[a-zA-Z][a-zA-Z0-9]*            { yylval = std::make_shared<ast::ID>(yytext); return ID; }
(0|[1-9][0-9]*)                 { yylval = std::make_shared<ast::Num>(yytext); return NUM;}
(0b[0-1]+|[1-9][0-9]*b)         { yylval = std::make_shared<ast::NumB>(yytext); return NUM_B;}
"([^\"\n\r\\]|\\[rnt\"\\])*"    { yylval = std::make_shared<ast::Type>(ast::BuiltInType::STRING); return STRING; }
[\t\n\r ] ;
.          return ERROR;

