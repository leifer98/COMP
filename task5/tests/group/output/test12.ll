@.str0 = constant [5 x i8] c"good\00"@.str1 = constant [10 x i8] c"very good\00"@.str2 = constant [15 x i8] c"fail, im sorry\00"
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
define i32 @plusser(i32, i32, i32, i8) {
%t8 = add i32 0, 9
%t7 = add i32 %t8, %0
%t6 = add i32 %t7, %1
%t5 = add i32 %t6, %2
%t9 = zext i8 %3 to i32
%t4 = add i32 %t5, %t9
%t3 = add i32 %t4, %0
%t2 = add i32 %t3, %1
%t1 = add i32 %t2, %2
%t10 = zext i8 %3 to i32
%t0 = add i32 %t1, %t10
%y = alloca i32 
store i32 %t0, i32* %y
%t11 = load i32, i32* %y
ret i32 %t11
}
define void @main() {
%t12 = add i32 0, 1
%t13 = add i32 0, 1
%t14 = add i32 0, 1
%t15 = add i8 0, 1
%t16 = call i32 @plusser(i32 %t12, i32 %t13, i32 %t14, i8 %t15)
%t17 = add i32 0, 17
%t18 = icmp eq i32 %t16, %t17
br i1 %t18, label %label_0, label %label_1
label_0:
%t19 = getelementptr inbounds [5 x i8], [5 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t19)
br label %label_1
label_1:
%t21 = add i32 0, 2
%t22 = add i32 0, 2
%t23 = add i32 0, 2
%t24 = add i8 0, 0
%t25 = call i32 @plusser(i32 %t21, i32 %t22, i32 %t23, i8 %t24)
%t26 = add i32 0, 0
%t27 = add i32 0, 1
%t28 = add i32 0, 0
%t29 = add i8 0, 1
%t30 = call i32 @plusser(i32 %t26, i32 %t27, i32 %t28, i8 %t29)
%t20 = add i32 %t25, %t30
%t32 = add i32 0, 21
%t33 = add i32 0, 13
%t31 = add i32 %t32, %t33
%t34 = icmp eq i32 %t20, %t31
br i1 %t34, label %label_2, label %label_3
label_2:
%t35 = getelementptr inbounds [10 x i8], [10 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t35)
br label %label_3
label_3:
%t36 = getelementptr inbounds [15 x i8], [15 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t36)
ret void
}
