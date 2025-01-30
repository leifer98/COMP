
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
%t0 = add i8 0, 10
%t1 = add i8 0, 20
%t2 = call i8 @sumBytes(i8 %t0, i8 %t1)
%t3 = zext i8 %t2 to i32
%t4 = alloca i32 
store i32 %t3, i32* %t4
%t5 = load i32, i32* %t4
%t6 = trunc i32 %t5 to i8
%t7 = zext i8 %t6 to i32
call void @printi(i32 %t7)
ret void
}
define i8 @sumBytes(i8, i8) {
%t8 = add i8 %-22033, %-22032
ret i8 %t8
}
