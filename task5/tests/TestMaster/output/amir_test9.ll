@.str0 = constant [5 x i8] c"skip\00"@.str1 = constant [5 x i8] c"skip\00"@.str2 = constant [17 x i8] c"should not print\00"@.str3 = constant [17 x i8] c"should not print\00"@.str4 = constant [23 x i8] c"Error division by zero\00"
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
%t0 = add i32 0, 8
%t1 = alloca i32 
store i32 %t0, i32* %t1
br label %label_0
label_0:
%t2 = load i32, i32* %t1
%t3 = add i32 0, 0
%t4 = icmp sgt i32 %t2, %t3
br i1 %t4, label %label_1, label %label_2
label_1:
%t5 = load i32, i32* %t1
%t6 = add i32 0, 3
%t7 = icmp eq i32 %t5, %t6
br i1 %t7, label %label_3, label %label_4
label_3:
%t8 = getelementptr inbounds [5 x i8], [5 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t8)
%t10 = load i32, i32* %t1
%t11 = add i32 0, 1
%t9 = sub i32 %t10, %t11
store i32 %t9, i32* %t1
br label %label_0
br label %label_4
label_4:
%t12 = load i32, i32* %t1
call void @printi(i32 %t12)
%t14 = load i32, i32* %t1
%t15 = add i32 0, 1
%t13 = sub i32 %t14, %t15
store i32 %t13, i32* %t1
br label %label_0
label_2:
%t16 = add i32 0, 10
%t17 = alloca i32 
store i32 %t16, i32* %t17
%t18 = load i32, i32* %t17
%t19 = alloca i32 
store i32 %t18, i32* %t19
br label %label_5
label_5:
%t20 = load i32, i32* %t19
%t21 = add i32 0, 0
%t22 = icmp sgt i32 %t20, %t21
br i1 %t22, label %label_6, label %label_7
label_6:
%t23 = load i32, i32* %t19
store i32 %t23, i32* %t17
%t25 = load i32, i32* %t19
%t26 = add i32 0, 1
%t24 = sub i32 %t25, %t26
store i32 %t24, i32* %t19
%t27 = load i32, i32* %t17
%t28 = add i32 0, 5
%t29 = icmp slt i32 %t27, %t28
br i1 %t29, label %label_8, label %label_9
label_8:
%t30 = getelementptr inbounds [5 x i8], [5 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t30)
br label %label_5
br label %label_9
label_9:
%t31 = load i32, i32* %t17
call void @printi(i32 %t31)
br label %label_5
label_7:
%t32 = add i32 0, 10
%t33 = alloca i32 
store i32 %t32, i32* %t33
br label %label_10
label_10:
%t34 = load i32, i32* %t33
%t35 = add i32 0, 4
%t36 = icmp sgt i32 %t34, %t35
br i1 %t36, label %label_11, label %label_12
label_11:
%t38 = load i32, i32* %t33
%t39 = add i32 0, 2
%t37 = sub i32 %t38, %t39
store i32 %t37, i32* %t33
br label %label_10
%t40 = getelementptr inbounds [17 x i8], [17 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t40)
br label %label_10
label_12:
%t41 = add i32 0, 5000
%t42 = alloca i32 
store i32 %t41, i32* %t42
br label %label_13
label_13:
%t43 = load i32, i32* %t42
%t44 = load i32, i32* %t42
%t45 = icmp slt i32 %t43, %t44
br i1 %t45, label %label_14, label %label_15
label_14:
%t46 = getelementptr inbounds [17 x i8], [17 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t46)
%t49 = load i32, i32* %t1
%t50 = load i32, i32* %t17
%t48 = add i32 %t49, %t50
%t52 = load i32, i32* %t33
%t53 = load i32, i32* %t42
%t54 = icmp eq i32 %t53, 0
br i1 %t54, label %label_16, label %label_17
label_16:
%t55 = getelementptr inbounds [23 x i8], [23 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t55)
call void @exit(i32 1)
br label %label_17
label_17:
%t51 = sdiv i32 %t52, %t53
%t47 = add i32 %t48, %t51
store i32 %t47, i32* %t42
br label %label_13
label_15:
ret void
}
