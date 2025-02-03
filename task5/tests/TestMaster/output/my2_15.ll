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
%t0 = add i8 0, 100
%t1 = zext i8 %t0 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t3 = add i8 0, 50
%t4 = zext i8 %t3 to i32
%t5 = alloca i32 
store i32 %t4, i32* %t5
%t7 = load i32, i32* %t2
%t8 = trunc i32 %t7 to i8
%t9 = load i32, i32* %t5
%t10 = trunc i32 %t9 to i8
%t6 = add i8 %t8, %t10
%t11 = zext i8 %t6 to i32
%t12 = alloca i32 
store i32 %t11, i32* %t12
%t14 = load i32, i32* %t2
%t15 = trunc i32 %t14 to i8
%t16 = load i32, i32* %t5
%t17 = trunc i32 %t16 to i8
%t13 = sub i8 %t15, %t17
%t18 = zext i8 %t13 to i32
%t19 = alloca i32 
store i32 %t18, i32* %t19
%t21 = load i32, i32* %t2
%t22 = trunc i32 %t21 to i8
%t23 = load i32, i32* %t5
%t24 = trunc i32 %t23 to i8
%t20 = mul i8 %t22, %t24
%t25 = zext i8 %t20 to i32
%t26 = alloca i32 
store i32 %t25, i32* %t26
%t28 = load i32, i32* %t2
%t29 = trunc i32 %t28 to i8
%t30 = load i32, i32* %t5
%t31 = trunc i32 %t30 to i8
%t32 = icmp eq i8 %t31, 0
br i1 %t32, label %label_0, label %label_1
label_0:
%t33 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t33)
call void @exit(i32 1)
br label %label_1
label_1:
%t27 = udiv i8 %t29, %t31
%t34 = zext i8 %t27 to i32
%t35 = alloca i32 
store i32 %t34, i32* %t35
%t36 = load i32, i32* %t12
%t37 = trunc i32 %t36 to i8
%t38 = zext i8 %t37 to i32
call void @printi(i32 %t38)
%t39 = load i32, i32* %t19
%t40 = trunc i32 %t39 to i8
%t41 = zext i8 %t40 to i32
call void @printi(i32 %t41)
%t42 = load i32, i32* %t26
%t43 = trunc i32 %t42 to i8
%t44 = zext i8 %t43 to i32
call void @printi(i32 %t44)
%t45 = load i32, i32* %t35
%t46 = trunc i32 %t45 to i8
%t47 = zext i8 %t46 to i32
call void @printi(i32 %t47)
ret void
}
