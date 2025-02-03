@.str0 = constant [2 x i8] c"x\00"@.str1 = constant [2 x i8] c"y\00"
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
br label %label_0
label_0:
%t2 = load i32, i32* %t1
%t3 = add i32 0, 3
%t4 = icmp slt i32 %t2, %t3
br i1 %t4, label %label_1, label %label_2
label_1:
%t5 = add i32 0, 0
%t6 = alloca i32 
store i32 %t5, i32* %t6
br label %label_3
label_3:
%t7 = load i32, i32* %t6
%t8 = add i32 0, 3
%t9 = icmp slt i32 %t7, %t8
br i1 %t9, label %label_4, label %label_5
label_4:
%t10 = load i32, i32* %t1
%t11 = load i32, i32* %t6
%t12 = icmp eq i32 %t10, %t11
br i1 %t12, label %label_6, label %label_7
label_6:
br label %label_5
br label %label_7
label_7:
%t13 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t13)
%t14 = load i32, i32* %t1
call void @printi(i32 %t14)
%t15 = getelementptr inbounds [2 x i8], [2 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t15)
%t16 = load i32, i32* %t6
call void @printi(i32 %t16)
%t18 = load i32, i32* %t6
%t19 = add i32 0, 1
%t17 = add i32 %t18, %t19
store i32 %t17, i32* %t6
br label %label_3
label_5:
%t21 = load i32, i32* %t1
%t22 = add i32 0, 1
%t20 = add i32 %t21, %t22
store i32 %t20, i32* %t1
br label %label_0
label_2:
ret void
}
