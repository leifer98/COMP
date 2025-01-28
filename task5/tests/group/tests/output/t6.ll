@.str0 = constant [28 x i8] c"a is greater than b, sum = \00"@.str1 = constant [44 x i8] c"a is less than or equal to b, difference = \00"@.str2 = constant [18 x i8] c"a is 5 and b is 3\00"@.str3 = constant [18 x i8] c"a is 10 or b is 3\00"@.str4 = constant [26 x i8] c"Neither condition matched\00"@.str5 = constant [21 x i8] c"a is greater than 10\00"@.str6 = constant [16 x i8] c"a is exactly 10\00"@.str7 = constant [18 x i8] c"a is less than 10\00"
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
%t0 = add i32 0, 5
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = add i32 0, 3
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = alloca i32 
store i32 0, i32* %t4
%t5 = load i32, i32* %t1
%t6 = load i32, i32* %t3
%t7 = icmp sgt i32 %t5, %t6
br i1 %t7, label %label_0, label %label_2
label_0:
%t9 = load i32, i32* %t1
%t10 = load i32, i32* %t3
%t8 = add i32 %t9, %t10
store i32 %t8, i32* %t4
%t11 = getelementptr inbounds [28 x i8], [28 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t11)
%t12 = load i32, i32* %t4
call void @printi(i32 %t12)
br label %label_1
label_2:
%t14 = load i32, i32* %t1
%t15 = load i32, i32* %t3
%t13 = sub i32 %t14, %t15
store i32 %t13, i32* %t4
%t16 = getelementptr inbounds [44 x i8], [44 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t16)
%t17 = load i32, i32* %t4
call void @printi(i32 %t17)
br label %label_1
label_1:
%t19 = load i32, i32* %t1
%t20 = add i32 0, 5
%t21 = icmp eq i32 %t19, %t20
br i1 %t21, label %label_6, label %label_8
label_6:
%t22 = load i32, i32* %t3
%t23 = add i32 0, 3
%t24 = icmp eq i32 %t22, %t23
br i1 %t24, label %label_7, label %label_8
label_7:
br label %label_9
label_8:
br label %label_9
label_9:
%t18 = phi i1 [ 1, %label_7 ], [ 0, %label_8]
br i1 %t18, label %label_3, label %label_5
label_3:
%t25 = getelementptr inbounds [18 x i8], [18 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t25)
br label %label_4
label_5:
%t27 = load i32, i32* %t1
%t28 = add i32 0, 10
%t29 = icmp eq i32 %t27, %t28
br i1 %t29, label %label_14, label %label_13
label_13:
%t30 = load i32, i32* %t3
%t31 = add i32 0, 3
%t32 = icmp eq i32 %t30, %t31
br i1 %t32, label %label_14, label %label_15
label_14:
br label %label_16
label_15:
br label %label_16
label_16:
%t26 = phi i1 [ 1, %label_14 ], [ 0, %label_15]
br i1 %t26, label %label_10, label %label_12
label_10:
%t33 = getelementptr inbounds [18 x i8], [18 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t33)
br label %label_11
label_12:
%t34 = getelementptr inbounds [26 x i8], [26 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t34)
br label %label_11
label_11:
br label %label_4
label_4:
%t35 = load i32, i32* %t1
%t36 = add i32 0, 10
%t37 = icmp sgt i32 %t35, %t36
br i1 %t37, label %label_17, label %label_19
label_17:
%t38 = getelementptr inbounds [21 x i8], [21 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t38)
br label %label_18
label_19:
%t39 = load i32, i32* %t1
%t40 = add i32 0, 10
%t41 = icmp eq i32 %t39, %t40
br i1 %t41, label %label_20, label %label_22
label_20:
%t42 = getelementptr inbounds [16 x i8], [16 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t42)
br label %label_21
label_22:
%t43 = getelementptr inbounds [18 x i8], [18 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t43)
br label %label_21
label_21:
br label %label_18
label_18:
ret void
}
