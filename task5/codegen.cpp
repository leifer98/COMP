#include "codegen.hpp"
#include "output.hpp"
#include <iostream>


output::CodeBuffer codeBuffer;

/* Helpful functions */

void declareGivenFunctions() {
    
    codeBuffer.emit("declare i32 @scanf(i8*, ...)");
    codeBuffer.emit("declare i32 @printf(i8*, ...)");
    codeBuffer.emit("declare void @exit(i32)");
    codeBuffer.emit("@.int_specifier_scan = constant [3 x i8] c\"%d\\00\"");
    codeBuffer.emit("@.int_specifier = constant [4 x i8] c\"%d\\0A\\00\"");
    codeBuffer.emit("@.str_specifier = constant [4 x i8] c\"%s\\0A\\00\"");

    codeBuffer.emit("define i32 @readi(i32) {");
    codeBuffer.emit("%ret_val = alloca i32");
    codeBuffer.emit("%spec_ptr = getelementptr [3 x i8], [3 x i8]* @.int_specifier_scan, i32 0, i32 0");
    codeBuffer.emit("call i32 (i8*, ...) @scanf(i8* %spec_ptr, i32* %ret_val)");
    codeBuffer.emit("%val = load i32, i32* %ret_val");
    codeBuffer.emit("ret i32 %val");
    codeBuffer.emit("}");

    codeBuffer.emit("define void @printi(i32) {");
    codeBuffer.emit("%spec_ptr = getelementptr [4 x i8], [4 x i8]* @.int_specifier, i32 0, i32 0");
    codeBuffer.emit("call i32 (i8*, ...) @printf(i8* %spec_ptr, i32 %0)");
    codeBuffer.emit("ret void");
    codeBuffer.emit("}");

    codeBuffer.emit("define void @print(i8*) {");
    codeBuffer.emit("%spec_ptr = getelementptr [4 x i8], [4 x i8]* @.str_specifier, i32 0, i32 0");
    codeBuffer.emit("call i32 (i8*, ...) @printf(i8* %spec_ptr, i8* %0)");
    codeBuffer.emit("ret void");
    codeBuffer.emit("}");
}

std::string convertTypeToLLVM(ast::BuiltInType type) {
    switch (type) {
        case ast::BuiltInType::INT:
            return "i32";
        case ast::BuiltInType::BOOL:
            return "i1";
        case ast::BuiltInType::BYTE:
            return "i8";
        case ast::BuiltInType::VOID:
            return "void";
        case ast::BuiltInType::STRING:
            return "i8*";
        default:
            return "UNKNOWN";
    }
}

/* CodeGenVisitor implementation */

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
    codeBuffer << node.var << " = zext i8 " << std::to_string(node.value) << " to i32" << std::endl;
}

void CodeGenVisitor::visit(ast::String &node) {
    // codeBuffer.emit("Visiting String Node: Value = " + node.value);
    
    node.var = codeBuffer.freshVar();
    std::string str = codeBuffer.emitString(node.value);
    int strRealLength = node.value.length() + 1;  // Add 1 for the \0 at the end
    codeBuffer << node.var << " = getelementptr inbounds [" << strRealLength << " x i8], ["
               << strRealLength << " x i8]* " << str << ", i32 0, i32 0" << std::endl;
}

void CodeGenVisitor::visit(ast::Bool &node) {
    // codeBuffer.emit("Visiting Bool Node: Value = " + std::string(node.value ? "true" : "false"));

    // Generate code to assign a fresh register and use it to store the value:
    node.var = codeBuffer.freshVar();
    codeBuffer << node.var << " = zext i1 " << std::to_string(node.value) << " to i32" << std::endl;
}

void CodeGenVisitor::visit(ast::ID &node) {
    // codeBuffer.emit("Visiting ID Node: Identifier = " + node.value);

    if (node.idType == ast::IdType::VAR_USAGE) {
        std::string symbolRegName = "%" + node.value;
        node.var = codeBuffer.freshVar();
        codeBuffer << node.var << " = load i32, i32* " << symbolRegName << std::endl;
    }
    // else if (node.idType == ast::IdType::FUNC_CALL) {
    // }
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
    // codeBuffer.emit("Visiting And Node");

    // Visit left and right expressions to generate their code
    node.left->accept(*this);
    node.right->accept(*this);

    // Convert both operands to i1 for logical operations
    std::string leftBool = codeBuffer.freshVar();
    std::string rightBool = codeBuffer.freshVar();
    codeBuffer << leftBool << " = icmp ne i32 " << node.left->var << ", 0" << std::endl;
    codeBuffer << rightBool << " = icmp ne i32 " << node.right->var << ", 0" << std::endl;

    // Perform logical AND operation
    std::string resultBool = codeBuffer.freshVar();
    codeBuffer << resultBool << " = and i1 " << leftBool << ", " << rightBool << std::endl;

    // Convert the result back to i32
    node.var = codeBuffer.freshVar();
    codeBuffer << node.var << " = zext i1 " << resultBool << " to i32" << std::endl;
}

void CodeGenVisitor::visit(ast::Or &node) {
    // codeBuffer.emit("Visiting Or Node");

    // Visit left and right expressions to generate their code
    node.left->accept(*this);
    node.right->accept(*this);

    // Convert both operands to i1 for logical operations
    std::string leftBool = codeBuffer.freshVar();
    std::string rightBool = codeBuffer.freshVar();
    codeBuffer << leftBool << " = icmp ne i32 " << node.left->var << ", 0" << std::endl;
    codeBuffer << rightBool << " = icmp ne i32 " << node.right->var << ", 0" << std::endl;

    // Perform logical OR operation
    std::string resultBool = codeBuffer.freshVar();
    codeBuffer << resultBool << " = or i1 " << leftBool << ", " << rightBool << std::endl;

    // Convert the result back to i32
    node.var = codeBuffer.freshVar();
    codeBuffer << node.var << " = zext i1 " << resultBool << " to i32" << std::endl;
}

void CodeGenVisitor::visit(ast::Type &node) {
    codeBuffer.emit("Visiting Type Node");
}

void CodeGenVisitor::visit(ast::Cast &node) {
    codeBuffer.emit("Visiting Cast Node");
}

void CodeGenVisitor::visit(ast::ExpList &node) {
    // codeBuffer.emit("Visiting ExpList Node: " + std::to_string(node.exps.size()) + " expressions.");
    for (auto &exp : node.exps) {
        exp->accept(*this);
    }
}

void CodeGenVisitor::visit(ast::Call &node) {
    node.args->accept(*this);

    // Get the return type as an LLVM type
    std::string retTypeStr = convertTypeToLLVM(node.returnType);

    // Build the args list while handling string arguments properly
    std::string argsList = "";
    for (auto &exp : node.args->exps) {
        if (exp->type == ast::BuiltInType::STRING) {
            // Handle string argument by obtaining pointer and size correctly
            auto strNode = std::dynamic_pointer_cast<ast::String>(exp);
            if (strNode) {
                std::string strVar = codeBuffer.emitString(strNode->value);
                std::string strSize = std::to_string(strNode->value.length() + 1); // Include null terminator

                // Generate GEP (GetElementPtr) to get pointer to the string
                std::string ptrVar = codeBuffer.freshVar();
                codeBuffer << ptrVar << " = getelementptr inbounds [" 
                           << strSize << " x i8], [" 
                           << strSize << " x i8]* " 
                           << strVar << ", i32 0, i32 0" 
                           << std::endl;

                argsList += "i8* " + ptrVar + ", ";
            }
        } else {
            // Handle other types as i32
            argsList += "i32 " + exp->var + ", ";
        }
    }

    // Remove the trailing comma and space
    if (!argsList.empty()) {
        argsList = argsList.substr(0, argsList.length() - 2);
    }

    // Build the start of the command
    std::string commandStart = "";
    node.var = "";
    if (node.returnType != ast::BuiltInType::VOID) {
        node.var = codeBuffer.freshVar();
        commandStart = node.var + " = ";
    }

    // Emit the final command
    codeBuffer << commandStart << "call " << retTypeStr 
               << " @" << node.func_id->value 
               << "(" << argsList << ")" 
               << std::endl;
}

void CodeGenVisitor::visit(ast::Statements &node) {
    // codeBuffer.emit("Visiting Statements Node: " + std::to_string(node.statements.size()) + " statements.");

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
    // codeBuffer.emit("Visiting If Node: Evaluating condition...");
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
    
    std::string strType = convertTypeToLLVM(node.type->type);
    std::string strValue = "0";  // Set the default value to 0

    // Handle the initial expression if it exists:
    if (node.init_exp) {
        node.init_exp->accept(*this);
        strType = "i32";
        strValue = node.init_exp->var;
    }
    
    // Generate commands to allocate 32 bit on the stack and then store the value in the allocated spot:
    std::string varName = "%" + node.id->value;
    codeBuffer << varName << " = alloca i32 " << std::endl;
    codeBuffer << "store " << strType << " " << strValue << ", i32* " << varName << std::endl;
}

void CodeGenVisitor::visit(ast::Assign &node) {
    codeBuffer.emit("Visiting Assign Node: Assigning to variable '" + node.id->value + "'");
    node.exp->accept(*this);
}

void CodeGenVisitor::visit(ast::Formal &node) {
    // codeBuffer.emit("Visiting Formal Node: " + node.id->value + ", Type: " + std::to_string(node.type->type));
}

void CodeGenVisitor::visit(ast::Formals &node) {
    // codeBuffer.emit("Visiting Formals Node: " + std::to_string(node.formals.size()) + " parameters.");

    for (auto &formal : node.formals) {
        formal->accept(*this);
    }
}

void CodeGenVisitor::visit(ast::FuncDecl &node) {
    // codeBuffer.emit("Visiting FuncDecl Node: Function Name = " + node.id->value);

    // Visit the parameters:
    node.formals->accept(*this);

    // Get the return type as an llvm type:
    std::string retTypeStr = convertTypeToLLVM(node.return_type->type);

    // Build the param list:
    std::string paramList = "";
    for (auto &formal : node.formals->formals) {
        // paramList += convertTypeToLLVM(formal->type->type) + ", ";
        paramList += "i32, ";
    }
    if (paramList.length() - 2 > 0) {
        paramList = paramList.substr(0, paramList.length() - 2);
    }

    // Emit the function declaration:
    codeBuffer << "define " << retTypeStr << " @" << node.id->value << "(" << paramList << ") {" << std::endl;

    // Visit the body:
    node.body->accept(*this);

    // Emit the ret command and closing curly brace:
    if (node.return_type->type == ast::BuiltInType::VOID) {
        codeBuffer << "ret " << retTypeStr << std::endl;
    } else {
        std::shared_ptr<ast::Statement> &lastStatement = node.body->statements.back(); 
        std::shared_ptr<ast::Return> ret = std::dynamic_pointer_cast<ast::Return>(lastStatement);
        // Check if lastStatement is not a return statement:
        if (!ret) {
            // Return the default value for the type if no return statement exists:
            codeBuffer << "ret " << retTypeStr << " 0" << std::endl;  // The default for numeric and bool types is 0 (string can't be the return type)
        }
    }
    codeBuffer << "}" << std::endl;
}

void CodeGenVisitor::visit(ast::Funcs &node) {
    // codeBuffer.emit("Visiting Funcs Node: " + std::to_string(node.funcs.size()) + " functions.");

    declareGivenFunctions();
    // codeBuffer << "declare i32 @printf(i8*, ...)" << std::endl;
    // codeBuffer << "declare void @exit(i32)" << std::endl;

    for (auto &func : node.funcs) {
        func->accept(*this);
    }
}











