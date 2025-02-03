
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
%t0 = alloca i32 
store i32 0, i32* %t0
%t1 = load i32, i32* %t0
call void @printi(i32 %t1)
%t2 = add i32 0, 1
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = load i32, i32* %t3
call void @printi(i32 %t4)
%t5 = alloca i32 
store i32 0, i32* %t5
%t6 = load i32, i32* %t0
call void @printi(i32 %t6)
%t7 = load i32, i32* %t3
call void @printi(i32 %t7)
%t8 = load i32, i32* %t5
call void @printi(i32 %t8)
%t9 = add i32 0, 3
store i32 %t9, i32* %t5
%t10 = load i32, i32* %t5
call void @printi(i32 %t10)
%t11 = alloca i32 
store i32 0, i32* %t11
%t12 = load i32, i32* %t11
call void @printi(i32 %t12)
%t13 = add i32 0, 2
%t14 = alloca i32 
store i32 %t13, i32* %t14
%t15 = load i32, i32* %t14
call void @printi(i32 %t15)
%t16 = add i32 0, 4
store i32 %t16, i32* %t14
%t17 = load i32, i32* %t14
store i32 %t17, i32* %t11
%t18 = load i32, i32* %t11
call void @printi(i32 %t18)
ret void
}
