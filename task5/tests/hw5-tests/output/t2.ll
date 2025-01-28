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
%t3 = zext i8 %0 to i32
%t2 = icmp eq i32 %t3, %t1
br i1 %t2, label %label_3, label %label_2
label_2:
%t4 = add i32 0, 1
%t6 = zext i8 %0 to i32
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
%t9 = sub i8 %0, %t10
%t11 = call i32 @fib(i8 %t9)
%t13 = add i8 0, 2
%t12 = sub i8 %0, %t13
%t14 = call i32 @fib(i8 %t12)
%t8 = add i32 %t11, %t14
ret i32 %t8
}
define void @main() {
%t15 = add i8 0, 0
%t16 = zext i8 %t15 to i32
%i = alloca i32 
store i32 %t16, i32* %i
br label %label_6
label_6:
%t17 = load i32, i32* %i
%t18 = trunc i32 %t17 to i8
%t19 = add i32 0, 10
%t21 = zext i8 %t18 to i32
%t20 = icmp slt i32 %t21, %t19
br i1 %t20, label %label_7, label %label_8
label_7:
%t22 = load i32, i32* %i
%t23 = trunc i32 %t22 to i8
%t24 = call i32 @fib(i8 %t23)
call void @printi(i32 %t24)
%t26 = load i32, i32* %i
%t27 = trunc i32 %t26 to i8
%t28 = add i32 0, 1
%t29 = zext i8 %t27 to i32
%t25 = add i32 %t29, %t28
%t30 = add i32 0, 10
%t31 = icmp slt i32 %t25, %t30
br i1 %t31, label %label_9, label %label_10
label_9:
%t32 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t32)
br label %label_10
label_10:
%t34 = load i32, i32* %i
%t35 = trunc i32 %t34 to i8
%t36 = add i8 0, 1
%t33 = add i8 %t35, %t36
%t37 = zext i8 %t33 to i32
store i32 %t37, i32* %i
br label %label_6
label_8:
%t38 = getelementptr inbounds [2 x i8], [2 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t38)
ret void
}
