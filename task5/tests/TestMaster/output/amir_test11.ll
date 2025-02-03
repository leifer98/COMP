
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
%t0 = add i8 0, 1
%t1 = zext i8 %t0 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t3 = add i32 0, 2
%t4 = trunc i32 %t3 to i8
%t5 = zext i8 %t4 to i32
%t6 = alloca i32 
store i32 %t5, i32* %t6
%t8 = load i32, i32* %t2
%t9 = trunc i32 %t8 to i8
%t10 = load i32, i32* %t6
%t11 = trunc i32 %t10 to i8
%t7 = add i8 %t9, %t11
%t12 = zext i8 %t7 to i32
%t13 = alloca i32 
store i32 %t12, i32* %t13
%t14 = load i32, i32* %t2
%t15 = trunc i32 %t14 to i8
%t16 = zext i8 %t15 to i32
call void @printi(i32 %t16)
%t17 = load i32, i32* %t6
%t18 = trunc i32 %t17 to i8
%t19 = zext i8 %t18 to i32
call void @printi(i32 %t19)
%t20 = load i32, i32* %t13
%t21 = trunc i32 %t20 to i8
%t22 = zext i8 %t21 to i32
call void @printi(i32 %t22)
%t23 = load i32, i32* %t13
%t24 = trunc i32 %t23 to i8
%t25 = zext i8 %t24 to i32
%t26 = alloca i32 
store i32 %t25, i32* %t26
%t27 = load i32, i32* %t26
call void @printi(i32 %t27)
ret void
}
