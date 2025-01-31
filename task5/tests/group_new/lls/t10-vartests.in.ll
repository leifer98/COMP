@.str0 = constant [5 x i8] c"true\00"@.str1 = constant [6 x i8] c"false\00"@.str2 = constant [5 x i8] c"true\00"@.str3 = constant [6 x i8] c"false\00"
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
%t0 = add i8 0, 55
%t1 = zext i8 %t0 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t3 = load i32, i32* %t2
%t4 = trunc i32 %t3 to i8
%t5 = zext i8 %t4 to i32
%t6 = alloca i32 
store i32 %t5, i32* %t6
%t7 = add i8 0, 2
%t8 = zext i8 %t7 to i32
store i32 %t8, i32* %t2
%t9 = load i32, i32* %t2
%t10 = trunc i32 %t9 to i8
%t11 = zext i8 %t10 to i32
call void @printi(i32 %t11)
%t12 = load i32, i32* %t6
%t13 = trunc i32 %t12 to i8
%t14 = zext i8 %t13 to i32
call void @printi(i32 %t14)
%t15 = add i32 0, 101
%t16 = alloca i32 
store i32 %t15, i32* %t16
%t17 = load i32, i32* %t16
%t18 = alloca i32 
store i32 %t17, i32* %t18
%t19 = add i32 0, 1051
store i32 %t19, i32* %t16
%t20 = load i32, i32* %t16
call void @printi(i32 %t20)
%t21 = load i32, i32* %t18
call void @printi(i32 %t21)
%t22 = add i1 0, 1
%t23 = zext i1 %t22 to i32
%t24 = alloca i32 
store i32 %t23, i32* %t24
%t25 = load i32, i32* %t24
%t26 = trunc i32 %t25 to i1
%t27 = zext i1 %t26 to i32
%t28 = alloca i32 
store i32 %t27, i32* %t28
%t29 = add i1 0, 0
%t30 = zext i1 %t29 to i32
store i32 %t30, i32* %t24
%t31 = load i32, i32* %t24
%t32 = trunc i32 %t31 to i1
br i1 %t32, label %label_0, label %label_2
label_0:
%t33 = getelementptr inbounds [5 x i8], [5 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t33)
br label %label_1
label_2:
%t34 = getelementptr inbounds [6 x i8], [6 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t34)
br label %label_1
label_1:
%t35 = load i32, i32* %t28
%t36 = trunc i32 %t35 to i1
br i1 %t36, label %label_3, label %label_5
label_3:
%t37 = getelementptr inbounds [5 x i8], [5 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t37)
br label %label_4
label_5:
%t38 = getelementptr inbounds [6 x i8], [6 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t38)
br label %label_4
label_4:
%t39 = load i32, i32* %t2
%t40 = trunc i32 %t39 to i8
%t41 = zext i8 %t40 to i32
call void @printi(i32 %t41)
%t42 = load i32, i32* %t6
%t43 = trunc i32 %t42 to i8
%t44 = zext i8 %t43 to i32
call void @printi(i32 %t44)
%t45 = load i32, i32* %t16
call void @printi(i32 %t45)
%t46 = load i32, i32* %t18
call void @printi(i32 %t46)
ret void
}
