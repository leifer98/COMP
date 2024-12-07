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

// TODO: Place any additional declarations here
%}

// Configure Bison for better stack management

// TODO: Define tokens here
%token VOID INT BYTE BOOL TRUE FALSE IF RETURN WHILE BREAK CONTINUE SC COMMA ID NUM NUM_B STRING RELOP BINOP ERROR

// TODO: Define precedence and associativity here
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

// While reducing the start variable, set the root of the AST
Program:  Funcs { program = $1; }

// TODO: Define grammar here

Funcs: /* epsilon */ { $$ = nullptr; }
     | FuncDecl Funcs { $$ = $2; }; 

// Function Declaration
FuncDecl: RetType ID LPAREN Formals RPAREN LBRACE Statements RBRACE
         { $$ = nullptr; };

// Return Type
RetType: Type { $$ = nullptr; }
       | VOID { $$ = nullptr; };

// Formals
Formals: /* epsilon */ { $$ = nullptr; }
       | FormalList { $$ = nullptr; };

FormalList: FormalDecl { $$ = nullptr; }
          | FormalDecl COMMA FormalList { $$ = nullptr; };

FormalDecl: Type ID { $$ = nullptr; };

// Statements
Statements: Statement { $$ = nullptr; }
          | Statements Statement { $$ = nullptr; };

Statement: VariableDecl SC { $$ = nullptr; }
         | Expression SC { $$ = nullptr; }
         | Block { $$ = nullptr; }
         | IF LPAREN Expression RPAREN Statement { $$ = nullptr; }
         | IF LPAREN Expression RPAREN Statement ELSE Statement { $$ = nullptr; }
         | WHILE LPAREN Expression RPAREN Statement { $$ = nullptr; }
         | RETURN SC { $$ = nullptr; }
         | RETURN Expression SC { $$ = nullptr; };

// Variable Declaration
VariableDecl: Type ID { $$ = nullptr; }
            | Type ID ASSIGN Expression { $$ = nullptr; };

// Expression
Expression: LPAREN Expression RPAREN { $$ = nullptr; }
          | Expression BINOP Expression { $$ = nullptr; }
          | ID { $$ = nullptr; }
          | NUM { $$ = nullptr; }
          | NUM_B { $$ = nullptr; }
          | STRING { $$ = nullptr; }
          | TRUE { $$ = nullptr; }
          | FALSE { $$ = nullptr; };

// Type
Type: INT { $$ = nullptr; }
    | BYTE { $$ = nullptr; }
    | BOOL { $$ = nullptr; };

// Block
Block: LBRACE Statements RBRACE { $$ = nullptr; };

%%

// TODO: Place any additional code here
void yyerror(const char * message){
	output::errorSyn(yylineno);
	exit(0);
}