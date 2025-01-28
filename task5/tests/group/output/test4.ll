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
%a = alloca i32 
store i32 %t0, i32* %a
%t1 = add i32 0, 2
%b = alloca i32 
store i32 %t1, i32* %b
%t2 = add i32 0, 3
%c = alloca i32 
store i32 %t2, i32* %c
%t3 = add i32 0, 4
%d = alloca i32 
store i32 %t3, i32* %d
%t4 = load i32, i32* %a
%e = alloca i32 
store i32 %t4, i32* %e
%t5 = load i32, i32* %c
%f = alloca i32 
store i32 %t5, i32* %f
%t6 = load i32, i32* %d
%g = alloca i32 
store i32 %t6, i32* %g
%t7 = load i32, i32* %b
store i32 %t7, i32* %a
%t8 = load i32, i32* %c
store i32 %t8, i32* %a
%t10 = load i32, i32* %a
%t11 = load i32, i32* %f
%t12 = icmp eq i32 %t10, %t11
br i1 %t12, label %label_3, label %label_5
label_3:
%t13 = load i32, i32* %e
%t14 = load i32, i32* %f
%t15 = icmp eq i32 %t13, %t14
br i1 %t15, label %label_4, label %label_5
label_4:
br label %label_6
label_5:
br label %label_6
label_6:
%t9 = phi i1 [ 1, %label_4 ], [ 0, %label_5]
br i1 %t9, label %label_0, label %label_2
label_0:
%t16 = getelementptr inbounds [4 x i8], [4 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t16)
br label %label_1
label_2:
%t17 = getelementptr inbounds [5 x i8], [5 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t17)
br label %label_1
label_1:
%t18 = load i32, i32* %b
store i32 %t18, i32* %e
%t20 = load i32, i32* %c
%t21 = load i32, i32* %d
%t22 = icmp slt i32 %t20, %t21
br i1 %t22, label %label_9, label %label_11
label_9:
%t23 = load i32, i32* %e
%t25 = load i32, i32* %d
%t26 = add i32 0, 2
%t24 = sub i32 %t25, %t26
%t27 = icmp eq i32 %t23, %t24
br i1 %t27, label %label_10, label %label_11
label_10:
br label %label_12
label_11:
br label %label_12
label_12:
%t19 = phi i1 [ 1, %label_10 ], [ 0, %label_11]
br i1 %t19, label %label_7, label %label_8
label_7:
%t28 = getelementptr inbounds [5 x i8], [5 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t28)
ret void
br label %label_8
label_8:
%t29 = getelementptr inbounds [9 x i8], [9 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t29)
ret void
}
