#ifndef SEMANTIC_HPP
#define SEMANTIC_HPP

#include <stack>
#include "visitor.hpp"
#include "nodes.hpp"
#include "output.hpp"

/* Symbol class
 * This class represents a symbol.
 */
class Symbol {
public:
    std::string name;
    ast::BuiltInType type;
    int offset;
    bool isFunction;

protected:
    Symbol(const std::string &name, ast::BuiltInType type, int offset, bool function);
};

/* VarSymbol class
 * This class represents a variable symbol.
 */
class VarSymbol : public Symbol {
public:
    VarSymbol(const std::string &name, ast::BuiltInType type, int offset);
};

/* FuncSymbol class
 * This class represents a function symbol.
 */
class FuncSymbol : public Symbol {
public:
    std::vector<ast::BuiltInType> paramTypes;

    FuncSymbol(const std::string &name, ast::BuiltInType type, int offset, const std::vector<ast::BuiltInType> &paramTypes);
};

/* ScopeSymbolTable class
 * This class represents a symbol table for a specific scope.
 */
class ScopeSymbolTable {
private:
    ScopeSymbolTable* parent;
    int offset;
    int paramOffset;
    std::vector<std::shared_ptr<Symbol>> scopeSymbols;
    

public:

    ScopeSymbolTable(ScopeSymbolTable *parentTable);

    int declareVar(const std::string &name, ast::BuiltInType type, bool isParam);

    void declareFunc(const std::string &name, ast::BuiltInType type, const std::vector<ast::BuiltInType> &paramTypes);

    std::shared_ptr<Symbol> lookup(const std::string &name);

    ScopeSymbolTable *getParent();

};

/* SymbolTable class
 * This class represents a full symbol table, containing all symbols.
 */
class SymbolTable {
private:
    output::ScopePrinter scopePrinter;
    std::stack<ScopeSymbolTable> scopesSymbolTables;

public:

    SymbolTable();

    void declareVar(const std::string &name, ast::BuiltInType type, bool isParam);

    void declareFunc(const std::string &name, ast::BuiltInType type, const std::vector<ast::BuiltInType> &paramTypes);

    std::shared_ptr<Symbol> lookup(const std::string &name);

    void startScope();

    void endScope();

    output::ScopePrinter &getScopePrinter();
};

/* SemanticVisitor class
 * This class is used to handle semantic meaning of nodes in the AST.
 */
class SemanticVisitor : public Visitor {
public:
    SymbolTable symTable;

    void visit(ast::Num &node) override;

    void visit(ast::NumB &node) override;

    void visit(ast::String &node) override;

    void visit(ast::Bool &node) override;

    void visit(ast::ID &node) override;

    void visit(ast::BinOp &node) override;

    void visit(ast::RelOp &node) override;

    void visit(ast::Not &node) override;

    void visit(ast::And &node) override;

    void visit(ast::Or &node) override;

    void visit(ast::Type &node) override;

    void visit(ast::Cast &node) override;

    void visit(ast::ExpList &node) override;

    void visit(ast::Call &node) override;

    void visit(ast::Statements &node) override;

    void visit(ast::Break &node) override;

    void visit(ast::Continue &node) override;

    void visit(ast::Return &node) override;

    void visit(ast::If &node) override;

    void visit(ast::While &node) override;

    void visit(ast::VarDecl &node) override;

    void visit(ast::Assign &node) override;

    void visit(ast::Formal &node) override;

    void visit(ast::Formals &node) override;

    void visit(ast::FuncDecl &node) override;

    void visit(ast::Funcs &node) override;
};

#endif //SEMANTIC_HP