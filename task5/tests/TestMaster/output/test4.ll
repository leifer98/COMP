@.str0 = constant [4 x i8] c"bad\00"@.str1 = constant [5 x i8] c"good\00"@.str2 = constant [5 x i8] c"good\00"@.str3 = constant [9 x i8] c"very bad\00"
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
%t0 = add i32 0, 1
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = add i32 0, 2
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = add i32 0, 3
%t5 = alloca i32 
store i32 %t4, i32* %t5
%t6 = add i32 0, 4
%t7 = alloca i32 
store i32 %t6, i32* %t7
%t8 = load i32, i32* %t1
%t9 = alloca i32 
store i32 %t8, i32* %t9
%t10 = load i32, i32* %t5
%t11 = alloca i32 
store i32 %t10, i32* %t11
%t12 = load i32, i32* %t7
%t13 = alloca i32 
store i32 %t12, i32* %t13
%t14 = load i32, i32* %t3
store i32 %t14, i32* %t1
%t15 = load i32, i32* %t5
store i32 %t15, i32* %t1
%t17 = load i32, i32* %t1
%t18 = load i32, i32* %t11
%t19 = icmp eq i32 %t17, %t18
br i1 %t19, label %label_3, label %label_5
label_3:
%t20 = load i32, i32* %t9
%t21 = load i32, i32* %t11
%t22 = icmp eq i32 %t20, %t21
br i1 %t22, label %label_4, label %label_5
label_4:
br label %label_6
label_5:
br label %label_6
label_6:
%t16 = phi i1 [ 1, %label_4 ], [ 0, %label_5]
br i1 %t16, label %label_0, label %label_2
label_0:
%t23 = getelementptr inbounds [4 x i8], [4 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t23)
br label %label_1
label_2:
%t24 = getelementptr inbounds [5 x i8], [5 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t24)
br label %label_1
label_1:
%t25 = load i32, i32* %t3
store i32 %t25, i32* %t9
%t27 = load i32, i32* %t5
%t28 = load i32, i32* %t7
%t29 = icmp slt i32 %t27, %t28
br i1 %t29, label %label_9, label %label_11
label_9:
%t30 = load i32, i32* %t9
%t32 = load i32, i32* %t7
%t33 = add i32 0, 2
%t31 = sub i32 %t32, %t33
%t34 = icmp eq i32 %t30, %t31
br i1 %t34, label %label_10, label %label_11
label_10:
br label %label_12
label_11:
br label %label_12
label_12:
%t26 = phi i1 [ 1, %label_10 ], [ 0, %label_11]
br i1 %t26, label %label_7, label %label_8
label_7:
%t35 = getelementptr inbounds [5 x i8], [5 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t35)
ret void
br label %label_8
label_8:
%t36 = getelementptr inbounds [9 x i8], [9 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t36)
ret void
}
