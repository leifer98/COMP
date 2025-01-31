@.str0 = constant [6 x i8] c"FIRE!\00"@.str1 = constant [2 x i8] c"*\00"@.str2 = constant [2 x i8] c"-\00"
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
%t2 = add i8 0, 1
%t3 = zext i8 %t2 to i32
%t4 = alloca i32 
store i32 %t3, i32* %t4
br label %label_0
label_0:
%t5 = load i32, i32* %t1
%t6 = add i32 0, 12
%t7 = icmp slt i32 %t5, %t6
br i1 %t7, label %label_1, label %label_2
label_1:
%t8 = add i8 0, 1
%t9 = zext i8 %t8 to i32
store i32 %t9, i32* %t4
br label %label_3
label_3:
%t10 = load i32, i32* %t4
%t11 = trunc i32 %t10 to i8
%t12 = add i32 0, 12
%t14 = zext i8 %t11 to i32
%t13 = icmp slt i32 %t14, %t12
br i1 %t13, label %label_4, label %label_5
label_4:
%t17 = load i32, i32* %t1
%t18 = load i32, i32* %t4
%t19 = trunc i32 %t18 to i8
%t20 = zext i8 %t19 to i32
%t16 = mul i32 %t17, %t20
%t24 = load i32, i32* %t1
%t25 = load i32, i32* %t4
%t26 = trunc i32 %t25 to i8
%t27 = zext i8 %t26 to i32
%t23 = mul i32 %t24, %t27
%t28 = add i32 0, 10
%t22 = udiv i32 %t23, %t28
%t29 = add i32 0, 10
%t21 = mul i32 %t22, %t29
%t15 = sub i32 %t16, %t21
%t30 = add i32 0, 0
%t31 = icmp eq i32 %t15, %t30
br i1 %t31, label %label_6, label %label_7
label_6:
br label %label_5
br label %label_7
label_7:
%t32 = add i32 0, 0
%t33 = alloca i32 
store i32 %t32, i32* %t33
br label %label_8
label_8:
%t34 = load i32, i32* %t33
%t36 = load i32, i32* %t1
%t37 = load i32, i32* %t4
%t38 = trunc i32 %t37 to i8
%t39 = zext i8 %t38 to i32
%t35 = mul i32 %t36, %t39
%t40 = icmp slt i32 %t34, %t35
br i1 %t40, label %label_9, label %label_10
label_9:
%t42 = load i32, i32* %t33
%t43 = add i32 0, 1
%t41 = add i32 %t42, %t43
store i32 %t41, i32* %t33
%t45 = load i32, i32* %t33
%t46 = add i32 0, 2
%t44 = udiv i32 %t45, %t46
%t47 = add i32 0, 0
%t48 = icmp eq i32 %t44, %t47
br i1 %t48, label %label_11, label %label_12
label_11:
%t49 = getelementptr inbounds [6 x i8], [6 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t49)
br label %label_8
br label %label_12
label_12:
%t50 = getelementptr inbounds [2 x i8], [2 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t50)
%t52 = load i32, i32* %t33
%t55 = load i32, i32* %t33
%t56 = add i32 0, 2
%t54 = udiv i32 %t55, %t56
%t57 = add i32 0, 2
%t53 = mul i32 %t54, %t57
%t51 = sub i32 %t52, %t53
%t58 = add i32 0, 0
%t59 = icmp eq i32 %t51, %t58
br i1 %t59, label %label_13, label %label_14
label_13:
%t60 = getelementptr inbounds [2 x i8], [2 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t60)
br label %label_8
br label %label_14
label_14:
br label %label_8
label_10:
%t62 = load i32, i32* %t4
%t63 = trunc i32 %t62 to i8
%t64 = add i8 0, 1
%t61 = add i8 %t63, %t64
%t65 = zext i8 %t61 to i32
store i32 %t65, i32* %t4
br label %label_3
label_5:
%t67 = load i32, i32* %t1
%t68 = add i32 0, 1
%t66 = add i32 %t67, %t68
store i32 %t66, i32* %t1
br label %label_0
label_2:
ret void
}
