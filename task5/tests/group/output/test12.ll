@.str0 = constant [5 x i8] c"good\00"@.str1 = constant [10 x i8] c"very good\00"@.str2 = constant [15 x i8] c"fail, im sorry\00"
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
define i32 @plusser(i32, i32, i32, i32) {
%t8 = add i32 0, 9
%t9 = load i32, i32* %a
%t7 = add i32 %t8, %t9
%t10 = load i32, i32* %b
%t6 = add i32 %t7, %t10
%t11 = load i32, i32* %c
%t5 = add i32 %t6, %t11
%t12 = load i32, i32* %d
%t4 = add i32 %t5, %t12
%t13 = load i32, i32* %a
%t3 = add i32 %t4, %t13
%t14 = load i32, i32* %b
%t2 = add i32 %t3, %t14
%t15 = load i32, i32* %c
%t1 = add i32 %t2, %t15
%t16 = load i32, i32* %d
%t0 = add i32 %t1, %t16
%y = alloca i32 
store i32 %t0, i32* %y
Visiting Return Node
%t17 = load i32, i32* %y
}
define void @main() {
Visiting RelOp Node
%t18 = getelementptr inbounds [5 x i8], [5 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t18)
Visiting RelOp Node
%t19 = getelementptr inbounds [10 x i8], [10 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t19)
%t20 = getelementptr inbounds [15 x i8], [15 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t20)
ret void
}
