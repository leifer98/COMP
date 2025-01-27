@.str0 = constant [3 x i8] c":/\00"
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
define i32 @foo(i32, i8) {
%t1 = zext i8 %1 to i32
%t0 = add i32 %0, %t1
%x = alloca i32 
store i32 %t0, i32* %x
%t2 = load i32, i32* %x
ret i32 %t2
}
define void @main() {
%t3 = add i32 0, 15
%t4 = add i8 0, 5
%t5 = call i32 @foo(i32 %t3, i8 %t4)
%x = alloca i32 
store i32 %t5, i32* %x
%t6 = add i32 0, 42
%t7 = add i8 0, 8
%t8 = call i32 @foo(i32 %t6, i8 %t7)
%y = alloca i32 
store i32 %t8, i32* %y
%t9 = load i32, i32* %x
%t10 = load i32, i32* %y
%t11 = icmp slt i32 %t9, %t10
br i1 %t11, label %label_0, label %label_2
label_0:
%t13 = load i32, i32* %x
%t14 = load i32, i32* %y
%t12 = add i32 %t13, %t14
call void @printi(i32 %t12)
br label %label_1
label_2:
%t15 = getelementptr inbounds [3 x i8], [3 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t15)
br label %label_1
label_1:
ret void
}
