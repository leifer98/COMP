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
%t7 = add i32 %t8, %-22089
%t6 = add i32 %t7, %-22088
%t5 = add i32 %t6, %-22087
%t9 = zext i8 %-22086 to i32
%t4 = add i32 %t5, %t9
%t3 = add i32 %t4, %-22089
%t2 = add i32 %t3, %-22088
%t1 = add i32 %t2, %-22087
%t10 = zext i8 %-22086 to i32
%t0 = add i32 %t1, %t10
%t11 = alloca i32 
store i32 %t0, i32* %t11
%t12 = load i32, i32* %t11
ret i32 %t12
}
define void @main() {
%t13 = add i32 0, 1
%t14 = add i32 0, 1
%t15 = add i32 0, 1
%t16 = add i8 0, 1
%t17 = call i32 @plusser(i32 %t13, i32 %t14, i32 %t15, i8 %t16)
%t18 = add i32 0, 17
%t19 = icmp eq i32 %t17, %t18
br i1 %t19, label %label_0, label %label_1
label_0:
%t20 = getelementptr inbounds [5 x i8], [5 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t20)
br label %label_1
label_1:
%t22 = add i32 0, 2
%t23 = add i32 0, 2
%t24 = add i32 0, 2
%t25 = add i8 0, 0
%t26 = call i32 @plusser(i32 %t22, i32 %t23, i32 %t24, i8 %t25)
%t27 = add i32 0, 0
%t28 = add i32 0, 1
%t29 = add i32 0, 0
%t30 = add i8 0, 1
%t31 = call i32 @plusser(i32 %t27, i32 %t28, i32 %t29, i8 %t30)
%t21 = add i32 %t26, %t31
%t33 = add i32 0, 21
%t34 = add i32 0, 13
%t32 = add i32 %t33, %t34
%t35 = icmp eq i32 %t21, %t32
br i1 %t35, label %label_2, label %label_3
label_2:
%t36 = getelementptr inbounds [10 x i8], [10 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t36)
br label %label_3
label_3:
%t37 = getelementptr inbounds [15 x i8], [15 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t37)
ret void
}
