@.str0 = constant [13 x i8] c"you are good\00"@.str1 = constant [18 x i8] c"you code is wrong\00"
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
%t0 = add i8 0, 255
%t1 = zext i8 %t0 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t4 = load i32, i32* %t2
%t5 = trunc i32 %t4 to i8
%t6 = add i8 0, 2
%t3 = add i8 %t5, %t6
%t7 = zext i8 %t3 to i32
store i32 %t7, i32* %t2
%t8 = add i8 0, 1
%t9 = zext i8 %t8 to i32
%t10 = alloca i32 
store i32 %t9, i32* %t10
%t11 = load i32, i32* %t2
%t12 = trunc i32 %t11 to i8
%t13 = load i32, i32* %t10
%t14 = trunc i32 %t13 to i8
%t16 = zext i8 %t12 to i32
%t17 = zext i8 %t14 to i32
%t15 = icmp eq i32 %t16, %t17
br i1 %t15, label %label_0, label %label_2
label_0:
%t18 = getelementptr inbounds [13 x i8], [13 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t18)
br label %label_1
label_2:
%t19 = getelementptr inbounds [18 x i8], [18 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t19)
br label %label_1
label_1:
ret void
}
