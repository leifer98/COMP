
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
%t0 = add i32 0, 0
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = add i32 0, 0
%t3 = alloca i32 
store i32 %t2, i32* %t3
br label %label_0
label_0:
%t4 = load i32, i32* %t3
%t5 = add i32 0, 3
%t6 = icmp slt i32 %t4, %t5
br i1 %t6, label %label_1, label %label_2
label_1:
%t7 = add i32 0, 0
%t8 = alloca i32 
store i32 %t7, i32* %t8
br label %label_3
label_3:
%t9 = load i32, i32* %t8
%t10 = add i32 0, 3
%t11 = icmp slt i32 %t9, %t10
br i1 %t11, label %label_4, label %label_5
label_4:
%t12 = add i32 0, 0
%t13 = alloca i32 
store i32 %t12, i32* %t13
br label %label_6
label_6:
%t14 = load i32, i32* %t13
%t15 = add i32 0, 3
%t16 = icmp slt i32 %t14, %t15
br i1 %t16, label %label_7, label %label_8
label_7:
%t18 = load i32, i32* %t1
%t19 = add i32 0, 1
%t17 = add i32 %t18, %t19
store i32 %t17, i32* %t1
%t21 = load i32, i32* %t13
%t22 = add i32 0, 1
%t20 = add i32 %t21, %t22
store i32 %t20, i32* %t13
br label %label_6
label_8:
%t24 = load i32, i32* %t8
%t25 = add i32 0, 1
%t23 = add i32 %t24, %t25
store i32 %t23, i32* %t8
br label %label_3
label_5:
%t27 = load i32, i32* %t3
%t28 = add i32 0, 1
%t26 = add i32 %t27, %t28
store i32 %t26, i32* %t3
br label %label_0
label_2:
%t29 = load i32, i32* %t1
call void @printi(i32 %t29)
ret void
}
