
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
%t1 = add i32 0, 0
%t2 = add i32 0, 6
%t0 = sub i32 %t1, %t2
call void @printi(i32 %t0)
%t4 = add i8 0, 0
%t5 = add i32 0, 2
%t6 = zext i8 %t4 to i32
%t3 = sub i32 %t6, %t5
call void @printi(i32 %t3)
%t8 = add i8 0, 0
%t9 = add i8 0, 5
%t7 = sub i8 %t8, %t9
%t10 = zext i8 %t7 to i32
call void @printi(i32 %t10)
%t12 = add i32 0, 2147483647
%t13 = add i32 0, 2
%t11 = add i32 %t12, %t13
call void @printi(i32 %t11)
%t15 = add i32 0, 214748365
%t16 = add i8 0, 10
%t17 = zext i8 %t16 to i32
%t14 = mul i32 %t15, %t17
call void @printi(i32 %t14)
%t19 = add i8 0, 255
%t20 = add i8 0, 2
%t18 = add i8 %t19, %t20
%t21 = zext i8 %t18 to i32
call void @printi(i32 %t21)
%t23 = add i8 0, 128
%t24 = add i8 0, 2
%t22 = mul i8 %t23, %t24
%t25 = zext i8 %t22 to i32
call void @printi(i32 %t25)
%t27 = add i32 0, 1000
%t28 = add i8 0, 10
%t29 = zext i8 %t28 to i32
%t26 = udiv i32 %t27, %t29
call void @printi(i32 %t26)
%t31 = add i8 0, 200
%t32 = add i8 0, 5
%t30 = udiv i8 %t31, %t32
%t33 = zext i8 %t30 to i32
call void @printi(i32 %t33)
ret void
}
