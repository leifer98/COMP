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
%t1 = zext i8 %-22045 to i32
%t0 = add i32 %-22046, %t1
%t2 = alloca i32 
store i32 %t0, i32* %t2
%t3 = load i32, i32* %t2
ret i32 %t3
}
define void @main() {
%t4 = add i32 0, 15
%t5 = add i8 0, 5
%t6 = call i32 @foo(i32 %t4, i8 %t5)
%t7 = alloca i32 
store i32 %t6, i32* %t7
%t8 = add i32 0, 42
%t9 = add i8 0, 8
%t10 = call i32 @foo(i32 %t8, i8 %t9)
%t11 = alloca i32 
store i32 %t10, i32* %t11
%t12 = load i32, i32* %t7
%t13 = load i32, i32* %t11
%t14 = icmp slt i32 %t12, %t13
br i1 %t14, label %label_0, label %label_2
label_0:
%t16 = load i32, i32* %t7
%t17 = load i32, i32* %t11
%t15 = add i32 %t16, %t17
call void @printi(i32 %t15)
br label %label_1
label_2:
%t18 = getelementptr inbounds [3 x i8], [3 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t18)
br label %label_1
label_1:
ret void
}
