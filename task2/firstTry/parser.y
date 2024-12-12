%{

#include "nodes.hpp"
#include "output.hpp"
#include <memory>

// Bison declarations
extern int yylineno;
extern int yylex();

void yyerror(const char*);

// Root of the AST, set by the parser and used by other parts of the compiler
std::shared_ptr<ast::Node> program;

using namespace std;

%}

// Configure Bison for better stack management
%define api.value.type {std::shared_ptr<ast::Node>}
%define parse.error verbose

// Tokens
%token VOID INT BYTE BOOL TRUE FALSE IF RETURN WHILE BREAK CONTINUE SC COMMA ID NUM NUM_B STRING RELOP BINOP ERROR

// Precedence and associativity
%right ASSIGN
%left OR
%left AND
%left RELOP
%left ADD_SUB
%left MULT_DIV
%right NOT
%left LPAREN RPAREN LBRACE RBRACE
%right ELSE

%%

// Grammar Rules
Program: Funcs { program = $1; };

Funcs: /* epsilon */ { $$ = std::make_shared<ast::Funcs>(); }
     | FuncDecl Funcs { $$ = std::make_shared<ast::Funcs>(); };

FuncDecl: VOID ID LPAREN Formals RPAREN LBRACE Statements RBRACE { $$ = nullptr; };

Formals: /* epsilon */ { $$ = std::make_shared<ast::Formals>(); };

Statements: /* epsilon */ { $$ = std::make_shared<ast::Statements>(); };

%%

// Error Handling
void yyerror(const char * message) {
    output::errorSyn(yylineno);
    exit(0);
}
