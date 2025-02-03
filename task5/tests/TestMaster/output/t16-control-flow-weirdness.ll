@.str0 = constant [12 x i8] c"already? :(\00"@.str1 = constant [3 x i8] c"ok\00"@.str2 = constant [8 x i8] c"alright\00"@.str3 = constant [6 x i8] c"back!\00"@.str4 = constant [6 x i8] c"here!\00"@.str5 = constant [6 x i8] c"great\00"
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
define i32 @foo(i1, i32, i8) {
%t0 = alloca i32 
store i32 %1, i32* %t0
%t1 = zext i8 %2 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t3 = xor i1 1, %0
br i1 %t3, label %label_0, label %label_1
label_0:
%t4 = getelementptr inbounds [12 x i8], [12 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t4)
%t5 = add i32 0, 15
ret i32 %t5
br label %label_1
label_1:
%t6 = getelementptr inbounds [3 x i8], [3 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t6)
br label %label_2
label_2:
%t7 = load i32, i32* %t0
%t8 = add i32 0, 10
%t9 = icmp slt i32 %t7, %t8
br i1 %t9, label %label_3, label %label_4
label_3:
%t11 = load i32, i32* %t0
%t12 = add i32 0, 1
%t10 = add i32 %t11, %t12
store i32 %t10, i32* %t0
br i1 %0, label %label_7, label %label_9
label_7:
%t14 = load i32, i32* %t0
%t15 = add i32 0, 7
%t16 = icmp eq i32 %t14, %t15
br i1 %t16, label %label_8, label %label_9
label_8:
br label %label_10
label_9:
br label %label_10
label_10:
%t13 = phi i1 [ 1, %label_8 ], [ 0, %label_9]
br i1 %t13, label %label_5, label %label_6
label_5:
%t17 = load i32, i32* %t0
call void @printi(i32 %t17)
%t18 = getelementptr inbounds [8 x i8], [8 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t18)
%t19 = add i32 0, 17
ret i32 %t19
br label %label_6
label_6:
br label %label_2
label_4:
br label %label_11
label_11:
%t20 = load i32, i32* %t2
%t21 = trunc i32 %t20 to i8
%t22 = add i8 0, 12
%t24 = zext i8 %t21 to i32
%t25 = zext i8 %t22 to i32
%t23 = icmp sgt i32 %t24, %t25
br i1 %t23, label %label_12, label %label_13
label_12:
%t27 = load i32, i32* %t2
%t28 = trunc i32 %t27 to i8
%t29 = add i8 0, 1
%t26 = sub i8 %t28, %t29
%t30 = zext i8 %t26 to i32
store i32 %t30, i32* %t2
%t31 = load i32, i32* %t2
%t32 = trunc i32 %t31 to i8
%t33 = zext i8 %t32 to i32
call void @printi(i32 %t33)
%t34 = getelementptr inbounds [6 x i8], [6 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t34)
%t35 = add i32 0, 18
ret i32 %t35
br label %label_11
label_13:
%t36 = getelementptr inbounds [6 x i8], [6 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t36)
%t37 = add i32 0, 322
ret i32 %t37
}
define i1 @opposite(i1) {
br label %label_14
label_14:
%t38 = add i1 0, 1
br i1 %t38, label %label_15, label %label_16
label_15:
br label %label_17
label_17:
%t39 = add i1 0, 1
br i1 %t39, label %label_18, label %label_19
label_18:
br label %label_20
label_20:
%t40 = add i1 0, 1
br i1 %t40, label %label_21, label %label_22
label_21:
br label %label_23
label_23:
%t41 = add i1 0, 1
br i1 %t41, label %label_24, label %label_25
label_24:
br label %label_26
label_26:
%t42 = add i1 0, 1
br i1 %t42, label %label_27, label %label_28
label_27:
%t43 = xor i1 1, %0
ret i1 %t43
br label %label_26
label_28:
br label %label_25
br label %label_23
label_25:
br label %label_20
label_22:
br label %label_17
label_19:
br label %label_14
label_16:
%t44 = xor i1 1, %0
ret i1 %t44
}
define i8 @multiply(i8, i8) {
%t45 = mul i8 %0, %1
ret i8 %t45
}
define void @main() {
%t46 = add i1 0, 0
%t47 = add i32 0, 5
%t48 = add i8 0, 15
%t49 = call i32 @foo(i1 %t46, i32 %t47, i8 %t48)
call void @printi(i32 %t49)
%t50 = add i1 0, 1
%t51 = add i32 0, 5
%t52 = add i8 0, 21
%t53 = call i32 @foo(i1 %t50, i32 %t51, i8 %t52)
call void @printi(i32 %t53)
%t54 = add i1 0, 1
%t55 = add i32 0, 11
%t56 = add i8 0, 4
%t57 = call i32 @foo(i1 %t54, i32 %t55, i8 %t56)
call void @printi(i32 %t57)
%t58 = add i1 0, 1
%t59 = add i32 0, 10
%t60 = add i8 0, 13
%t61 = call i32 @foo(i1 %t58, i32 %t59, i8 %t60)
call void @printi(i32 %t61)
%t62 = add i1 0, 0
%t63 = call i1 @opposite(i1 %t62)
br i1 %t63, label %label_29, label %label_30
label_29:
%t64 = getelementptr inbounds [6 x i8], [6 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t64)
br label %label_30
label_30:
%t65 = add i8 0, 16
%t66 = add i8 0, 16
%t67 = call i8 @multiply(i8 %t65, i8 %t66)
%t68 = zext i8 %t67 to i32
call void @printi(i32 %t68)
ret void
}
