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
%pippo = alloca i32 
store i32 %t1, i32* %pippo
%t2 = call i8 @foo()
%t3 = zext i8 %t2 to i32
%foonum = alloca i32 
store i32 %t3, i32* %foonum
br label %label_0
label_1:
%t4 = load i32, i32* %pippo
%t5 = load i32, i32* %foonum
%t6 = trunc i32 %t5 to i8
%t8 = zext i8 %t6 to i32
%t7 = icmp slt i32 %t4, %t8
br i1 %t7, label %label_1, label %label_2
label_1:
%t9 = getelementptr inbounds [12 x i8], [12 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t9)
%t11 = load i32, i32* %pippo
%t12 = add i32 0, 1
%t10 = add i32 %t11, %t12
store i32 %t10, i32* %pippo
br label %label_0
label_2:
ret void
}
