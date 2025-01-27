
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
Visiting Return Node
%t0 = add i32 0, 2
}
define void @main() {
%t1 = zext i8 255 to i32
%b = alloca i32 
store i32 %t1, i32* %b
%t3 = load i32, i32* %b
%t4 = zext i8 1 to i32
%t2 = add i32 %t3, %t4
%x = alloca i32 
store i32 %t2, i32* %x
%t5 = load i32, i32* %x
call void @printi(i32 %t5)
%t7 = load i32, i32* %b
%t8 = zext i8 1 to i32
%t6 = add i32 %t7, %t8
%g = alloca i32 
store i32 %t6, i32* %g
%t9 = load i32, i32* %g
call void @printi(i32 %t9)
%t10 = zext i8 4 to i32
%t11 = call i32 @notprinti(i32 %t10)
call void @printi(i32 %t11)
ret void
}
