@.str0 = constant [7 x i8] c"equal!\00"@.str1 = constant [17 x i8] c"shouldn't happen\00"@.str2 = constant [9 x i8] c"smaller!\00"@.str3 = constant [17 x i8] c"shouldn't happen\00"@.str4 = constant [23 x i8] c"Error division by zero\00"@.str5 = constant [20 x i8] c"short circuit works\00"@.str6 = constant [23 x i8] c"Error division by zero\00"@.str7 = constant [32 x i8] c"wrong but at least didn't crash\00"@.str8 = constant [5 x i8] c"good\00"
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
%t0 = add i32 0, 100
%t1 = add i8 0, 100
%t3 = zext i8 %t1 to i32
%t2 = icmp eq i32 %t0, %t3
br i1 %t2, label %label_0, label %label_2
label_0:
%t4 = getelementptr inbounds [7 x i8], [7 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t4)
br label %label_1
label_2:
%t5 = getelementptr inbounds [17 x i8], [17 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t5)
br label %label_1
label_1:
%t6 = add i32 0, 5
%t7 = add i8 0, 6
%t9 = zext i8 %t7 to i32
%t8 = icmp slt i32 %t6, %t9
br i1 %t8, label %label_3, label %label_5
label_3:
%t10 = getelementptr inbounds [9 x i8], [9 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t10)
br label %label_4
label_5:
%t11 = getelementptr inbounds [17 x i8], [17 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t11)
br label %label_4
label_4:
%t13 = add i8 0, 4
%t14 = add i32 0, 5
%t16 = zext i8 %t13 to i32
%t15 = icmp sle i32 %t16, %t14
br i1 %t15, label %label_9, label %label_8
label_8:
%t18 = add i32 0, 8
%t19 = add i32 0, 0
%t20 = getelementptr inbounds [23 x i8], [23 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t20)
call void @exit(i32 0)
%t17 = udiv i32 %t18, %t19
%t21 = add i32 0, 10
%t22 = icmp slt i32 %t17, %t21
br i1 %t22, label %label_9, label %label_10
label_9:
br label %label_11
label_10:
br label %label_11
label_11:
%t12 = phi i1 [ 1, %label_9 ], [ 0, %label_10]
br i1 %t12, label %label_6, label %label_7
label_6:
%t23 = getelementptr inbounds [20 x i8], [20 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t23)
br label %label_7
label_7:
%t25 = add i32 0, 5
%t26 = add i8 0, 100
%t28 = zext i8 %t26 to i32
%t27 = icmp sgt i32 %t25, %t28
br i1 %t27, label %label_14, label %label_16
label_14:
%t30 = add i8 0, 6
%t31 = add i8 0, 0
%t32 = getelementptr inbounds [23 x i8], [23 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t32)
call void @exit(i32 0)
%t29 = udiv i8 %t30, %t31
%t33 = add i32 0, 1
%t35 = zext i8 %t29 to i32
%t34 = icmp ne i32 %t35, %t33
br i1 %t34, label %label_15, label %label_16
label_15:
br label %label_17
label_16:
br label %label_17
label_17:
%t24 = phi i1 [ 1, %label_15 ], [ 0, %label_16]
br i1 %t24, label %label_12, label %label_13
label_12:
%t36 = getelementptr inbounds [32 x i8], [32 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t36)
br label %label_13
label_13:
%t38 = add i32 0, 1
%t39 = add i8 0, 1
%t41 = zext i8 %t39 to i32
%t40 = icmp ne i32 %t38, %t41
%t42 = xor i1 1, %t40
br i1 %t42, label %label_20, label %label_22
label_20:
%t43 = add i32 0, 8
%t44 = add i8 0, 2
%t46 = zext i8 %t44 to i32
%t45 = icmp sge i32 %t43, %t46
br i1 %t45, label %label_21, label %label_22
label_21:
br label %label_23
label_22:
br label %label_23
label_23:
%t37 = phi i1 [ 1, %label_21 ], [ 0, %label_22]
br i1 %t37, label %label_18, label %label_19
label_18:
%t47 = getelementptr inbounds [5 x i8], [5 x i8]* @.str8, i32 0, i32 0
call void @print(i8* %t47)
br label %label_19
label_19:
ret void
}
