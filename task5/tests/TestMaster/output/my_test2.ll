
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
define void @main() {
%t0 = add i8 0, 200
%t1 = zext i8 %t0 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t3 = add i8 0, 100
%t4 = zext i8 %t3 to i32
%t5 = alloca i32 
store i32 %t4, i32* %t5
%t7 = load i32, i32* %t2
%t8 = trunc i32 %t7 to i8
%t9 = load i32, i32* %t5
%t10 = trunc i32 %t9 to i8
%t6 = add i8 %t8, %t10
%t11 = zext i8 %t6 to i32
%t12 = alloca i32 
store i32 %t11, i32* %t12
%t13 = load i32, i32* %t12
call void @printi(i32 %t13)
ret void
}
