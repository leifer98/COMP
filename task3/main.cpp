#include <iostream>
#include "output.hpp"
#include "nodes.hpp"
#include "semantic.hpp"

// Extern from the bison-generated parser
extern int yyparse();

extern std::shared_ptr<ast::Node> program;

extern int yydebug;

int main()
{
    // Parse the input. The result is stored in the global variable `program`
    yyparse();

    // Print the AST using the PrintVisitor (for debug):
    //output::PrintVisitor printVisitor;
    //program->accept(printVisitor);

    SemanticVisitor sv;
    program->accept(sv);

    std::cout << sv.symTable.getScopePrinter(); // print the output
    
}
