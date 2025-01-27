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
%i = alloca i32 
store i32 %t0, i32* %i
%t1 = add i32 0, 10
%j = alloca i32 
store i32 %t1, i32* %j
br label %label_0
label_1:
%t2 = load i32, i32* %i
%t3 = load i32, i32* %j
%t4 = icmp slt i32 %t2, %t3
br i1 %t4, label %label_1, label %label_2
label_1:
%t6 = load i32, i32* %i
%t7 = add i32 0, 1
%t5 = add i32 %t6, %t7
store i32 %t5, i32* %i
%t9 = load i32, i32* %j
%t10 = add i32 0, 1
%t8 = sub i32 %t9, %t10
store i32 %t8, i32* %j
%t11 = add i32 0, 6
%x = alloca i32 
store i32 %t11, i32* %x
%t12 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t12)
br label %label_0
label_2:
%t13 = load i32, i32* %i
call void @printi(i32 %t13)
%t14 = load i32, i32* %j
call void @printi(i32 %t14)
ret void
}
