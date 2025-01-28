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

std::string convertRelOpTypeToLLVM(ast::RelOpType type) {
    switch (type) {
        case ast::RelOpType::EQ:
            return "eq";
        case ast::RelOpType::NE:
            return "ne";
        case ast::RelOpType::GT:
            return "sgt";
        case ast::RelOpType::GE:
            return "sge";
        case ast::RelOpType::LT:
            return "slt";
        case ast::RelOpType::LE:
            return "sle";
        default:
            return "UNKNOWN";
    }
}

std::string convertBinOpTypeToLLVM(ast::BinOpType type) {
    switch (type)
    {
        case ast::BinOpType::ADD:
            return "add";
        case ast::BinOpType::SUB:
            return "sub";
        case ast::BinOpType::MUL:
            return "mul";
        case ast::BinOpType::DIV:
            return "sdiv";
        default:
            return "UNKNOWN";
    }
}

int getNumericValueAndHandleDivisionByZero(CodeGenVisitor &genVisitor, int leftValue, int rightValue, ast::BinOpType type) {
    switch (type)
    {
        case ast::BinOpType::ADD:
            return leftValue + rightValue;
        case ast::BinOpType::SUB:
            return leftValue - rightValue;
        case ast::BinOpType::MUL:
            return leftValue * rightValue;
        case ast::BinOpType::DIV:
            if (rightValue == 0) {
                // Emit the error message string
                std::string errorMessage("Error division by zero");
                std::string strVar = codeBuffer.emitString(errorMessage);
                
                // Get the string in a var and print it
                int strRealLength = errorMessage.length() + 1;  // Add 1 for the \0 at the end
                std::string tempStringVar = codeBuffer.freshVar();
                codeBuffer << tempStringVar << " = getelementptr inbounds ["
                                            << strRealLength << " x i8], ["
                                            << strRealLength << " x i8]* "
                                            << strVar << ", i32 0, i32 0"
                                            << std::endl;

                codeBuffer << "call void @print(i8* " << tempStringVar << ")" << std::endl;
                codeBuffer << "call void @exit(i32 0)" << std::endl;
            } else {
                return leftValue / rightValue;
            }
        default:
            return 0;
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
    codeBuffer << node.var << " = add i8 0, " << std::to_string(node.value) << std::endl;
}

void CodeGenVisitor::visit(ast::String &node) {
    // codeBuffer.emit("Visiting String Node: Value = " + node.value);
    
    node.var = codeBuffer.freshVar();
    std::string strVar = codeBuffer.emitString(node.value);
    int strRealLength = node.value.length() + 1;  // Add 1 for the \0 at the end
    codeBuffer << node.var << " = getelementptr inbounds ["
                            << strRealLength << " x i8], ["
                            << strRealLength << " x i8]* "
                            << strVar << ", i32 0, i32 0"
                            << std::endl;
}

void CodeGenVisitor::visit(ast::Bool &node) {
    // codeBuffer.emit("Visiting Bool Node: Value = " + std::string(node.value ? "true" : "false"));

    // Generate code to assign a fresh register and use it to store the value:
    node.var = codeBuffer.freshVar();
    codeBuffer << node.var << " = add i1 0, " << std::to_string(node.value) << std::endl;
}

void CodeGenVisitor::visit(ast::ID &node) {
    // codeBuffer.emit("Visiting ID Node: Identifier = " + node.value);

    if (node.idType == ast::IdType::VAR_USAGE) {
        if (node.isParam) {
            node.var = "%" + std::to_string(-node.offset - 1);
        } else {
            if (node.declarationNode->id->isNumericValueDefined) {
                node.numericValue = node.declarationNode->id->numericValue;
                node.isNumericValueDefined = true;
            }

            std::string symbolPointerRegName = node.declarationNode->var;
            
            // Load the value from stack
            std::string var32bit = codeBuffer.freshVar();
            codeBuffer << var32bit << " = load i32, i32* " << symbolPointerRegName << std::endl;
            
            // Convert to correct type if needed and store in node.var
            if (node.type == ast::BuiltInType::INT) {
                node.var = var32bit;
            }
            else {
                node.var = codeBuffer.freshVar();
                codeBuffer << node.var << " = trunc i32 " << var32bit
                                    << " to " << convertTypeToLLVM(node.type)
                                    << std::endl;
            }
        }
    }
    // else if (node.idType == ast::IdType::FUNC_CALL) {
    // }
}

void CodeGenVisitor::visit(ast::BinOp &node) {
    // codeBuffer.emit("Visiting BinOp Node");

    node.var = codeBuffer.freshVar();

    node.left->accept(*this);
    node.right->accept(*this);

    // Handle values to detect devision by zero
    if (node.left->isNumericValueDefined && node.right->isNumericValueDefined) {
        node.numericValue = getNumericValueAndHandleDivisionByZero(*this, node.left->numericValue, node.right->numericValue, node.op);
        node.isNumericValueDefined = true;
    }

    std::string leftVar = node.left->var;
    std::string rightVar = node.right->var;
    // Convert to int if necessary
    if (node.type == ast::BuiltInType::INT) {
        // Temporarly convert bytes to ints for the operation
        if (node.left->type != ast::BuiltInType::INT) {
            leftVar = codeBuffer.freshVar();
            codeBuffer << leftVar << " = zext " << convertTypeToLLVM(node.left->type) << " " << node.left->var << " to i32" << std::endl;
        }
        if (node.right->type != ast::BuiltInType::INT) {
            rightVar = codeBuffer.freshVar();
            codeBuffer << rightVar << " = zext " << convertTypeToLLVM(node.right->type) << " " << node.right->var << " to i32" << std::endl;
        }
    }

    // Convert type and operation to llvm format for the command
    std::string type = convertTypeToLLVM(node.type);
    std::string operation = convertBinOpTypeToLLVM(node.op);

    // Generate the operation command
    codeBuffer << node.var << " = " << operation << " " << type << " " << leftVar << ", " << rightVar << std::endl;
}

void CodeGenVisitor::visit(ast::RelOp &node) {
    // codeBuffer.emit("Visiting RelOp Node");

    // Visit left and right expressions to generate their code
    node.left->accept(*this);
    node.right->accept(*this);

    // Generate code to perform the operation
    node.var = codeBuffer.freshVar();

    // Get the correct condition for the icmp command
    std::string condition = convertRelOpTypeToLLVM(node.op);

    // Temporarly convert bytes to ints for the comparison
    std::string leftVar = node.left->var;
    if (node.left->type != ast::BuiltInType::INT) {
        leftVar = codeBuffer.freshVar();
        codeBuffer << leftVar << " = zext " << convertTypeToLLVM(node.left->type) << " " << node.left->var << " to i32" << std::endl;
    }
    std::string rightVar = node.right->var;
    if (node.right->type != ast::BuiltInType::INT) {
        rightVar = codeBuffer.freshVar();
        codeBuffer << rightVar << " = zext " << convertTypeToLLVM(node.right->type) << " " << node.right->var << " to i32" << std::endl;
    }

    // Generate comparison command
    codeBuffer << node.var << " = icmp " << condition << " i32 "
                           << leftVar << ", "
                           << rightVar
                           << std::endl;
}

void CodeGenVisitor::visit(ast::Not &node) {
    // codeBuffer.emit("Visiting Not Node");

    // Visit expression to generate its code
    node.exp->accept(*this);

    // Perform logical NOT operation (using xor)
    node.var = codeBuffer.freshVar();
    codeBuffer << node.var << " = xor i1 1, " << node.exp->var << std::endl;
}

void CodeGenVisitor::visit(ast::And &node) {
    // codeBuffer.emit("Visiting And Node");

    // Get fresh labels
    std::string leftTrue = codeBuffer.freshLabel();
    std::string trueLabel = codeBuffer.freshLabel();
    std::string falseLabel = codeBuffer.freshLabel();
    std::string nextLabel = codeBuffer.freshLabel();

    // Get fresh var for the or operation
    node.var = codeBuffer.freshVar();

    // Jump to correct label based on left expression value
    node.left->accept(*this);
    codeBuffer << "br i1 " << node.left->var
               << ", label " << leftTrue
               << ", label " << falseLabel
               << std::endl;

    // If left expression is true, also check the right expression
    codeBuffer.emitLabel(leftTrue);
    node.right->accept(*this);
    codeBuffer << "br i1 " << node.right->var
               << ", label " << trueLabel
               << ", label " << falseLabel
               << std::endl;

    // The AND result is true
    codeBuffer.emitLabel(trueLabel);
    codeBuffer << "br label " << nextLabel << std::endl;

    // The AND result is false
    codeBuffer.emitLabel(falseLabel);
    codeBuffer << "br label " << nextLabel << std::endl;

    // Choose which value to put in node.var based on labels passed
    codeBuffer.emitLabel(nextLabel);
    codeBuffer << node.var << " = phi i1 [ 1, " << trueLabel << " ], [ 0, " << falseLabel << "]"
                           << std::endl;
}

void CodeGenVisitor::visit(ast::Or &node) {
    // codeBuffer.emit("Visiting Or Node");

    // Get fresh labels
    std::string leftFalse = codeBuffer.freshLabel();
    std::string trueLabel = codeBuffer.freshLabel();
    std::string falseLabel = codeBuffer.freshLabel();
    std::string nextLabel = codeBuffer.freshLabel();

    // Get fresh var for the or operation
    node.var = codeBuffer.freshVar();

    // Jump to correct label based on left expression value
    node.left->accept(*this);
    codeBuffer << "br i1 " << node.left->var
               << ", label " << trueLabel
               << ", label " << leftFalse
               << std::endl;

    // If left expression is false, also check the right expression
    codeBuffer.emitLabel(leftFalse);
    node.right->accept(*this);
    codeBuffer << "br i1 " << node.right->var
               << ", label " << trueLabel
               << ", label " << falseLabel
               << std::endl;

    // The OR result is true
    codeBuffer.emitLabel(trueLabel);
    codeBuffer << "br label " << nextLabel << std::endl;
    
    // The OR result is false
    codeBuffer.emitLabel(falseLabel);
    codeBuffer << "br label " << nextLabel << std::endl;

    // Choose which value to put in node.var based on labels passed
    codeBuffer.emitLabel(nextLabel);
    codeBuffer << node.var << " = phi i1 [ 1, " << trueLabel << " ], [ 0, " << falseLabel << "]"
                           << std::endl;
}

void CodeGenVisitor::visit(ast::Type &node) {
    // codeBuffer.emit("Visiting Type Node");
}

void CodeGenVisitor::visit(ast::Cast &node) {
    // codeBuffer.emit("Visiting Cast Node");
    
    // Visit expression
    node.exp->accept(*this);

    // Perform the cast if needed
    node.var = node.exp->var;
    if (node.target_type->type == ast::BuiltInType::INT && node.exp->type == ast::BuiltInType::BYTE) {
        node.var = codeBuffer.freshVar();
        codeBuffer << node.var << " = zext i8 " << node.exp->var << " to i32" << std::endl;
    } else if (node.target_type->type == ast::BuiltInType::BYTE && node.exp->type == ast::BuiltInType::INT) {
        node.var = codeBuffer.freshVar();
        codeBuffer << node.var << " = trunc i32 " << node.exp->var << " to i8" << std::endl;
    }
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

    // Build the args list
    std::string argsList = "";
    for (size_t i = 0; i < node.args->exps.size(); i++)
    {
        auto &exp = node.args->exps[i];

        // Implicit convertion of byte to int when necessary
        std::string expType = convertTypeToLLVM(exp->type);
        std::string expVar = exp->var;
        if (exp->type == ast::BuiltInType::BYTE && node.expectedTypes[i] == ast::BuiltInType::INT) {
            expType = "i32";
            expVar = codeBuffer.freshVar();
            codeBuffer << expVar << " = zext i8 " << exp->var << " to i32" << std::endl;
        }

        // Add the argument to argsList
        argsList += expType + " " + expVar + ", ";
    }

    // Remove the argsList's trailing comma and space
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
        stmt->whileConditionLabel = node.whileConditionLabel;
        stmt->whileNextLabel = node.whileNextLabel;

        stmt->accept(*this);
    }
}

void CodeGenVisitor::visit(ast::Break &node) {
    // codeBuffer.emit("Visiting Break Node");

    codeBuffer << "br label " << node.whileNextLabel << std::endl;
}

void CodeGenVisitor::visit(ast::Continue &node) {
    // codeBuffer.emit("Visiting Continue Node");

    codeBuffer << "br label " << node.whileConditionLabel << std::endl;
}

void CodeGenVisitor::visit(ast::Return &node) {
    // codeBuffer.emit("Visiting Return Node");
    
    // Visit the expression
    std::string retType = "void";
    std::string retValue = "";
    if (node.exp) {
        node.exp->accept(*this);
        retType = convertTypeToLLVM(node.exp->type);
        retValue = " " + node.exp->var;
    }

    // Generate code for ret command
    codeBuffer << "ret " << retType << retValue << std::endl;
}

void CodeGenVisitor::visit(ast::If &node) {
    // codeBuffer.emit("Visiting If Node: Evaluating condition...");
    
    // Pass to inner statements the while labels:
    node.then->whileConditionLabel = node.whileConditionLabel;
    node.then->whileNextLabel = node.whileNextLabel;
    if (node.otherwise) {
        node.otherwise->whileConditionLabel = node.whileConditionLabel;
        node.otherwise->whileNextLabel = node.whileNextLabel; 
    }

    // Generate labels (without emiting them yet)
    std::string ifLabel = codeBuffer.freshLabel();
    std::string nextLabel = codeBuffer.freshLabel();
    std::string elseLabel = "";
    if (node.otherwise) {
        elseLabel = codeBuffer.freshLabel();
    } else {
        elseLabel = nextLabel;
    }

    // Visit the condition and branch based on it
    node.condition->accept(*this);
    codeBuffer << "br i1 " << node.condition->var
               << ", label " << ifLabel
               << ", label " << elseLabel
               << std::endl;

    // Handle the if block
    codeBuffer.emitLabel(ifLabel);
    node.then->accept(*this);
    codeBuffer << "br label " << nextLabel << std::endl;

    // Handle the else block if exists
    if (node.otherwise) {
        codeBuffer.emitLabel(elseLabel);
        node.otherwise->accept(*this);
        codeBuffer << "br label " << nextLabel << std::endl;
    }

    // Emit the label for next instruction after the if
    codeBuffer.emitLabel(nextLabel);
}

void CodeGenVisitor::visit(ast::While &node) {
    // codeBuffer.emit("Visiting While Node");

    // Generate labels (without emiting them yet)
    std::string conditionLabel = codeBuffer.freshLabel();
    std::string whileLabel = codeBuffer.freshLabel();
    std::string nextLabel = codeBuffer.freshLabel();

    // Update labels data for statements inside the while
    node.body->whileConditionLabel = conditionLabel;
    node.body->whileNextLabel = nextLabel;

    // Jump to condition
    codeBuffer << "br label " << conditionLabel << std::endl;

    // Emit the condition label
    codeBuffer.emitLabel(conditionLabel);

    // Visit the condition and branch based on it
    node.condition->accept(*this);
    codeBuffer << "br i1 " << node.condition->var
               << ", label " << whileLabel
               << ", label " << nextLabel
               << std::endl;

    // Emit the while label
    codeBuffer.emitLabel(whileLabel);

    // Visit the body
    node.body->accept(*this);

    // Jump back to condition label
    codeBuffer << "br label " << conditionLabel << std::endl;

    // Emit the label for next instruction after the if
    codeBuffer.emitLabel(nextLabel);
}

void CodeGenVisitor::visit(ast::VarDecl &node) {
    // codeBuffer.emit("Visiting VarDecl Node: Declaring variable '" + node.id->value + "'");
    
    std::string value = "0";  // Set the default value to 0

    // Handle the initial expression if it exists:
    if (node.init_exp) {
        node.init_exp->accept(*this);
        // Handle values to detect devision by zero
        if (node.init_exp->isNumericValueDefined) {
            node.id->numericValue = node.init_exp->numericValue;
            node.id->isNumericValueDefined = true;
        }

        // Extend to 32 bit if necessary
        std::string type = convertTypeToLLVM(node.init_exp->type);
        std::string var32bit = node.init_exp->var;
        if (type == "i8" || type == "i1") { 
            var32bit = codeBuffer.freshVar();
            codeBuffer << var32bit << " = zext " << type << " " << node.init_exp->var << " to i32" << std::endl;
        }
        // Set the value to store
        value = var32bit;
    }
    
    // Generate commands to allocate 32 bit on the stack and then store the value in the allocated spot:
    node.var = codeBuffer.freshVar();
    codeBuffer << node.var << " = alloca i32 " << std::endl;
    codeBuffer << "store i32 " << value << ", i32* " << node.var << std::endl;
}

void CodeGenVisitor::visit(ast::Assign &node) {
    // codeBuffer.emit("Visiting Assign Node: Assigning to variable '" + node.id->value + "'");
    
    node.exp->accept(*this);

    std::string idType = convertTypeToLLVM(node.id->type);
    std::string expType = convertTypeToLLVM(node.exp->type);

    if (!node.id->isParam) {
        // Handle values to detect devision by zero
        if (node.exp->isNumericValueDefined) {
            node.id->numericValue = node.exp->numericValue;
            node.id->isNumericValueDefined = true;
            node.id->declarationNode->id->numericValue = node.exp->numericValue;
            node.id->declarationNode->id->isNumericValueDefined = true;
        }

        // Extend to 32 bit if necessary
        std::string var32bit = node.exp->var;
        if (expType == "i8" || expType == "i1") { 
            var32bit = codeBuffer.freshVar();
            codeBuffer << var32bit << " = zext " << expType << " " << node.exp->var << " to i32" << std::endl;
        }

        std::string varName = node.id->declarationNode->var;
        codeBuffer << "store i32 " << var32bit << ", i32* " << varName << std::endl;
    } else {
        // TODO if needed (in the pdf it says we can assume no assignment into params)
    }
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
        paramList += convertTypeToLLVM(formal->type->type) + ", ";
    }
    
    // Remove the paramList's trailing comma and space
    if (!paramList.empty()) {
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

    for (auto &func : node.funcs) {
        func->accept(*this);
    }
}











