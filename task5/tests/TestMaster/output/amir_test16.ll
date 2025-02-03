@.str0 = constant [23 x i8] c"Error division by zero\00"
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
%t0 = add i32 0, 2
%t1 = alloca i32 
store i32 %t0, i32* %t1
br label %label_0
label_0:
%t2 = load i32, i32* %t1
%t3 = add i32 0, 100
%t4 = icmp sle i32 %t2, %t3
br i1 %t4, label %label_1, label %label_2
label_1:
%t5 = add i32 0, 2
%t6 = alloca i32 
store i32 %t5, i32* %t6
%t7 = add i1 0, 1
%t8 = zext i1 %t7 to i32
%t9 = alloca i32 
store i32 %t8, i32* %t9
br label %label_3
label_3:
%t11 = load i32, i32* %t6
%t12 = load i32, i32* %t6
%t10 = mul i32 %t11, %t12
%t13 = load i32, i32* %t1
%t14 = icmp sle i32 %t10, %t13
br i1 %t14, label %label_4, label %label_5
label_4:
%t18 = load i32, i32* %t1
%t19 = load i32, i32* %t6
%t20 = icmp eq i32 %t19, 0
br i1 %t20, label %label_12, label %label_13
label_12:
%t21 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t21)
call void @exit(i32 1)
br label %label_13
label_13:
%t17 = sdiv i32 %t18, %t19
%t22 = load i32, i32* %t6
%t16 = mul i32 %t17, %t22
%t23 = load i32, i32* %t1
%t24 = icmp eq i32 %t16, %t23
br i1 %t24, label %label_8, label %label_10
label_8:
%t25 = load i32, i32* %t1
%t26 = load i32, i32* %t6
%t27 = icmp ne i32 %t25, %t26
br i1 %t27, label %label_9, label %label_10
label_9:
br label %label_11
label_10:
br label %label_11
label_11:
%t15 = phi i1 [ 1, %label_9 ], [ 0, %label_10]
br i1 %t15, label %label_6, label %label_7
label_6:
%t28 = add i1 0, 0
%t29 = zext i1 %t28 to i32
store i32 %t29, i32* %t9
br label %label_5
br label %label_7
label_7:
%t31 = load i32, i32* %t6
%t32 = add i32 0, 1
%t30 = add i32 %t31, %t32
store i32 %t30, i32* %t6
br label %label_3
label_5:
%t34 = load i32, i32* %t9
%t35 = trunc i32 %t34 to i1
br i1 %t35, label %label_16, label %label_18
label_16:
%t36 = load i32, i32* %t1
%t37 = add i32 0, 1
%t38 = icmp ne i32 %t36, %t37
br i1 %t38, label %label_17, label %label_18
label_17:
br label %label_19
label_18:
br label %label_19
label_19:
%t33 = phi i1 [ 1, %label_17 ], [ 0, %label_18]
br i1 %t33, label %label_14, label %label_15
label_14:
%t39 = load i32, i32* %t1
call void @printi(i32 %t39)
br label %label_15
label_15:
%t41 = load i32, i32* %t1
%t42 = add i32 0, 1
%t40 = add i32 %t41, %t42
store i32 %t40, i32* %t1
br label %label_0
label_2:
ret void
ret void
}
