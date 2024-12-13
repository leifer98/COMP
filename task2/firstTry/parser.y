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
Funcs: /* epsilon */ { $$ = std::make_shared<ast::Funcs>(); }
     | FuncDecl Funcs { 
        $$ = std::make_shared<ast::Funcs>(std::dynamic_pointer_cast<ast::FuncDecl>($1)); };

// 4. 𝐹𝑢𝑛𝑐𝐷𝑒𝑐𝑙 → 𝑅𝑒𝑡𝑇𝑦𝑝𝑒 𝐼𝐷 𝐿𝑃𝐴𝐑𝐸𝑁 𝐹𝑜𝑟𝑚𝑎𝑙𝑠 𝑅𝑃𝐴𝐸𝑁 𝐿𝐵𝑅𝐴𝐶𝐸 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡𝑠 𝑅𝐵𝑅𝐴𝐶𝐸
FuncDecl: VOID ID LPAREN Formals RPAREN LBRACE Statements RBRACE { 
        $$ = std::make_shared<ast::FuncDecl>(
        std::dynamic_pointer_cast<ast::ID>($2), 
        std::dynamic_pointer_cast<ast::Type>($1), 
        std::dynamic_pointer_cast<ast::Formals>($4), 
        std::dynamic_pointer_cast<ast::Statements>($7)); };

// 5. 𝑅𝑒𝑡𝑇𝑦𝑝𝑒 → 𝑇𝑦𝑝𝑒
// 6. 𝑅𝑒𝑡𝑇𝑦𝑝𝑒 → 𝑉𝑂𝐼𝐷

// 7. 𝐹𝑜𝑟𝑚𝑎𝑙𝑠 → 𝜖
Formals: /* epsilon */ { $$ = std::make_shared<ast::Formals>(); };

// 12. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡𝑠 → 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡
// 13. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡𝑠 → 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡𝑠 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡
Statements: /* epsilon */ { 
        $$ = std::make_shared<ast::Statements>(); 
    }
    | Statements Statement { 
        auto stmts = std::dynamic_pointer_cast<ast::Statements>($1);
        stmts->push_back(std::dynamic_pointer_cast<ast::Statement>($2));
        $$ = stmts; 
    };  

// 15. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝑇𝑦𝑝𝑒 𝐼𝐷 𝑆𝐶
// 16. 𝑆𝑡𝑎𝑡𝑒𝑚𝑒𝑛𝑡 → 𝑇𝑦𝑝𝑒 𝐼𝐷 𝐴𝑆𝑆𝐼𝐺𝑁 𝐸𝑥𝑝 𝑆𝐶
Statement: Type ID SC { 
        $$ = std::make_shared<ast::VarDecl>(
        std::dynamic_pointer_cast<ast::ID>($2), // Variable name
        std::dynamic_pointer_cast<ast::Type>($1) // Variable type
    );}
    | Type ID ASSIGN Exp SC { 
        $$ = std::make_shared<ast::VarDecl>(
        std::dynamic_pointer_cast<ast::ID>($2), // Variable name
        std::dynamic_pointer_cast<ast::Type>($1), // Variable type
        std::dynamic_pointer_cast<ast::Exp>($4) // Initial value
    );
};

// 33. 𝐿𝑃𝐴𝑅𝐸𝑁 𝐸𝑥𝑝 𝑅𝑃𝐴𝑅𝐸𝑁
// 34. Exp BINOP Exp
// 35. ID
// 37. 𝐸𝑥𝑝 → 𝑁𝑈𝑀
// 38. 𝐸𝑥𝑝 → 𝑁𝑈𝑀 𝐵
// 39. 𝐸𝑥𝑝 → 𝑆𝑇𝑅𝐼𝑁𝐺
// 40. 𝐸𝑥𝑝 → 𝑇𝑅𝑈𝐸
// 41. 𝐸𝑥𝑝 → 𝐹𝐴𝐿𝑆E
// 45. 𝐸𝑥𝑝 → 𝐸𝑥𝑝 𝑅𝐸𝐿𝑂𝑃 𝐸𝑥p
Exp: LPAREN Exp RPAREN { $$ = $2; } 
   | Exp BINOP Exp {
        auto binop = std::dynamic_pointer_cast<ast::BinOp>($2); // Extract the BinOp object
        $$ = std::make_shared<ast::BinOp>(
            std::dynamic_pointer_cast<ast::Exp>($1), // Left operand
            std::dynamic_pointer_cast<ast::Exp>($3), // Right operand
            binop->op // Extract the operation type
        );    }
   | ID { $$ = std::dynamic_pointer_cast<ast::ID>($1); }; 
   | NUM    { $$ = std::dynamic_pointer_cast<ast::Num>($1); } 
   | NUM_B  { $$ = std::dynamic_pointer_cast<ast::NumB>($1); }    
   | STRING { $$ = std::dynamic_pointer_cast<ast::String>($1); }        
   | TRUE   { $$ = std::dynamic_pointer_cast<ast::Bool>($1); }          
   | FALSE  { $$ = std::dynamic_pointer_cast<ast::Bool>($1); }    
   | Exp RELOP Exp {
        auto relop = std::dynamic_pointer_cast<ast::RelOp>($2); // Extract the BinOp object
        $$ = std::make_shared<ast::RelOp>(
            std::dynamic_pointer_cast<ast::Exp>($1), // Left operand
            std::dynamic_pointer_cast<ast::Exp>($3), // Right operand
            relop->op // Extract the operation type
        );    };

// 30. 𝑇𝑦𝑝𝑒 → 𝐼𝑁𝑇
// 31. 𝑇𝑦𝑝𝑒 → 𝐵𝑌𝑇𝐸
// 32. 𝑇𝑦𝑝𝑒 → 𝐵𝑂𝑂𝐿
Type: INT { 
    $$ = std::make_shared<ast::Type>(ast::BuiltInType::INT); // Integer type
}
   | BYTE { 
    $$ = std::make_shared<ast::Type>(ast::BuiltInType::BYTE); // Byte type
}
   | BOOL { 
    $$ = std::make_shared<ast::Type>(ast::BuiltInType::BOOL); // Boolean type
};

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