
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
define i32 @notprinti(i32) {
%t0 = add i32 0, 2
ret i32 %t0
}
define void @main() {
%t1 = add i8 0, 255
%t2 = zext i8 %t1 to i32
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t5 = load i32, i32* %t3
%t6 = trunc i32 %t5 to i8
%t7 = add i8 0, 1
%t4 = add i8 %t6, %t7
%t8 = zext i8 %t4 to i32
%t9 = alloca i32 
store i32 %t8, i32* %t9
%t10 = load i32, i32* %t9
call void @printi(i32 %t10)
%t12 = load i32, i32* %t3
%t13 = trunc i32 %t12 to i8
%t14 = add i8 0, 1
%t11 = add i8 %t13, %t14
%t15 = zext i8 %t11 to i32
%t16 = alloca i32 
store i32 %t15, i32* %t16
%t17 = load i32, i32* %t16
%t18 = trunc i32 %t17 to i8
%t19 = zext i8 %t18 to i32
call void @printi(i32 %t19)
%t20 = add i8 0, 4
%t21 = zext i8 %t20 to i32
%t22 = call i32 @notprinti(i32 %t21)
call void @printi(i32 %t22)
ret void
}
