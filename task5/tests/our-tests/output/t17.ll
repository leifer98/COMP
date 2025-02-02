@.str0 = constant [23 x i8] c"Error division by zero\00"@.str1 = constant [23 x i8] c"Error division by zero\00"@.str2 = constant [23 x i8] c"Error division by zero\00"@.str3 = constant [23 x i8] c"Error division by zero\00"@.str4 = constant [23 x i8] c"Error division by zero\00"@.str5 = constant [23 x i8] c"Error division by zero\00"
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
%t0 = add i32 0, 20
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t3 = load i32, i32* %t1
%t4 = add i32 0, 40
%t2 = sub i32 %t3, %t4
store i32 %t2, i32* %t1
%t5 = add i32 0, 5
%t6 = alloca i32 
store i32 %t5, i32* %t6
%t8 = load i32, i32* %t6
%t9 = add i32 0, 10
%t7 = sub i32 %t8, %t9
store i32 %t7, i32* %t6
%t11 = load i32, i32* %t1
%t12 = add i8 0, 5
%t13 = icmp eq i8 %t12, 0
br i1 %t13, label %label_0, label %label_1
label_0:
%t14 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t14)
call void @exit(i32 1)
br label %label_1
label_1:
%t15 = zext i8 %t12 to i32
%t10 = sdiv i32 %t11, %t15
call void @printi(i32 %t10)
%t17 = load i32, i32* %t1
%t18 = load i32, i32* %t6
%t19 = icmp eq i32 %t18, 0
br i1 %t19, label %label_2, label %label_3
label_2:
%t20 = getelementptr inbounds [23 x i8], [23 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t20)
call void @exit(i32 1)
br label %label_3
label_3:
%t16 = sdiv i32 %t17, %t18
call void @printi(i32 %t16)
%t22 = load i32, i32* %t1
%t23 = add i32 0, 19
%t21 = add i32 %t22, %t23
store i32 %t21, i32* %t1
%t25 = load i32, i32* %t1
%t26 = add i8 0, 10
%t27 = icmp eq i8 %t26, 0
br i1 %t27, label %label_4, label %label_5
label_4:
%t28 = getelementptr inbounds [23 x i8], [23 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t28)
call void @exit(i32 1)
br label %label_5
label_5:
%t29 = zext i8 %t26 to i32
%t24 = sdiv i32 %t25, %t29
call void @printi(i32 %t24)
%t31 = load i32, i32* %t1
%t32 = add i8 0, 1
%t33 = icmp eq i8 %t32, 0
br i1 %t33, label %label_6, label %label_7
label_6:
%t34 = getelementptr inbounds [23 x i8], [23 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t34)
call void @exit(i32 1)
br label %label_7
label_7:
%t35 = zext i8 %t32 to i32
%t30 = sdiv i32 %t31, %t35
call void @printi(i32 %t30)
%t37 = load i32, i32* %t1
%t38 = load i32, i32* %t6
%t39 = icmp eq i32 %t38, 0
br i1 %t39, label %label_8, label %label_9
label_8:
%t40 = getelementptr inbounds [23 x i8], [23 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t40)
call void @exit(i32 1)
br label %label_9
label_9:
%t36 = sdiv i32 %t37, %t38
call void @printi(i32 %t36)
%t42 = load i32, i32* %t1
%t43 = load i32, i32* %t6
%t41 = mul i32 %t42, %t43
call void @printi(i32 %t41)
%t45 = add i8 0, 245
%t46 = add i8 0, 5
%t47 = icmp eq i8 %t46, 0
br i1 %t47, label %label_10, label %label_11
label_10:
%t48 = getelementptr inbounds [23 x i8], [23 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t48)
call void @exit(i32 1)
br label %label_11
label_11:
%t44 = udiv i8 %t45, %t46
%t49 = zext i8 %t44 to i32
call void @printi(i32 %t49)
ret void
}
