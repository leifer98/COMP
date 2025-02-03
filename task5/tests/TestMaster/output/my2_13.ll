@.str0 = constant [21 x i8] c"Complex boolean true\00"@.str1 = constant [22 x i8] c"Complex boolean false\00"
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
%t0 = add i1 0, 1
%t1 = zext i1 %t0 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t3 = add i1 0, 0
%t4 = zext i1 %t3 to i32
%t5 = alloca i32 
store i32 %t4, i32* %t5
%t6 = add i1 0, 1
%t7 = zext i1 %t6 to i32
%t8 = alloca i32 
store i32 %t7, i32* %t8
%t11 = load i32, i32* %t2
%t12 = trunc i32 %t11 to i1
br i1 %t12, label %label_8, label %label_7
label_7:
%t13 = load i32, i32* %t5
%t14 = trunc i32 %t13 to i1
br i1 %t14, label %label_8, label %label_9
label_8:
br label %label_10
label_9:
br label %label_10
label_10:
%t10 = phi i1 [ 1, %label_8 ], [ 0, %label_9]
br i1 %t10, label %label_3, label %label_5
label_3:
%t16 = load i32, i32* %t8
%t17 = trunc i32 %t16 to i1
%t18 = xor i1 1, %t17
br i1 %t18, label %label_12, label %label_11
label_11:
%t20 = load i32, i32* %t2
%t21 = trunc i32 %t20 to i1
br i1 %t21, label %label_15, label %label_17
label_15:
%t22 = load i32, i32* %t5
%t23 = trunc i32 %t22 to i1
br i1 %t23, label %label_16, label %label_17
label_16:
br label %label_18
label_17:
br label %label_18
label_18:
%t19 = phi i1 [ 1, %label_16 ], [ 0, %label_17]
br i1 %t19, label %label_12, label %label_13
label_12:
br label %label_14
label_13:
br label %label_14
label_14:
%t15 = phi i1 [ 1, %label_12 ], [ 0, %label_13]
br i1 %t15, label %label_4, label %label_5
label_4:
br label %label_6
label_5:
br label %label_6
label_6:
%t9 = phi i1 [ 1, %label_4 ], [ 0, %label_5]
br i1 %t9, label %label_0, label %label_2
label_0:
%t24 = getelementptr inbounds [21 x i8], [21 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t24)
br label %label_1
label_2:
%t25 = getelementptr inbounds [22 x i8], [22 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t25)
br label %label_1
label_1:
ret void
}
