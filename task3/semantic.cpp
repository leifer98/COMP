#include "semantic.hpp"
#include <iostream>

/* Helpful functions */

bool isNumeric(ast::BuiltInType type) {
    return (type == ast::BuiltInType::INT || type == ast::BuiltInType::BYTE);
}

bool isValidAssignment(ast::BuiltInType destType, ast::BuiltInType expType) {
    return (destType == expType || (destType == ast::BuiltInType::INT && expType == ast::BuiltInType::BYTE));
}

std::string toString(ast::BuiltInType type) {
    switch (type) {
        case ast::BuiltInType::INT:
            return "INT";
        case ast::BuiltInType::BOOL:
            return "BOOL";
        case ast::BuiltInType::BYTE:
            return "BYTE";
        case ast::BuiltInType::VOID:
            return "VOID";
        case ast::BuiltInType::STRING:
            return "STRING";
        default:
            return "UNKNOWN";
    }
}


/* Symbol Class */

Symbol::Symbol(const std::string &name, ast::BuiltInType type, int offset, bool function)
    : name(name), type(type), offset(offset), isFunction(function) {}


/* VarSymbol Class */

VarSymbol::VarSymbol(const std::string &name, ast::BuiltInType type, int offset)
    : Symbol(name, type, offset, false) {}


/* FuncSymbol Class */

FuncSymbol::FuncSymbol(const std::string &name, ast::BuiltInType type, int offset, const std::vector<ast::BuiltInType> &paramTypes)
    : Symbol(name, type, offset, true), paramTypes(paramTypes) {}


/* ScopeSymbolTable Class */

ScopeSymbolTable::ScopeSymbolTable(ScopeSymbolTable *parentTable) : parent(parentTable) {
    if (parent) {
        offset = parent->offset;
    } else {
        offset = 0;
    }
}

int ScopeSymbolTable::declareVar(const std::string &name, ast::BuiltInType type, bool isParam) {
    if (isParam) {
        paramOffset--;

        std::shared_ptr<VarSymbol> symbolPointer(new VarSymbol(name, type, paramOffset));
        scopeSymbols.push_back(symbolPointer);

        return paramOffset;
    } else {
        std::shared_ptr<VarSymbol> symbolPointer(new VarSymbol(name, type, offset));
        scopeSymbols.push_back(symbolPointer);
        offset++;

        return offset - 1;
    }
}

void ScopeSymbolTable::declareFunc(const std::string &name, ast::BuiltInType type, const std::vector<ast::BuiltInType> &paramTypes) {
    std::shared_ptr<FuncSymbol> symbolPointer(new FuncSymbol(name, type, offset, paramTypes));
    scopeSymbols.push_back(symbolPointer);
}

std::shared_ptr<Symbol> ScopeSymbolTable::lookup(const std::string &name) {
    for (std::shared_ptr<Symbol> &symbolPointer : scopeSymbols) {
        if (symbolPointer->name == name) {
            return symbolPointer;
        }
    }

    return std::shared_ptr<Symbol>(nullptr);
}

ScopeSymbolTable *ScopeSymbolTable::getParent() {
    return parent;
}


/* SymbolTable Class */

SymbolTable::SymbolTable() : scopePrinter() {
    ScopeSymbolTable globalScope(nullptr);
    scopesSymbolTables.push(globalScope);

    declareFunc("print", ast::BuiltInType::VOID, {ast::BuiltInType::STRING});
    declareFunc("printi", ast::BuiltInType::VOID, {ast::BuiltInType::INT});
}

void SymbolTable::declareVar(const std::string &name, ast::BuiltInType type, bool isParam) {
    int varOffset = scopesSymbolTables.top().declareVar(name, type, isParam);

    scopePrinter.emitVar(name, type, varOffset);
}

void SymbolTable::declareFunc(const std::string &name, ast::BuiltInType type, const std::vector<ast::BuiltInType> &paramTypes) {
    scopesSymbolTables.top().declareFunc(name, type, paramTypes);

    scopePrinter.emitFunc(name, type, paramTypes);
}

std::shared_ptr<Symbol> SymbolTable::lookup(const std::string &name) {
    ScopeSymbolTable* currentScope = &scopesSymbolTables.top();

    while (currentScope) {
        std::shared_ptr<Symbol> symbol = currentScope->lookup(name);
        if (symbol) {
            return symbol;
        }
        currentScope = currentScope->getParent();
    }

    return std::shared_ptr<Symbol>(nullptr);
}

void SymbolTable::startScope() {
    ScopeSymbolTable newScope(&scopesSymbolTables.top());
    scopesSymbolTables.push(newScope);

    scopePrinter.beginScope();
}

void SymbolTable::endScope() {
    scopesSymbolTables.pop();

    scopePrinter.endScope();
}

output::ScopePrinter& SymbolTable::getScopePrinter() {
    return scopePrinter;
}


/* SemanticVisitor implementation */

void SemanticVisitor::visit(ast::Num &node) {
    
    node.type = ast::BuiltInType::INT;
}

void SemanticVisitor::visit(ast::NumB &node) {
    
    node.type = ast::BuiltInType::BYTE;
}

void SemanticVisitor::visit(ast::String &node) {
    
    node.type = ast::BuiltInType::STRING;
}

void SemanticVisitor::visit(ast::Bool &node) {
    
    node.type = ast::BuiltInType::BOOL;
}

void SemanticVisitor::visit(ast::ID &node) {

    std::shared_ptr<Symbol> symbol = symTable.lookup(node.value);

    if (symbol) {  // The identifier exists
        if (node.idType == ast::IdType::VAR_USAGE) {
            if (symbol->isFunction) {
                output::errorDefAsFunc(node.line, node.value);
            } else {
                node.type = symbol->type;
            }
        } else if (node.idType == ast::IdType::FUNC_CALL) {
            if (symbol->isFunction) {
                node.type = symbol->type;
            } else {
                output::errorDefAsVar(node.line, node.value);
            }
        } else if (node.idType == ast::IdType::VAR_DECLARATION || node.idType == ast::IdType::FUNC_DECLARATION) {
            output::errorDef(node.line, node.value);
        }
    } else {
        if (node.idType != ast::IdType::VAR_DECLARATION && node.idType != ast::IdType::FUNC_DECLARATION) {
            if (node.idType == ast::IdType::FUNC_CALL) {
                output::errorUndefFunc(node.line, node.value);
            } else {
                output::errorUndef(node.line, node.value);
            }
        }
    }
    
}

void SemanticVisitor::visit(ast::BinOp &node) {

    node.left->accept(*this);
    node.right->accept(*this);

    if (isNumeric(node.left->type) && isNumeric(node.right->type)) {
        // Choose the expression type to be the type of the two which has larger range of expression
        // (int is larger than byte so choose it if it exists in the expression)
        if (node.left->type == ast::BuiltInType::INT || node.right->type == ast::BuiltInType::INT) {
            node.type = ast::BuiltInType::INT;
        } else {
            node.type = ast::BuiltInType::BYTE;
        }
    } else {
        output::errorMismatch(node.line);
    }
}

void SemanticVisitor::visit(ast::RelOp &node) {

    node.left->accept(*this);
    node.right->accept(*this);

    // Type check:
    if (isNumeric(node.left->type) && isNumeric(node.right->type)) {
        node.type = ast::BuiltInType::BOOL;
    } else {
        output::errorMismatch(node.line);
    }
}

void SemanticVisitor::visit(ast::Type &node) {
    
}

void SemanticVisitor::visit(ast::Cast &node) {
    node.target_type->accept(*this);

    node.exp->accept(*this);

    if (isNumeric(node.target_type->type) && isNumeric(node.exp->type)) {
        node.type = node.target_type->type;
    } else {
        output::errorMismatch(node.line);
    }
}

void SemanticVisitor::visit(ast::Not &node) {

    node.exp->accept(*this);

    if (node.exp->type == ast::BuiltInType::BOOL) {
        node.type = ast::BuiltInType::BOOL;
    } else {
        output::errorMismatch(node.line);
    }
}

void SemanticVisitor::visit(ast::And &node) {
    
    node.left->accept(*this);
    node.right->accept(*this);

    if (node.left->type == ast::BuiltInType::BOOL && node.right->type == ast::BuiltInType::BOOL) {
        node.type = ast::BuiltInType::BOOL;
    } else {
        output::errorMismatch(node.line);
    }
}

void SemanticVisitor::visit(ast::Or &node) {

    node.left->accept(*this);
    node.right->accept(*this);

    if (node.left->type == ast::BuiltInType::BOOL && node.right->type == ast::BuiltInType::BOOL) {
        node.type = ast::BuiltInType::BOOL;
    } else {
        output::errorMismatch(node.line);
    }
}

void SemanticVisitor::visit(ast::ExpList &node) {

    for (std::shared_ptr<ast::Exp> exp: node.exps) {
        exp->accept(*this);
    }
}

void SemanticVisitor::visit(ast::Call &node) {

    node.args->accept(*this);

    node.func_id->idType = ast::IdType::FUNC_CALL;
    node.func_id->accept(*this);

    node.type = node.func_id->type;

    std::shared_ptr<Symbol> symbol = symTable.lookup(node.func_id->value);
    if (symbol) {
        std::shared_ptr<FuncSymbol> funcSymbol = std::dynamic_pointer_cast<FuncSymbol>(symbol);
        if (funcSymbol) {
            // Get expected types as string:
            std::vector<std::string> expectedTypes;
            for (ast::BuiltInType &type : funcSymbol->paramTypes) {
                expectedTypes.push_back(toString(type));
            }

            // Check for correct match between expected param types and the call's param types: 
            if (funcSymbol->paramTypes.size() != node.args->exps.size()) {
                output::errorPrototypeMismatch(node.line, node.func_id->value, expectedTypes);
            } else {
                for (int i=0; i<funcSymbol->paramTypes.size(); i++) {
                    if (!isValidAssignment(funcSymbol->paramTypes[i], node.args->exps[i]->type)) {
                        output::errorPrototypeMismatch(node.line, node.func_id->value, expectedTypes);
                    }
                }
            }
        }
    }
}

void SemanticVisitor::visit(ast::Statements &node) {

    // Open scope for all blocks except function bodies (functions need to include params in their scope):
    if (!node.isFuncBody) {
        symTable.startScope();
    }
    
    // Visit all statements:
    for (std::shared_ptr<ast::Statement> statement: node.statements) {
        statement->isInWhile = node.isInWhile;
        statement->accept(*this);
    }

    // Close scope for all blocks except function bodies:
    if (!node.isFuncBody) {
        symTable.endScope();
    }
}

void SemanticVisitor::visit(ast::Break &node) {

    if (!node.isInWhile) {
        output::errorUnexpectedBreak(node.line);
    }
}

void SemanticVisitor::visit(ast::Continue &node) {

    if (!node.isInWhile) {
        output::errorUnexpectedContinue(node.line);
    }
}

void SemanticVisitor::visit(ast::Return &node) {
    if (node.exp) {
        node.exp->accept(*this);
    }
}

void SemanticVisitor::visit(ast::If &node) {
    
    node.condition->accept(*this);

    symTable.startScope();
    node.then->isInWhile = node.isInWhile;
    node.then->accept(*this);
    symTable.endScope();

    if (node.otherwise) {
        symTable.startScope();
        node.otherwise->isInWhile = node.isInWhile;
        node.otherwise->accept(*this);
        symTable.endScope();
    }
    
    // Type checking:
    if (node.condition->type != ast::BuiltInType::BOOL) {
        output::errorMismatch(node.condition->line);
    }
}

void SemanticVisitor::visit(ast::While &node) {

    node.condition->accept(*this);

    symTable.startScope();
    node.body->isInWhile = true;
    node.body->accept(*this);
    symTable.endScope();

    // Type checking:
    if (node.condition->type != ast::BuiltInType::BOOL) {
        output::errorMismatch(node.condition->line);
    }
}

void SemanticVisitor::visit(ast::VarDecl &node) {

    node.type->accept(*this);
    if (node.init_exp) {
        node.init_exp->accept(*this);
        
        if (!isValidAssignment(node.type->type, node.init_exp->type)) {
            output::errorMismatch(node.line);
        }
    }

    // Give the id node the data that it's a declaration of a var and than visit it:
    node.id->idType = ast::IdType::VAR_DECLARATION;
    node.id->accept(*this);

    symTable.declareVar(node.id->value, node.type->type, false);
}

void SemanticVisitor::visit(ast::Assign &node) {
    node.id->idType = ast::IdType::VAR_USAGE;
    node.id->accept(*this);
    node.exp->accept(*this);
        
    if (!isValidAssignment(node.id->type, node.exp->type)) {
        output::errorMismatch(node.line);
    }
}

void SemanticVisitor::visit(ast::Formal &node) {

    node.type->accept(*this);

    // Give the id node the data that it's a declaration of a var and than visit it:
    node.id->idType = ast::IdType::VAR_DECLARATION;
    node.id->accept(*this);

    symTable.declareVar(node.id->value, node.type->type, true);
}

void SemanticVisitor::visit(ast::Formals &node) {

    for (std::shared_ptr<ast::Formal> formal: node.formals) {
        formal->accept(*this);
    }
}

void SemanticVisitor::visit(ast::FuncDecl &node) {

    node.return_type->accept(*this);

    node.id->type = node.return_type->type;
    
    symTable.startScope();

    node.formals->accept(*this);

    node.body->isFuncBody = true;
    node.body->accept(*this);
    
    symTable.endScope();

    // Check that return type match:
    for(std::shared_ptr<ast::Statement> &statement : node.body->statements) {
        // Check if one of the statements is a return statement:
        std::shared_ptr<ast::Return> ret = std::dynamic_pointer_cast<ast::Return>(statement);
        if (ret) {
            if (ret->exp) {
                if (!isValidAssignment(node.return_type->type, ret->exp->type)) {
                    output::errorMismatch(ret->line);
                }
            } else {
                if (node.return_type->type != ast::BuiltInType::VOID) {
                    output::errorMismatch(ret->line);
                }
            }
        }
    }
}

void SemanticVisitor::visit(ast::Funcs &node) {

    bool mainFound = false;

    // Declare all functions:
    for (std::shared_ptr<ast::FuncDecl> func: node.funcs) {
        // Get a vector of param types:
        std::vector<ast::BuiltInType> paramTypes;
        for (std::shared_ptr<ast::Formal> &formal : func->formals->formals) {
            paramTypes.push_back(formal->type->type);
        }

        func->id->idType = ast::IdType::FUNC_DECLARATION;
        func->id->accept(*this);
        symTable.declareFunc(func->id->value, func->return_type->type, paramTypes);

        if (func->id->value == "main" && func->return_type->type == ast::BuiltInType::VOID && paramTypes.size() == 0) {
            mainFound = true;
        }
    }

    if (!mainFound) {
        output::errorMainMissing();
    }

    // Visit all functions:
    for (std::shared_ptr<ast::FuncDecl> func: node.funcs) {
        func->accept(*this);
    }
}