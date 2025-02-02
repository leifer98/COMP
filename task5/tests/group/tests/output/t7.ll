@.str0 = constant [23 x i8] c"Error division by zero\00"@.str1 = constant [35 x i8] c"Result of x + y - 2 * 4 / 2 + 8:  \00"@.str2 = constant [35 x i8] c"Result of (x + y) * (2 - 4) + 6:  \00"@.str3 = constant [23 x i8] c"Error division by zero\00"@.str4 = constant [35 x i8] c"Result of x * y + 2 - 3 * 5 / 2:  \00"
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
%t0 = add i32 0, 10
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = add i32 0, 5
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = alloca i32 
store i32 0, i32* %t4
%t8 = load i32, i32* %t1
%t9 = load i32, i32* %t3
%t7 = add i32 %t8, %t9
%t12 = add i32 0, 2
%t13 = add i32 0, 4
%t11 = mul i32 %t12, %t13
%t14 = add i32 0, 2
%t15 = icmp eq i32 %t14, 0
br i1 %t15, label %label_0, label %label_1
label_0:
%t16 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t16)
call void @exit(i32 1)
br label %label_1
label_1:
%t10 = udiv i32 %t11, %t14
%t6 = sub i32 %t7, %t10
%t17 = add i32 0, 8
%t5 = add i32 %t6, %t17
store i32 %t5, i32* %t4
%t18 = getelementptr inbounds [35 x i8], [35 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t18)
%t19 = load i32, i32* %t4
call void @printi(i32 %t19)
%t23 = load i32, i32* %t1
%t24 = load i32, i32* %t3
%t22 = add i32 %t23, %t24
%t26 = add i32 0, 2
%t27 = add i32 0, 4
%t25 = sub i32 %t26, %t27
%t21 = mul i32 %t22, %t25
%t28 = add i32 0, 6
%t20 = add i32 %t21, %t28
store i32 %t20, i32* %t4
%t29 = getelementptr inbounds [35 x i8], [35 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t29)
%t30 = load i32, i32* %t4
call void @printi(i32 %t30)
%t34 = load i32, i32* %t1
%t35 = load i32, i32* %t3
%t33 = mul i32 %t34, %t35
%t36 = add i32 0, 2
%t32 = add i32 %t33, %t36
%t39 = add i32 0, 3
%t40 = add i32 0, 5
%t38 = mul i32 %t39, %t40
%t41 = add i32 0, 2
%t42 = icmp eq i32 %t41, 0
br i1 %t42, label %label_2, label %label_3
label_2:
%t43 = getelementptr inbounds [23 x i8], [23 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t43)
call void @exit(i32 1)
br label %label_3
label_3:
%t37 = udiv i32 %t38, %t41
%t31 = sub i32 %t32, %t37
store i32 %t31, i32* %t4
%t44 = getelementptr inbounds [35 x i8], [35 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t44)
%t45 = load i32, i32* %t4
call void @printi(i32 %t45)
ret void
ret void
}
