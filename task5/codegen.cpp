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
    // codeBuffer.emit("Visiting Num Node");

    // Generate code to assign a fresh register and use it to store the value:
    node.var = codeBuffer.freshVar();
    codeBuffer << node.var << " = add i32 0, " << std::to_string(node.value) << std::endl;
}

void CodeGenVisitor::visit(ast::NumB &node) {
    // codeBuffer.emit("Visiting NumB Node");

    // Generate code to assign a fresh register and use it to store the value:
    node.var = codeBuffer.freshVar();
    codeBuffer << "add i32 " << node.var << ", " << std::to_string(node.value) << std::endl;
}

void CodeGenVisitor::visit(ast::String &node) {
    codeBuffer.emit("Visiting String Node: Value = " + node.value);
    
    node.var = codeBuffer.freshVar();
    std::string str = codeBuffer.emitString(node.value);
    codeBuffer << node.var << " = getelementptr inbounds [" << node.value.length() << " x i8], ["
               << node.value.length() << " x i8]* " << str << ", i32 0, i32 0" << std::endl;
}

void CodeGenVisitor::visit(ast::Bool &node) {
    codeBuffer.emit("Visiting Bool Node: Value = " + std::string(node.value ? "true" : "false"));

    // Generate code to assign a fresh register and use it to store the value:
    node.var = codeBuffer.freshVar();
    codeBuffer << "add i32 " << node.var << ", " << std::to_string(node.value) << std::endl;
}

void CodeGenVisitor::visit(ast::ID &node) {
    codeBuffer.emit("Visiting ID Node: Identifier = " + node.value);

    switch (node.idType)
    {
    case ast::IdType::VAR_USAGE:
        /* code */
        break;
    case ast::IdType::VAR_DECLARATION:
        /* code */
        break;
    case ast::IdType::FUNC_CALL:
        /* code */
        break;
    case ast::IdType::FUNC_DECLARATION:
        /* code */
        break;
    default:
        break;
    }
}

void CodeGenVisitor::visit(ast::BinOp &node) {
    // codeBuffer.emit("Visiting BinOp Node");

    node.var = codeBuffer.freshVar();

    node.left->accept(*this);
    node.right->accept(*this);

    switch (node.op)
    {
    case ast::BinOpType::ADD:
        codeBuffer << node.var << " = add i32 " << node.left->var << ", " << node.right->var << std::endl;
        break;
    case ast::BinOpType::SUB:
        codeBuffer << node.var << " = sub i32 " << node.left->var << ", " << node.right->var << std::endl;
        break;
    case ast::BinOpType::MUL:
        codeBuffer << node.var << " = mul i32 " << node.left->var << ", " << node.right->var << std::endl;
        break;
    case ast::BinOpType::DIV:
        codeBuffer << node.var << " = sdiv i32 " << node.left->var << ", " << node.right->var << std::endl;
        break;
    default:
        break;
    }
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
    // codeBuffer.emit("Visiting VarDecl Node: Declaring variable '" + node.id->value + "'");
    
    // Visit the initial expression:
    if (node.init_exp) {
        node.init_exp->accept(*this);
    }
    
    // Generate commands to allocate 32 bit on the stack and then store the value in the allocated spot:
    std::string varName = "%" + node.id->value;
    codeBuffer << varName << " = alloca i32 " << std::endl;
    codeBuffer << "store i32 " << node.init_exp->var << ", i32* " << varName << std::endl;
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

    codeBuffer << "declare i32 @printf(i8*, ...)" << std::endl;
    codeBuffer << "declare void @exit(i32)" << std::endl;

    for (auto &func : node.funcs) {
        func->accept(*this);
    }
}











