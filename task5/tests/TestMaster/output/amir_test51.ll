@.str0 = constant [13 x i8] c"you are good\00"@.str1 = constant [20 x i8] c"code is not working\00"
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
%t0 = add i32 0, 1
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = add i8 0, 255
%t3 = zext i8 %t2 to i32
%t4 = alloca i32 
store i32 %t3, i32* %t4
%t6 = load i32, i32* %t4
%t7 = trunc i32 %t6 to i8
%t8 = add i8 0, 2
%t5 = add i8 %t7, %t8
%t9 = zext i8 %t5 to i32
store i32 %t9, i32* %t4
%t10 = load i32, i32* %t1
%t11 = load i32, i32* %t4
%t12 = trunc i32 %t11 to i8
%t14 = zext i8 %t12 to i32
%t13 = icmp eq i32 %t10, %t14
br i1 %t13, label %label_0, label %label_2
label_0:
%t15 = getelementptr inbounds [13 x i8], [13 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t15)
br label %label_1
label_2:
%t16 = getelementptr inbounds [20 x i8], [20 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t16)
br label %label_1
label_1:
ret void
}
