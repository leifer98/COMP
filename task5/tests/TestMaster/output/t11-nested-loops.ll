@.str0 = constant [23 x i8] c"Error division by zero\00"@.str1 = constant [23 x i8] c"Error division by zero\00"@.str2 = constant [6 x i8] c"FIRE!\00"@.str3 = constant [2 x i8] c"*\00"@.str4 = constant [23 x i8] c"Error division by zero\00"@.str5 = constant [2 x i8] c"-\00"
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
%t29 = icmp eq i32 %t28, 0
br i1 %t29, label %label_8, label %label_9
label_8:
%t30 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t30)
call void @exit(i32 1)
br label %label_9
label_9:
%t22 = sdiv i32 %t23, %t28
%t31 = add i32 0, 10
%t21 = mul i32 %t22, %t31
%t15 = sub i32 %t16, %t21
%t32 = add i32 0, 0
%t33 = icmp eq i32 %t15, %t32
br i1 %t33, label %label_6, label %label_7
label_6:
br label %label_5
br label %label_7
label_7:
%t34 = add i32 0, 0
%t35 = alloca i32 
store i32 %t34, i32* %t35
br label %label_10
label_10:
%t36 = load i32, i32* %t35
%t38 = load i32, i32* %t1
%t39 = load i32, i32* %t4
%t40 = trunc i32 %t39 to i8
%t41 = zext i8 %t40 to i32
%t37 = mul i32 %t38, %t41
%t42 = icmp slt i32 %t36, %t37
br i1 %t42, label %label_11, label %label_12
label_11:
%t44 = load i32, i32* %t35
%t45 = add i32 0, 1
%t43 = add i32 %t44, %t45
store i32 %t43, i32* %t35
%t47 = load i32, i32* %t35
%t48 = add i32 0, 2
%t49 = icmp eq i32 %t48, 0
br i1 %t49, label %label_15, label %label_16
label_15:
%t50 = getelementptr inbounds [23 x i8], [23 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t50)
call void @exit(i32 1)
br label %label_16
label_16:
%t46 = sdiv i32 %t47, %t48
%t51 = add i32 0, 0
%t52 = icmp eq i32 %t46, %t51
br i1 %t52, label %label_13, label %label_14
label_13:
%t53 = getelementptr inbounds [6 x i8], [6 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t53)
br label %label_10
br label %label_14
label_14:
%t54 = getelementptr inbounds [2 x i8], [2 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t54)
%t56 = load i32, i32* %t35
%t59 = load i32, i32* %t35
%t60 = add i32 0, 2
%t61 = icmp eq i32 %t60, 0
br i1 %t61, label %label_19, label %label_20
label_19:
%t62 = getelementptr inbounds [23 x i8], [23 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t62)
call void @exit(i32 1)
br label %label_20
label_20:
%t58 = sdiv i32 %t59, %t60
%t63 = add i32 0, 2
%t57 = mul i32 %t58, %t63
%t55 = sub i32 %t56, %t57
%t64 = add i32 0, 0
%t65 = icmp eq i32 %t55, %t64
br i1 %t65, label %label_17, label %label_18
label_17:
%t66 = getelementptr inbounds [2 x i8], [2 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t66)
br label %label_10
br label %label_18
label_18:
br label %label_10
label_12:
%t68 = load i32, i32* %t4
%t69 = trunc i32 %t68 to i8
%t70 = add i8 0, 1
%t67 = add i8 %t69, %t70
%t71 = zext i8 %t67 to i32
store i32 %t71, i32* %t4
br label %label_3
label_5:
%t73 = load i32, i32* %t1
%t74 = add i32 0, 1
%t72 = add i32 %t73, %t74
store i32 %t72, i32* %t1
br label %label_0
label_2:
ret void
}
