
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
%t0 = add i32 0, 1
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = add i32 0, 2
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = add i32 0, 3
%t5 = alloca i32 
store i32 %t4, i32* %t5
%t8 = load i32, i32* %t1
%t9 = load i32, i32* %t3
%t7 = add i32 %t8, %t9
%t10 = load i32, i32* %t5
%t6 = add i32 %t7, %t10
call void @printi(i32 %t6)
%t12 = load i32, i32* %t1
%t13 = load i32, i32* %t3
%t11 = add i32 %t12, %t13
call void @printi(i32 %t11)
%t14 = load i32, i32* %t1
call void @printi(i32 %t14)
ret void
}
