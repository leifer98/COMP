@.str0 = constant [23 x i8] c"Error division by zero\00"@.str1 = constant [20 x i8] c"Should have failed!\00"
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
%t1 = add i32 0, 3
%t2 = add i32 0, 0
%t3 = icmp eq i32 %t2, 0
br i1 %t3, label %label_0, label %label_1
label_0:
%t4 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t4)
call void @exit(i32 1)
br label %label_1
label_1:
%t0 = sdiv i32 %t1, %t2
call void @printi(i32 %t0)
%t5 = getelementptr inbounds [20 x i8], [20 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t5)
ret void
}
