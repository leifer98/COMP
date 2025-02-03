@.str0 = constant [23 x i8] c"Error division by zero\00"@.str1 = constant [78 x i8] c"If you see this message, you are in trouble since short circuiting is failing\00"@.str2 = constant [32 x i8] c"this should not be printed ever\00"@.str3 = constant [62 x i8] c"If you see this you don't check for division by zero properly\00"
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
%t2 = add i32 0, 0
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t5 = load i32, i32* %t3
%t6 = add i32 0, 0
%t7 = icmp eq i32 %t5, %t6
br i1 %t7, label %label_3, label %label_5
label_3:
%t9 = load i32, i32* %t1
%t10 = load i32, i32* %t3
%t11 = icmp eq i32 %t10, 0
br i1 %t11, label %label_7, label %label_8
label_7:
%t12 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t12)
call void @exit(i32 1)
br label %label_8
label_8:
%t8 = sdiv i32 %t9, %t10
%t13 = add i32 0, 1
%t14 = icmp sgt i32 %t8, %t13
br i1 %t14, label %label_4, label %label_5
label_4:
br label %label_6
label_5:
br label %label_6
label_6:
%t4 = phi i1 [ 1, %label_4 ], [ 0, %label_5]
br i1 %t4, label %label_0, label %label_2
label_0:
%t15 = getelementptr inbounds [78 x i8], [78 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t15)
br label %label_1
label_2:
%t16 = getelementptr inbounds [32 x i8], [32 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t16)
br label %label_1
label_1:
%t17 = getelementptr inbounds [62 x i8], [62 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t17)
ret void
}
