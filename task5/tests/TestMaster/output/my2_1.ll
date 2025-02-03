
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
define i32 @check(i32) {
%t0 = add i32 0, 0
%t1 = icmp sgt i32 %0, %t0
br i1 %t1, label %label_0, label %label_2
label_0:
%t2 = add i32 0, 1
call void @printi(i32 %t2)
%t3 = add i32 0, 1
ret i32 %t3
br label %label_1
label_2:
%t4 = add i32 0, 0
call void @printi(i32 %t4)
%t5 = add i32 0, 0
ret i32 %t5
br label %label_1
label_1:
ret i32 0
}
define void @main() {
%t6 = add i32 0, 2
%t7 = alloca i32 
store i32 %t6, i32* %t7
%t8 = load i32, i32* %t7
%t9 = call i32 @check(i32 %t8)
ret void
}
