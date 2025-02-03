@.str0 = constant [12 x i8] c"Hello world\00"
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
define i8 @foo() {
%t0 = add i8 0, 4
ret i8 %t0
}
define void @main() {
%t1 = add i32 0, 0
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t3 = call i8 @foo()
%t4 = zext i8 %t3 to i32
%t5 = alloca i32 
store i32 %t4, i32* %t5
br label %label_0
label_0:
%t6 = load i32, i32* %t2
%t7 = load i32, i32* %t5
%t8 = trunc i32 %t7 to i8
%t10 = zext i8 %t8 to i32
%t9 = icmp slt i32 %t6, %t10
br i1 %t9, label %label_1, label %label_2
label_1:
%t11 = getelementptr inbounds [12 x i8], [12 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t11)
%t13 = load i32, i32* %t2
%t14 = add i32 0, 1
%t12 = add i32 %t13, %t14
store i32 %t12, i32* %t2
br label %label_0
label_2:
ret void
}
