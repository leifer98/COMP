@.str0 = constant [50 x i8] c"You code is not working, bool by default is false\00"@.str1 = constant [25 x i8] c"bool by default is false\00"
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
%t2 = trunc i32 %t1 to i1
br i1 %t2, label %label_0, label %label_2
label_0:
%t3 = getelementptr inbounds [50 x i8], [50 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t3)
br label %label_1
label_2:
%t4 = getelementptr inbounds [25 x i8], [25 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t4)
br label %label_1
label_1:
ret void
}
