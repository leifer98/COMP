@.str0 = constant [35 x i8] c"Result of x + y - 2 * 4 / 2 + 8:  \00"@.str1 = constant [35 x i8] c"Result of (x + y) * (2 - 4) + 6:  \00"@.str2 = constant [35 x i8] c"Result of x * y + 2 - 3 * 5 / 2:  \00"
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
%t10 = sdiv i32 %t11, %t14
%t6 = sub i32 %t7, %t10
%t15 = add i32 0, 8
%t5 = add i32 %t6, %t15
store i32 %t5, i32* %t4
%t16 = getelementptr inbounds [35 x i8], [35 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t16)
%t17 = load i32, i32* %t4
call void @printi(i32 %t17)
%t21 = load i32, i32* %t1
%t22 = load i32, i32* %t3
%t20 = add i32 %t21, %t22
%t24 = add i32 0, 2
%t25 = add i32 0, 4
%t23 = sub i32 %t24, %t25
%t19 = mul i32 %t20, %t23
%t26 = add i32 0, 6
%t18 = add i32 %t19, %t26
store i32 %t18, i32* %t4
%t27 = getelementptr inbounds [35 x i8], [35 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t27)
%t28 = load i32, i32* %t4
call void @printi(i32 %t28)
%t32 = load i32, i32* %t1
%t33 = load i32, i32* %t3
%t31 = mul i32 %t32, %t33
%t34 = add i32 0, 2
%t30 = add i32 %t31, %t34
%t37 = add i32 0, 3
%t38 = add i32 0, 5
%t36 = mul i32 %t37, %t38
%t39 = add i32 0, 2
%t35 = sdiv i32 %t36, %t39
%t29 = sub i32 %t30, %t35
store i32 %t29, i32* %t4
%t40 = getelementptr inbounds [35 x i8], [35 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t40)
%t41 = load i32, i32* %t4
call void @printi(i32 %t41)
ret void
ret void
}
