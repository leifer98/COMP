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
%define parse.error verbose

// Tokens
%token VOID INT BYTE BOOL TRUE FALSE IF RETURN WHILE BREAK CONTINUE SC COMMA ID NUM NUM_B BINOP RELOP STRING ERROR

// Precedence and associativity
%left RELOP
%left BINOP
%right ASSIGN
%left OR
%left AND
%left ADD_SUB //for future use maybe
%left MULT_DIV //for future use maybe
%right NOT
%left LPAREN RPAREN LBRACE RBRACE
%right ELSE

%%

// Grammar Rules

// 1. 𝑃𝑟𝑜𝑔𝑟𝑎𝑚 → 𝐹𝑢𝑛𝑐𝑠
Program: Funcs { program = $1; };

// 2. 𝐹𝑢𝑛𝑐𝑠 → 𝜖
// 3. 𝐹𝑢𝑛𝑐𝑠 → 𝐹𝑢𝑛𝑐𝐷𝑒𝑐𝑙 𝐹𝑢𝑛𝑐𝑠
Funcs:      /* epsilon */ { $$ = std::make_shared<ast::Funcs>(); }
            | FuncDecl Funcs { 
                auto funcs = std::dynamic_pointer_cast<ast::Funcs>($2);
                funcs->push_front(std::dynamic_pointer_cast<ast::FuncDecl>($1));
                $$ = funcs; 
            };

// 4. 𝐹𝑢𝑛𝑐𝐷𝑒𝑐𝑙 → 𝑅𝑒𝑡𝑇𝑦𝑝𝑒 𝐼𝐷 𝐿𝑃𝐴𝑅𝐸𝑁 𝐹𝑜𝑟𝑚𝑎𝑙𝑠 𝑅𝑃𝐴𝑅𝐸𝑁 𝐿𝐵𝑅𝐴𝐶𝐸 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡𝑠 𝑅𝐵𝑅𝐴𝐶𝐸
FuncDecl:   RetType ID LPAREN Formals RPAREN LBRACE Statements RBRACE { 
                $$ = std::make_shared<ast::FuncDecl>(
                std::dynamic_pointer_cast<ast::ID>($2), 
                std::dynamic_pointer_cast<ast::Type>($1), 
                std::dynamic_pointer_cast<ast::Formals>($4), 
                std::dynamic_pointer_cast<ast::Statements>($7)
                );
            };

// 5. 𝑅𝑒𝑡𝑇𝑦𝑝𝑒 → 𝑇𝑦𝑝𝑒
// 6. 𝑅𝑒𝑡𝑇𝑦𝑝𝑒 → 𝑉𝑂𝐼𝐷
RetType:    Type { $$ = std::dynamic_pointer_cast<ast::Type>($1); }
            | VOID { $$ = std::dynamic_pointer_cast<ast::Type>($1); };

// 7. 𝐹𝑜𝑟𝑚𝑎𝑙𝑠 → 𝜖
Formals:    /* epsilon */ { $$ = std::make_shared<ast::Formals>(); };

// 12. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡𝑠 → 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡
// 13. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡𝑠 → 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡𝑠 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡
Statements: Statement { 
                $$ = std::make_shared<ast::Statements>(std::dynamic_pointer_cast<ast::Statement>($1));
            }
            | Statements Statement { 
                auto stmts = std::dynamic_pointer_cast<ast::Statements>($1);
                stmts->push_back(std::dynamic_pointer_cast<ast::Statement>($2));
                $$ = stmts; 
            };  

// 14. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝐿𝐵𝑅𝐴𝐶𝐸 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡𝑠 𝑅𝐵𝑅𝐴𝐶𝐸
// 15. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝑇𝑦𝑝𝑒 𝐼𝐷 𝑆𝐶
// 16. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝑇𝑦𝑝𝑒 𝐼𝐷 𝐴𝑆𝑆𝐼𝐺𝑁 𝐸𝑥𝑝 𝑆𝐶
// 17. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝐼𝐷 𝐴𝑆𝑆𝐼𝐺𝑁 𝐸𝑥𝑝 𝑆𝐶
// 18. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝐶𝑎𝑙𝑙 𝑆𝐶
// 19. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝑅𝐸𝑇𝑈𝑅𝑁 𝑆𝐶
// 20. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝑅𝐸𝑇𝑈𝑅𝑁 𝐸𝑥𝑝 𝑆𝐶
// 21. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝐼𝐹 𝐿𝑃𝐴𝑅𝐸𝑁 𝐸𝑥𝑝 𝑅𝑃𝐴𝑅𝐸𝑁 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡
// 22. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝐼𝐹 𝐿𝑃𝐴𝑅𝐸𝑁 𝐸𝑥𝑝 𝑅𝑃𝐴𝑅𝐸𝑁 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 𝐸𝐿𝑆𝐸 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡
// 23. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝑊𝐻𝐼𝐿𝐸 𝐿𝑃𝐴𝑅𝐸𝑁 𝐸𝑥𝑝 𝑅𝑃𝐴𝑅𝐸𝑁 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡
// 24. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝐵𝑅𝐸𝐴𝐾 𝑆𝐶
// 25. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝐶𝑂𝑁𝑇𝐼𝑁𝑈𝐸 𝑆𝐶
Statement:  LBRACE Statements RBRACE {
                $$ = std::dynamic_pointer_cast<ast::Statements>($2);
            } 
            | Type ID SC { 
                $$ = std::make_shared<ast::VarDecl>(
                    std::dynamic_pointer_cast<ast::ID>($2), // Variable name
                    std::dynamic_pointer_cast<ast::Type>($1) // Variable type
                );
            }
            | Type ID ASSIGN Exp SC { 
                $$ = std::make_shared<ast::VarDecl>(
                    std::dynamic_pointer_cast<ast::ID>($2), // Variable name
                    std::dynamic_pointer_cast<ast::Type>($1), // Variable type
                    std::dynamic_pointer_cast<ast::Exp>($4) // Initial value
                );
            }
            | ID ASSIGN Exp SC {
                $$ = std::make_shared<ast::Assign>(
                    std::dynamic_pointer_cast<ast::ID>($1), // Variable name
                    std::dynamic_pointer_cast<ast::Exp>($3) // Initial value
                );
            }
            | Call SC {
                $$ = std::dynamic_pointer_cast<ast::Call>($1);
            }
            | RETURN SC {
                $$ = std::make_shared<ast::Return>();
            }
            | RETURN Exp SC {
                $$ = std::make_shared<ast::Return>(
                    std::dynamic_pointer_cast<ast::Exp>($2)
                );
            }
            | IF LPAREN Exp RPAREN Statement {
                $$ = std::make_shared<ast::If>(
                    std::dynamic_pointer_cast<ast::Exp>($3), // Condition
                    std::dynamic_pointer_cast<ast::Statement>($5) // Body
                );
            }
            | IF LPAREN Exp RPAREN Statement ELSE Statement {
                $$ = std::make_shared<ast::If>(
                    std::dynamic_pointer_cast<ast::Exp>($3), // Condition
                    std::dynamic_pointer_cast<ast::Statement>($5), // Body
                    std::dynamic_pointer_cast<ast::Statement>($7) // Else body
                );
            }
            | WHILE LPAREN Exp RPAREN Statement {
                $$ = std::make_shared<ast::While>(
                    std::dynamic_pointer_cast<ast::Exp>($3), // Condition
                    std::dynamic_pointer_cast<ast::Statement>($5) // Body
                );
            }
            | BREAK SC {
                $$ = std::dynamic_pointer_cast<ast::Break>($1);
            }
            | CONTINUE SC {
                $$ = std::dynamic_pointer_cast<ast::Continue>($1);
            };

// 26. 𝐶𝑎𝑙𝑙 → 𝐼𝐷 𝐿𝑃𝐴𝑅𝐸𝑁 𝐸𝑥𝑝𝐿𝑖𝑠𝑡 𝑅𝑃𝐴𝑅𝐸𝑁
// 27. 𝐶𝑎𝑙𝑙 → 𝐼𝐷 𝐿𝑃𝐴𝑅𝐸𝑁 𝑅𝑃𝐴𝑅𝐸𝑁
Call:       ID LPAREN ExpList RPAREN {
                $$ = std::make_shared<ast::Call>(
                    std::dynamic_pointer_cast<ast::ID>($1), // Function name
                    std::dynamic_pointer_cast<ast::ExpList>($3) // Arguments
                );
            }
            | ID LPAREN RPAREN {
                $$ = std::make_shared<ast::Call>(
                    std::dynamic_pointer_cast<ast::ID>($1), // Function name
                    std::make_shared<ast::ExpList>() // Arguments
                );
            };

// 28. 𝐸𝑥𝑝𝐿𝑖𝑠𝑡 → 𝐸𝑥𝑝
// 29. 𝐸𝑥𝑝𝐿𝑖𝑠𝑡 → 𝐸𝑥𝑝 𝐶𝑂𝑀𝑀𝐴 𝐸𝑥𝑝𝐿𝑖𝑠𝑡
ExpList:    Exp {
                $$ = std::make_shared<ast::ExpList>(
                    std::dynamic_pointer_cast<ast::Exp>($1)
                );
            }
            | Exp COMMA ExpList {
                auto expList = std::dynamic_pointer_cast<ast::ExpList>($3);
                expList->push_front(std::dynamic_pointer_cast<ast::Exp>($1));
                $$ = expList; 
            };

// 33. 𝐿𝑃𝐴𝑅𝐸𝑁 𝐸𝑥𝑝 𝑅𝑃𝐴𝑅𝐸𝑁
// 34. Exp BINOP Exp
// 35. ID
// 37. 𝐸𝑥𝑝 → 𝑁𝑈𝑀
// 38. 𝐸𝑥𝑝 → 𝑁𝑈𝑀 𝐵
// 39. 𝐸𝑥𝑝 → 𝑆𝑇𝑅𝐼𝑁𝐺
// 40. 𝐸𝑥𝑝 → 𝑇𝑅𝑈𝐸
// 41. 𝐸𝑥𝑝 → 𝐹𝐴𝐿𝑆E
// 42. 𝐸𝑥𝑝 → 𝑁𝑂𝑇 𝐸𝑥𝑝
// 43. 𝐸𝑥𝑝 → 𝐸𝑥𝑝 𝐴𝑁𝐷 𝐸𝑥𝑝
// 44. 𝐸𝑥𝑝 → 𝐸𝑥𝑝 𝑂𝑅 𝐸𝑥𝑝
// 45. 𝐸𝑥𝑝 → 𝐸𝑥𝑝 𝑅𝐸𝐿𝑂𝑃 𝐸𝑥p
Exp:        LPAREN Exp RPAREN { $$ = $2; }
            | Exp BINOP Exp {
                auto binop = std::dynamic_pointer_cast<ast::BinOp>($2); // Extract the BinOp object
                $$ = std::make_shared<ast::BinOp>(
                    std::dynamic_pointer_cast<ast::Exp>($1), // Left operand
                    std::dynamic_pointer_cast<ast::Exp>($3), // Right operand
                    binop->op // Extract the operation type
                );
            }
            | ID { $$ = std::dynamic_pointer_cast<ast::ID>($1); }
            | NUM { $$ = std::dynamic_pointer_cast<ast::Num>($1); }
            | NUM_B { $$ = std::dynamic_pointer_cast<ast::NumB>($1); }
            | STRING { $$ = std::dynamic_pointer_cast<ast::String>($1); }
            | TRUE { $$ = std::dynamic_pointer_cast<ast::Bool>($1); }
            | FALSE { $$ = std::dynamic_pointer_cast<ast::Bool>($1); }
            | NOT Exp {
                $$ = std::make_shared<ast::Not>(
                    std::dynamic_pointer_cast<ast::Exp>($2)
                );
            }
            | Exp AND Exp {
                $$ = std::make_shared<ast::And>(
                    std::dynamic_pointer_cast<ast::Exp>($1),
                    std::dynamic_pointer_cast<ast::Exp>($3)
                );
            }
            | Exp OR Exp {
                $$ = std::make_shared<ast::Or>(
                    std::dynamic_pointer_cast<ast::Exp>($1),
                    std::dynamic_pointer_cast<ast::Exp>($3)
                );
            }
            | Exp RELOP Exp {
                auto relop = std::dynamic_pointer_cast<ast::RelOp>($2); // Extract the BinOp object
                $$ = std::make_shared<ast::RelOp>(
                    std::dynamic_pointer_cast<ast::Exp>($1), // Left operand
                    std::dynamic_pointer_cast<ast::Exp>($3), // Right operand
                    relop->op // Extract the operation type
                );
            };

// 30. 𝑇𝑦𝑝𝑒 → 𝐼𝑁𝑇
// 31. 𝑇𝑦𝑝𝑒 → 𝐵𝑌𝑇𝐸
// 32. 𝑇𝑦𝑝𝑒 → 𝐵𝑂𝑂𝐿
Type: INT { $$ = std::dynamic_pointer_cast<ast::Type>($1); }
    | BYTE { $$ = std::dynamic_pointer_cast<ast::Type>($1); }
    | BOOL { $$ = std::dynamic_pointer_cast<ast::Type>($1); };

// Other rules to be implemented later as needed
// 8. 𝐹𝑜𝑟𝑚𝑎𝑙𝑠 → 𝐹𝑜𝑟𝑚𝑎𝑙𝑠𝐿𝑖𝑠𝑡
// 9. 𝐹𝑜𝑟𝑚𝑎𝑙𝑠𝐿𝑖𝑠𝑡 → 𝐹𝑜𝑟𝑚𝑎𝑙𝐷𝑒𝑐𝑙
// 10. 𝐹𝑜𝑟𝑚𝑎𝑙𝑠𝐿𝑖𝑠𝑡 → 𝐹𝑜𝑟𝑚𝑎𝑙𝐷𝑒𝑐𝑙 𝐶𝑂𝑀𝑀𝐴 𝐹𝑜𝑟𝑚𝑎𝑙𝑠𝐿𝑖𝑠𝑡
// ...

%%

// Error Handling
void yyerror(const char * message) {
    output::errorSyn(yylineno);
    exit(0);
}