#include <iostream>
#include "output.hpp"
#include "nodes.hpp"
#include "semantic.hpp"

#include "codegen.hpp"

// Extern from the bison-generated parser
extern int yyparse();

extern std::shared_ptr<ast::Node> program;

extern int yydebug;

int main()
{
    // Parse the input. The result is stored in the global variable `program`
    yyparse();
    
    SemanticVisitor sv;
    program->accept(sv);

    // std::cout << sv.symTable.getScopePrinter(); // print the output

    // Run code generation
    CodeGenVisitor codeGenVisitor;
    codeGenVisitor.generateCode(std::dynamic_pointer_cast<ast::Funcs>(program));
    codeGenVisitor.print();
    
}
