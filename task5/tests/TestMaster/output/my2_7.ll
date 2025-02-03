@.str0 = constant [2 x i8] c"A\00"@.str1 = constant [2 x i8] c"B\00"
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
define i32 @aFunc() {
%t0 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
%t1 = add i32 0, 1
ret i32 %t1
}
define i32 @bFunc() {
%t2 = getelementptr inbounds [2 x i8], [2 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t2)
%t3 = add i32 0, 2
ret i32 %t3
}
define i32 @sum(i32, i32) {
%t4 = add i32 %0, %1
ret i32 %t4
}
define void @main() {
%t5 = alloca i32 
store i32 0, i32* %t5
%t6 = call i32 @aFunc()
%t7 = call i32 @bFunc()
%t8 = call i32 @sum(i32 %t6, i32 %t7)
store i32 %t8, i32* %t5
%t9 = load i32, i32* %t5
call void @printi(i32 %t9)
ret void
}
