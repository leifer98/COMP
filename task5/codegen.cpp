#include "codegen.hpp"
#include <iostream>

void CodeGenVisitor::generateCode(std::shared_ptr<ast::Funcs> program) {
    std::cout << "Generating LLVM code..." << std::endl;
}

void CodeGenVisitor::print() {
    std::cout << "Printing LLVM IR..." << std::endl;
}

// Placeholder implementations for visit methods
void CodeGenVisitor::visit(ast::Num &node) {
    std::cout << "Visiting Num Node" << std::endl;
}

void CodeGenVisitor::visit(ast::NumB &node) {
    std::cout << "Visiting NumB Node" << std::endl;
}

void CodeGenVisitor::visit(ast::String &node) {
    std::cout << "Visiting String Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Bool &node) {
    std::cout << "Visiting Bool Node" << std::endl;
}

void CodeGenVisitor::visit(ast::ID &node) {
    std::cout << "Visiting ID Node" << std::endl;
}

void CodeGenVisitor::visit(ast::BinOp &node) {
    std::cout << "Visiting BinOp Node" << std::endl;
}

void CodeGenVisitor::visit(ast::RelOp &node) {
    std::cout << "Visiting RelOp Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Not &node) {
    std::cout << "Visiting Not Node" << std::endl;
}

void CodeGenVisitor::visit(ast::And &node) {
    std::cout << "Visiting And Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Or &node) {
    std::cout << "Visiting Or Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Type &node) {
    std::cout << "Visiting Type Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Cast &node) {
    std::cout << "Visiting Cast Node" << std::endl;
}

void CodeGenVisitor::visit(ast::ExpList &node) {
    std::cout << "Visiting ExpList Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Call &node) {
    std::cout << "Visiting Call Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Statements &node) {
    std::cout << "Visiting Statements Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Break &node) {
    std::cout << "Visiting Break Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Continue &node) {
    std::cout << "Visiting Continue Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Return &node) {
    std::cout << "Visiting Return Node" << std::endl;
}

void CodeGenVisitor::visit(ast::If &node) {
    std::cout << "Visiting If Node" << std::endl;
}

void CodeGenVisitor::visit(ast::While &node) {
    std::cout << "Visiting While Node" << std::endl;
}

void CodeGenVisitor::visit(ast::VarDecl &node) {
    std::cout << "Visiting VarDecl Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Assign &node) {
    std::cout << "Visiting Assign Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Formal &node) {
    std::cout << "Visiting Formal Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Formals &node) {
    std::cout << "Visiting Formals Node" << std::endl;
}

void CodeGenVisitor::visit(ast::FuncDecl &node) {
    std::cout << "Visiting FuncDecl Node" << std::endl;
}

void CodeGenVisitor::visit(ast::Funcs &node) {
    std::cout << "Visiting Funcs Node" << std::endl;
}
