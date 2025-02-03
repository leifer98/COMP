@.str0 = constant [23 x i8] c"Error division by zero\00"@.str1 = constant [23 x i8] c"Error division by zero\00"@.str2 = constant [23 x i8] c"Error division by zero\00"@.str3 = constant [23 x i8] c"Error division by zero\00"
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
%t1 = add i32 0, 3
%t2 = add i32 0, 3
%t0 = add i32 %t1, %t2
call void @printi(i32 %t0)
%t4 = add i32 0, 3
%t5 = add i32 0, 3
%t3 = sub i32 %t4, %t5
call void @printi(i32 %t3)
%t7 = add i32 0, 3
%t8 = add i32 0, 3
%t6 = mul i32 %t7, %t8
call void @printi(i32 %t6)
%t10 = add i32 0, 3
%t11 = add i32 0, 3
%t12 = icmp eq i32 %t11, 0
br i1 %t12, label %label_0, label %label_1
label_0:
%t13 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t13)
call void @exit(i32 1)
br label %label_1
label_1:
%t9 = sdiv i32 %t10, %t11
call void @printi(i32 %t9)
%t15 = add i32 0, 3
%t17 = add i32 0, 3
%t18 = add i32 0, 2
%t16 = mul i32 %t17, %t18
%t14 = add i32 %t15, %t16
call void @printi(i32 %t14)
%t20 = add i32 0, 3
%t22 = add i32 0, 2
%t23 = add i32 0, 3
%t21 = mul i32 %t22, %t23
%t19 = sub i32 %t20, %t21
call void @printi(i32 %t19)
%t26 = add i32 0, 3
%t27 = add i32 0, 3
%t25 = mul i32 %t26, %t27
%t28 = add i32 0, 1
%t29 = icmp eq i32 %t28, 0
br i1 %t29, label %label_2, label %label_3
label_2:
%t30 = getelementptr inbounds [23 x i8], [23 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t30)
call void @exit(i32 1)
br label %label_3
label_3:
%t24 = sdiv i32 %t25, %t28
call void @printi(i32 %t24)
%t32 = add i32 0, 3
%t34 = add i32 0, 3
%t35 = add i32 0, 2
%t33 = mul i32 %t34, %t35
%t31 = add i32 %t32, %t33
call void @printi(i32 %t31)
%t37 = add i32 0, 3
%t39 = add i32 0, 2
%t40 = add i32 0, 3
%t38 = mul i32 %t39, %t40
%t36 = sub i32 %t37, %t38
call void @printi(i32 %t36)
%t44 = add i32 0, 3
%t45 = add i32 0, 3
%t43 = mul i32 %t44, %t45
%t47 = add i32 0, 3
%t48 = add i32 0, 1
%t49 = icmp eq i32 %t48, 0
br i1 %t49, label %label_4, label %label_5
label_4:
%t50 = getelementptr inbounds [23 x i8], [23 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t50)
call void @exit(i32 1)
br label %label_5
label_5:
%t46 = sdiv i32 %t47, %t48
%t42 = add i32 %t43, %t46
%t53 = add i32 0, 2
%t54 = add i32 0, 3
%t52 = mul i32 %t53, %t54
%t55 = add i32 0, 2
%t56 = icmp eq i32 %t55, 0
br i1 %t56, label %label_6, label %label_7
label_6:
%t57 = getelementptr inbounds [23 x i8], [23 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t57)
call void @exit(i32 1)
br label %label_7
label_7:
%t51 = sdiv i32 %t52, %t55
%t41 = sub i32 %t42, %t51
call void @printi(i32 %t41)
ret void
}
