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
%t0 = add i32 %0, %1
%x = alloca i32 
store i32 %t0, i32* %x
%t1 = load i32, i32* %x
ret i32 %t1
}
define void @main() {
%t2 = add i32 0, 15
%t3 = add i8 0, 5
%t4 = call i32 @foo(i32 %t2, i8 %t3)
%x = alloca i32 
store i32 %t4, i32* %x
%t5 = add i32 0, 42
%t6 = add i8 0, 8
%t7 = call i32 @foo(i32 %t5, i8 %t6)
%y = alloca i32 
store i32 %t7, i32* %y
Visiting RelOp Node
br i1 , label %label_0, label %label_2
label_0:
%t9 = load i32, i32* %x
%t10 = load i32, i32* %y
%t8 = add i32 %t9, %t10
call void @printi(i32 %t8)
br label %label_1
label_2:
%t11 = getelementptr inbounds [3 x i8], [3 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t11)
br label %label_1
label_1:
ret void
}
