@.str0 = constant [6 x i8] c"Hello\00"@.str1 = constant [5 x i8] c"True\00"
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
%t0 = zext i1 1 to i32
%flag = alloca i32 
store i32 %t0, i32* %flag
%t1 = getelementptr inbounds [6 x i8], [6 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t1)
%t2 = load i32, i32* %flag
%t3 = getelementptr inbounds [5 x i8], [5 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t3)
ret void
}
