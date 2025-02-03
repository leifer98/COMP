@.str0 = constant [5 x i8] c"true\00"@.str1 = constant [6 x i8] c"false\00"@.str2 = constant [5 x i8] c"true\00"@.str3 = constant [6 x i8] c"false\00"@.str4 = constant [5 x i8] c"true\00"@.str5 = constant [6 x i8] c"false\00"
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
define i32 @func1() {
%t2 = add i32 0, 1
%t4 = add i32 0, 2
%t5 = add i32 0, 3
%t3 = mul i32 %t4, %t5
%t1 = add i32 %t2, %t3
%t6 = add i32 0, 4
%t0 = add i32 %t1, %t6
ret i32 %t0
}
define i8 @func2() {
%t7 = add i8 0, 100
ret i8 %t7
}
define i1 @func3() {
%t8 = add i1 0, 1
ret i1 %t8
}
define i32 @func4() {
%t9 = add i8 0, 67
%t10 = zext i8 %t9 to i32
ret i32 %t10
}
define i1 @func5(i1) {
br i1 %0, label %label_1, label %label_0
label_0:
%t12 = xor i1 1, %0
br i1 %t12, label %label_1, label %label_2
label_1:
br label %label_3
label_2:
br label %label_3
label_3:
%t11 = phi i1 [ 1, %label_1 ], [ 0, %label_2]
ret i1 %t11
}
define i32 @func6(i8) {
%t14 = add i32 0, 3
%t15 = zext i8 %0 to i32
%t13 = add i32 %t15, %t14
ret i32 %t13
}
define i1 @func7(i8, i32) {
%t18 = zext i8 %0 to i32
%t17 = icmp sle i32 %t18, %1
br i1 %t17, label %label_4, label %label_6
label_4:
%t20 = zext i8 %0 to i32
%t19 = icmp ne i32 %t20, %1
br i1 %t19, label %label_5, label %label_6
label_5:
br label %label_7
label_6:
br label %label_7
label_7:
%t16 = phi i1 [ 1, %label_5 ], [ 0, %label_6]
ret i1 %t16
}
define void @main() {
%t21 = call i32 @func1()
call void @printi(i32 %t21)
%t22 = call i8 @func2()
%t23 = zext i8 %t22 to i32
call void @printi(i32 %t23)
%t24 = call i1 @func3()
br i1 %t24, label %label_8, label %label_10
label_8:
%t25 = getelementptr inbounds [5 x i8], [5 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t25)
br label %label_9
label_10:
%t26 = getelementptr inbounds [6 x i8], [6 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t26)
br label %label_9
label_9:
%t27 = call i32 @func4()
call void @printi(i32 %t27)
%t28 = add i1 0, 1
%t29 = call i1 @func5(i1 %t28)
br i1 %t29, label %label_11, label %label_13
label_11:
%t30 = getelementptr inbounds [5 x i8], [5 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t30)
br label %label_12
label_13:
%t31 = getelementptr inbounds [6 x i8], [6 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t31)
br label %label_12
label_12:
%t32 = add i8 0, 2
%t33 = call i32 @func6(i8 %t32)
call void @printi(i32 %t33)
%t34 = add i8 0, 5
%t35 = add i32 0, 100
%t36 = call i1 @func7(i8 %t34, i32 %t35)
br i1 %t36, label %label_14, label %label_16
label_14:
%t37 = getelementptr inbounds [5 x i8], [5 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t37)
br label %label_15
label_16:
%t38 = getelementptr inbounds [6 x i8], [6 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t38)
br label %label_15
label_15:
ret void
}
