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
define i32 @fib(i8) {
%t1 = add i32 0, 0
%t3 = zext i8 %-21899 to i32
%t2 = icmp eq i32 %t3, %t1
br i1 %t2, label %label_3, label %label_2
label_2:
%t4 = add i32 0, 1
%t6 = zext i8 %-21899 to i32
%t5 = icmp eq i32 %t6, %t4
br i1 %t5, label %label_3, label %label_4
label_3:
br label %label_5
label_4:
br label %label_5
label_5:
%t0 = phi i1 [ 1, %label_3 ], [ 0, %label_4]
br i1 %t0, label %label_0, label %label_1
label_0:
%t7 = add i32 0, 1
ret i32 %t7
br label %label_1
label_1:
%t10 = add i8 0, 1
%t9 = sub i8 %-21899, %t10
%t11 = call i32 @fib(i8 %t9)
%t13 = add i8 0, 2
%t12 = sub i8 %-21899, %t13
%t14 = call i32 @fib(i8 %t12)
%t8 = add i32 %t11, %t14
ret i32 %t8
}
define void @main() {
%t15 = add i8 0, 0
%t16 = zext i8 %t15 to i32
%t17 = alloca i32 
store i32 %t16, i32* %t17
br label %label_6
label_6:
%t18 = load i32, i32* %t17
%t19 = trunc i32 %t18 to i8
%t20 = add i32 0, 10
%t22 = zext i8 %t19 to i32
%t21 = icmp slt i32 %t22, %t20
br i1 %t21, label %label_7, label %label_8
label_7:
%t23 = load i32, i32* %t17
%t24 = trunc i32 %t23 to i8
%t25 = call i32 @fib(i8 %t24)
call void @printi(i32 %t25)
%t27 = load i32, i32* %t17
%t28 = trunc i32 %t27 to i8
%t29 = add i32 0, 1
%t30 = zext i8 %t28 to i32
%t26 = add i32 %t30, %t29
%t31 = add i32 0, 10
%t32 = icmp slt i32 %t26, %t31
br i1 %t32, label %label_9, label %label_10
label_9:
%t33 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t33)
br label %label_10
label_10:
%t35 = load i32, i32* %t17
%t36 = trunc i32 %t35 to i8
%t37 = add i8 0, 1
%t34 = add i8 %t36, %t37
%t38 = zext i8 %t34 to i32
store i32 %t38, i32* %t17
br label %label_6
label_8:
%t39 = getelementptr inbounds [2 x i8], [2 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t39)
ret void
}
