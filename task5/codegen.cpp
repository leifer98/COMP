#include "codegen.hpp"
#include "output.hpp"
#include <iostream>

output::CodeBuffer codeBuffer;

void CodeGenVisitor::generateCode(std::shared_ptr<ast::Funcs> program) {
    program->accept(*this);

    // codeBuffer::emit("Generating LLVM code...");
}

void CodeGenVisitor::print() {
    // codeBuffer::emit("Printing LLVM IR...");
    std::cout << codeBuffer;  // Print the generated code
}

// Placeholder implementations for visit methods
void CodeGenVisitor::visit(ast::Num &node) {
    codeBuffer.emit("Visiting Num Node");
}

void CodeGenVisitor::visit(ast::NumB &node) {
    codeBuffer.emit("Visiting NumB Node");
}

void CodeGenVisitor::visit(ast::String &node) {
    codeBuffer.emit("Visiting String Node: Value = " + node.value);
}

void CodeGenVisitor::visit(ast::Bool &node) {
    codeBuffer.emit("Visiting Bool Node: Value = " + std::string(node.value ? "true" : "false"));
}

void CodeGenVisitor::visit(ast::ID &node) {
    codeBuffer.emit("Visiting ID Node: Identifier = " + node.value);
}

void CodeGenVisitor::visit(ast::BinOp &node) {
    codeBuffer.emit("Visiting BinOp Node");
}

void CodeGenVisitor::visit(ast::RelOp &node) {
    codeBuffer.emit("Visiting RelOp Node");
}

void CodeGenVisitor::visit(ast::Not &node) {
    codeBuffer.emit("Visiting Not Node");
}

void CodeGenVisitor::visit(ast::And &node) {
    codeBuffer.emit("Visiting And Node");
}

void CodeGenVisitor::visit(ast::Or &node) {
    codeBuffer.emit("Visiting Or Node");
}

void CodeGenVisitor::visit(ast::Type &node) {
    codeBuffer.emit("Visiting Type Node");
}

void CodeGenVisitor::visit(ast::Cast &node) {
    codeBuffer.emit("Visiting Cast Node");
}

void CodeGenVisitor::visit(ast::ExpList &node) {
    codeBuffer.emit("Visiting ExpList Node: " + std::to_string(node.exps.size()) + " expressions.");
    for (auto &exp : node.exps) {
        exp->accept(*this);
    }
}

void CodeGenVisitor::visit(ast::Call &node) {
    codeBuffer.emit("Visiting Call Node: Function Call to '" + node.func_id->value + "'");
    node.func_id->accept(*this);
    node.args->accept(*this);
}

void CodeGenVisitor::visit(ast::Statements &node) {
    codeBuffer.emit("Visiting Statements Node: " + std::to_string(node.statements.size()) + " statements.");
    for (auto &stmt : node.statements) {
        stmt->accept(*this);
    }
}

void CodeGenVisitor::visit(ast::Break &node) {
    codeBuffer.emit("Visiting Break Node");
}

void CodeGenVisitor::visit(ast::Continue &node) {
    codeBuffer.emit("Visiting Continue Node");
}

void CodeGenVisitor::visit(ast::Return &node) {
    codeBuffer.emit("Visiting Return Node");
    if (node.exp) {
        node.exp->accept(*this);
    }
}

void CodeGenVisitor::visit(ast::If &node) {
    codeBuffer.emit("Visiting If Node: Evaluating condition...");
    node.condition->accept(*this);
    node.then->accept(*this);
    if (node.otherwise) {
        node.otherwise->accept(*this);
    }
}

void CodeGenVisitor::visit(ast::While &node) {
    codeBuffer.emit("Visiting While Node");
}

void CodeGenVisitor::visit(ast::VarDecl &node) {
    codeBuffer.emit("Visiting VarDecl Node: Declaring variable '" + node.id->value + "'");
    if (node.init_exp) {
        node.init_exp->accept(*this);
    }
}

void CodeGenVisitor::visit(ast::Assign &node) {
    codeBuffer.emit("Visiting Assign Node: Assigning to variable '" + node.id->value + "'");
    node.exp->accept(*this);
}

void CodeGenVisitor::visit(ast::Formal &node) {
    codeBuffer.emit("Visiting Formal Node: " + node.id->value + ", Type: " + std::to_string(node.type->type));
}

void CodeGenVisitor::visit(ast::Formals &node) {
    codeBuffer.emit("Visiting Formals Node: " + std::to_string(node.formals.size()) + " parameters.");
    for (auto &formal : node.formals) {
        formal->accept(*this);
    }
}

void CodeGenVisitor::visit(ast::FuncDecl &node) {
    codeBuffer.emit("Visiting FuncDecl Node: Function Name = " + node.id->value);
    node.formals->accept(*this);
    node.body->accept(*this);
}

void CodeGenVisitor::visit(ast::Funcs &node) {
    codeBuffer.emit("Visiting Funcs Node: " + std::to_string(node.funcs.size()) + " functions.");
    for (auto &func : node.funcs) {
        func->accept(*this);
    }
}











