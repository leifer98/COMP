@.str0 = constant [18 x i8] c"bow chica bow wow\00"@.str1 = constant [9 x i8] c"dishonor\00"@.str2 = constant [24 x i8] c"thats what my baby said\00"@.str3 = constant [12 x i8] c"mow mow mow\00"@.str4 = constant [28 x i8] c"and my heart starts bumping\00"
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
define i1 @truther(i32, i8) {
%t0 = add i1 0, 1
ret i1 %t0
}
define i1 @falsesr(i32) {
%t1 = add i32 0, 5
%t2 = icmp sle i32 %-22061, %t1
ret i1 %t2
}
define i1 @oppo(i1) {
%t3 = xor i1 1, %-22061
ret i1 %t3
}
define void @main() {
%t5 = add i32 0, 5
%t6 = add i8 0, 4
%t7 = call i1 @truther(i32 %t5, i8 %t6)
br i1 %t7, label %label_3, label %label_5
label_3:
%t8 = add i32 0, 6
%t9 = call i1 @falsesr(i32 %t8)
%t10 = xor i1 1, %t9
br i1 %t10, label %label_4, label %label_5
label_4:
br label %label_6
label_5:
br label %label_6
label_6:
%t4 = phi i1 [ 1, %label_4 ], [ 0, %label_5]
br i1 %t4, label %label_0, label %label_2
label_0:
%t11 = getelementptr inbounds [18 x i8], [18 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t11)
br label %label_1
label_2:
%t12 = getelementptr inbounds [9 x i8], [9 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t12)
br label %label_1
label_1:
%t13 = add i32 0, 1
%t14 = alloca i32 
store i32 %t13, i32* %t14
%t16 = add i32 0, 5
%t17 = add i32 0, 7
%t18 = icmp eq i32 %t16, %t17
%t19 = xor i1 1, %t18
br i1 %t19, label %label_9, label %label_11
label_9:
%t20 = add i32 0, 3
%t21 = add i32 0, 0
%t22 = icmp sgt i32 %t20, %t21
br i1 %t22, label %label_10, label %label_11
label_10:
br label %label_12
label_11:
br label %label_12
label_12:
%t15 = phi i1 [ 1, %label_10 ], [ 0, %label_11]
br i1 %t15, label %label_7, label %label_8
label_7:
%t23 = getelementptr inbounds [24 x i8], [24 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t23)
%t24 = add i32 0, 6
store i32 %t24, i32* %t14
br label %label_8
label_8:
%t25 = add i1 0, 0
%t26 = call i1 @oppo(i1 %t25)
br i1 %t26, label %label_13, label %label_14
label_13:
%t27 = getelementptr inbounds [12 x i8], [12 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t27)
br label %label_14
label_14:
%t28 = load i32, i32* %t14
%t29 = add i32 0, 6
%t30 = icmp eq i32 %t28, %t29
br i1 %t30, label %label_15, label %label_16
label_15:
%t31 = getelementptr inbounds [28 x i8], [28 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t31)
br label %label_16
label_16:
ret void
}
