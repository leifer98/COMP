@.str0 = constant [9 x i8] c"all good\00"@.str1 = constant [9 x i8] c"all good\00"@.str2 = constant [23 x i8] c"Error division by zero\00"@.str3 = constant [24 x i8] c"congrats math is broken\00"@.str4 = constant [18 x i8] c"sir that is wrong\00"
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
%t0 = add i32 0, 7
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = getelementptr inbounds [9 x i8], [9 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t2)
%t3 = add i32 0, 6
%t4 = alloca i32 
store i32 %t3, i32* %t4
%t6 = load i32, i32* %t4
%t7 = load i32, i32* %t1
%t5 = add i32 %t6, %t7
store i32 %t5, i32* %t4
%t8 = getelementptr inbounds [9 x i8], [9 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t8)
%t10 = load i32, i32* %t1
%t11 = add i32 0, 0
%t12 = icmp eq i32 %t11, 0
br i1 %t12, label %label_2, label %label_3
label_2:
%t13 = getelementptr inbounds [23 x i8], [23 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t13)
call void @exit(i32 1)
br label %label_3
label_3:
%t9 = udiv i32 %t10, %t11
%t14 = add i32 0, 3
%t15 = icmp eq i32 %t9, %t14
br i1 %t15, label %label_0, label %label_1
label_0:
%t16 = getelementptr inbounds [24 x i8], [24 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t16)
ret void
br label %label_1
label_1:
%t17 = getelementptr inbounds [18 x i8], [18 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t17)
ret void
}
