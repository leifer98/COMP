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
define i32 @fib(i32) {
Visiting RelOp Node
Visiting RelOp Node
%t0 = icmp ne i32 , 0
%t1 = icmp ne i32 , 0
%t2 = or i1 %t0, %t1
%t3 = zext i1 %t2 to i32
Visiting Return Node
%t4 = add i32 0, 1
Visiting Return Node
%t7 = load i32, i32* %n
%t8 = zext i8 1 to i32
%t6 = sub i32 %t7, %t8
%t9 = call i32 @fib(i32 %t6)
%t11 = load i32, i32* %n
%t12 = zext i8 2 to i32
%t10 = sub i32 %t11, %t12
%t13 = call i32 @fib(i32 %t10)
%t5 = add i32 %t9, %t13
}
define void @main() {
%t14 = zext i8 0 to i32
%i = alloca i32 
store i32 %t14, i32* %i
Visiting While Node
%t15 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t15)
ret void
}
