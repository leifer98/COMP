
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
define i32 @func1(i32) {
%t1 = add i32 0, 1
%t0 = add i32 %0, %t1
ret i32 %t0
}
define i32 @func2(i32) {
%t3 = add i32 0, 2
%t2 = mul i32 %0, %t3
ret i32 %t2
}
define i32 @func3(i32) {
%t5 = add i32 0, 1
%t4 = sub i32 %0, %t5
ret i32 %t4
}
define void @main() {
%t6 = add i32 0, 5
%t7 = call i32 @func3(i32 %t6)
%t8 = call i32 @func2(i32 %t7)
%t9 = call i32 @func1(i32 %t8)
call void @printi(i32 %t9)
ret void
}
