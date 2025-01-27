@.str0 = constant [2 x i8] c"*\00"
declare i32 @scanf(i8*, ...)
declare i32 @printf(i8*, ...)
declare void @exit(i32)
@.int_specifier_scan = constant [3 x i8] c"%d\00"
@.int_specifier = constant [4 x i8] c"%d\0A\00"
@.str_specifier = constant [4 x i8] c"%s\0A\00"
define i32 @readi(i32) {
%ret_val = alloca i32
%spec_ptr = getelementptr [3 x i8], [3 x i8]* @.int_specifier_scan, i32 0, i32 0
call i32 (i8*, ...) @scanf(i8* %spec_ptr, i32* %ret_val)
%val = load i32, i32* %ret_val
ret i32 %val
}
define void @printi(i32) {
%spec_ptr = getelementptr [4 x i8], [4 x i8]* @.int_specifier, i32 0, i32 0
call i32 (i8*, ...) @printf(i8* %spec_ptr, i32 %0)
ret void
}
define void @print(i8*) {
%spec_ptr = getelementptr [4 x i8], [4 x i8]* @.str_specifier, i32 0, i32 0
call i32 (i8*, ...) @printf(i8* %spec_ptr, i8* %0)
ret void
}
define i32 @fib(i8) {
Visiting RelOp Node
Visiting RelOp Node
%t0 = or i1 , 
br i1 %t0, label %label_0, label %label_1
label_0:
%t1 = add i32 0, 1
ret i32 %t1
br label %label_1
label_1:
%t4 = add i8 0, 1
%t3 = sub i32 %0, %t4
%t5 = call i32 @fib(i8 %t3)
%t7 = add i8 0, 2
%t6 = sub i32 %0, %t7
%t8 = call i32 @fib(i8 %t6)
%t2 = add i32 %t5, %t8
ret i32 %t2
}
define void @main() {
%t9 = add i8 0, 0
%t10 = zext i8 %t9 to i32
%i = alloca i32 
store i32 %t9, i32* %i
Visiting While Node
%t11 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t11)
ret void
}
