@.str0 = constant [9 x i8] c"all good\00"@.str1 = constant [9 x i8] c"all good\00"@.str2 = constant [24 x i8] c"congrats math is broken\00"@.str3 = constant [18 x i8] c"sir that is wrong\00"
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
%t9 = sdiv i32 %t10, %t11
%t12 = add i32 0, 3
%t13 = icmp eq i32 %t9, %t12
br i1 %t13, label %label_0, label %label_1
label_0:
%t14 = getelementptr inbounds [24 x i8], [24 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t14)
ret void
br label %label_1
label_1:
%t15 = getelementptr inbounds [18 x i8], [18 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t15)
ret void
}
