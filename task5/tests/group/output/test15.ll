
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
%b = alloca i32 
store i32 %t2, i32* %b
%t4 = load i32, i32* %b
%t5 = trunc i32 %t4 to i8
%t6 = add i8 0, 1
%t3 = add i8 %t5, %t6
%x = alloca i32 
store i32 %t3, i32* %x
%t7 = load i32, i32* %x
call void @printi(i32 %t7)
%t9 = load i32, i32* %b
%t10 = trunc i32 %t9 to i8
%t11 = add i8 0, 1
%t8 = add i8 %t10, %t11
%t12 = zext i8 %t8 to i32
%g = alloca i32 
store i32 %t12, i32* %g
%t13 = load i32, i32* %g
%t14 = trunc i32 %t13 to i8
call void @printi(i8 %t14)
%t15 = add i8 0, 4
%t16 = call i32 @notprinti(i8 %t15)
call void @printi(i32 %t16)
ret void
}
