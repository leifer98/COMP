@.str0 = constant [2 x i8] c"~\00"
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
%t2 = add i32 0, 10
%t3 = alloca i32 
store i32 %t2, i32* %t3
br label %label_0
label_0:
%t4 = load i32, i32* %t1
%t5 = load i32, i32* %t3
%t6 = icmp slt i32 %t4, %t5
br i1 %t6, label %label_1, label %label_2
label_1:
%t8 = load i32, i32* %t1
%t9 = add i32 0, 1
%t7 = add i32 %t8, %t9
store i32 %t7, i32* %t1
%t11 = load i32, i32* %t3
%t12 = add i32 0, 1
%t10 = sub i32 %t11, %t12
store i32 %t10, i32* %t3
%t13 = add i32 0, 6
%t14 = alloca i32 
store i32 %t13, i32* %t14
%t15 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t15)
br label %label_0
label_2:
%t16 = load i32, i32* %t1
call void @printi(i32 %t16)
%t17 = load i32, i32* %t3
call void @printi(i32 %t17)
ret void
}
