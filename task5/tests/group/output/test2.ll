@.str0 = constant [3 x i8] c":/\00"
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
define i32 @foo(i32, i32) {
%t1 = load i32, i32* %a
%t2 = load i32, i32* %b
%t0 = add i32 %t1, %t2
%x = alloca i32 
store i32 %t0, i32* %x
Visiting Return Node
%t3 = load i32, i32* %x
}
define void @main() {
%t4 = add i32 0, 15
%t5 = zext i8 5 to i32
%t6 = call i32 @foo(i32 %t4, i32 %t5)
%x = alloca i32 
store i32 %t6, i32* %x
%t7 = add i32 0, 42
%t8 = zext i8 8 to i32
%t9 = call i32 @foo(i32 %t7, i32 %t8)
%y = alloca i32 
store i32 %t9, i32* %y
Visiting RelOp Node
%t11 = load i32, i32* %x
%t12 = load i32, i32* %y
%t10 = add i32 %t11, %t12
call void @printi(i32 %t10)
%t13 = getelementptr inbounds [3 x i8], [3 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t13)
ret void
}
