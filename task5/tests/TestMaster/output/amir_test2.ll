@.str0 = constant [2 x i8] c"*\00"@.str1 = constant [2 x i8] c"*\00"
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
%t0 = add i8 0, 0
%t1 = zext i8 %t0 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
br label %label_0
label_0:
%t3 = load i32, i32* %t2
%t4 = trunc i32 %t3 to i8
%t5 = add i32 0, 10
%t7 = zext i8 %t4 to i32
%t6 = icmp slt i32 %t7, %t5
br i1 %t6, label %label_1, label %label_2
label_1:
%t8 = load i32, i32* %t2
%t9 = trunc i32 %t8 to i8
%t10 = zext i8 %t9 to i32
call void @printi(i32 %t10)
%t12 = load i32, i32* %t2
%t13 = trunc i32 %t12 to i8
%t14 = add i32 0, 1
%t15 = zext i8 %t13 to i32
%t11 = add i32 %t15, %t14
%t16 = add i32 0, 10
%t17 = icmp slt i32 %t11, %t16
br i1 %t17, label %label_3, label %label_4
label_3:
%t18 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t18)
br label %label_4
label_4:
%t20 = load i32, i32* %t2
%t21 = trunc i32 %t20 to i8
%t22 = add i8 0, 1
%t19 = add i8 %t21, %t22
%t23 = zext i8 %t19 to i32
store i32 %t23, i32* %t2
br label %label_0
label_2:
%t24 = getelementptr inbounds [2 x i8], [2 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t24)
ret void
}
