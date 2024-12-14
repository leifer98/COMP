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

%%
void                            { yylval = std::make_shared<ast::Type>(ast::BuiltInType::VOID); return VOID; }
int                             { yylval = std::make_shared<ast::Type>(ast::BuiltInType::INT); return INT; }
byte                            { yylval = std::make_shared<ast::Type>(ast::BuiltInType::BYTE); return BYTE; }
bool                            { yylval = std::make_shared<ast::Type>(ast::BuiltInType::BOOL); return BOOL; }
and                             { return AND; }
or                              { return OR; }
not                             { return NOT; }
true                            { yylval = std::make_shared<ast::Bool>(true); return TRUE; }
false                           { yylval = std::make_shared<ast::Bool>(false); return FALSE; }
return                          { return RETURN; }
if                              { return IF; }
else                            { return ELSE; }
while                           { return WHILE; }
break                           { yylval = std::make_shared<ast::Break>(); return BREAK; }
continue                        { yylval = std::make_shared<ast::Continue>(); return CONTINUE; }
;                               { return SC; }
,                               { return COMMA; }
\(                              { return LPAREN; }
\)                              { return RPAREN; }
\{                              { return LBRACE; }
\}                              { return RBRACE; }
=                               { return ASSIGN; }
[+]                             { return PLUS; }
[-]                             { return MINUS; }
[*]                             { return MULTIPLY; }
[/]                             { return DIVIDE; }
"=="                            { return EQ; }
"!="                            { return NE; }
[<]                             { yylval = std::make_shared<ast::RelOp>(nullptr, nullptr, ast::RelOpType::LT); return RELOP; }
[>]                             { yylval = std::make_shared<ast::RelOp>(nullptr, nullptr, ast::RelOpType::GT); return RELOP; }
"<="                            { yylval = std::make_shared<ast::RelOp>(nullptr, nullptr, ast::RelOpType::LE); return RELOP; }
">="                            { yylval = std::make_shared<ast::RelOp>(nullptr, nullptr, ast::RelOpType::GE); return RELOP; }
[a-zA-Z][a-zA-Z0-9]*            { yylval = std::make_shared<ast::ID>(yytext); return ID; }
(0|[1-9][0-9]*)                 { yylval = std::make_shared<ast::Num>(yytext); return NUM;}
(0b|[1-9][0-9]*b)               { yylval = std::make_shared<ast::NumB>(yytext); return NUM_B;}
\"([^\n\r\"\\]|\\[rnt\"\\])+\"  { yylval = std::make_shared<ast::String>(yytext); return STRING; }
{whitespace}                    { }
\/\/[^\r\n]*[\r|\n|\r\n]?       { }
.                               { return ERROR; }

