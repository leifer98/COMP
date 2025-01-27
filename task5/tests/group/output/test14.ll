
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
br label %label_0
label_0:
%t1 = load i32, i32* %i
%t2 = add i32 0, 10
%t3 = icmp slt i32 %t1, %t2
br i1 %t3, label %label_1, label %label_2
label_1:
%t4 = load i32, i32* %i
%t5 = add i32 0, 2
%t6 = icmp slt i32 %t4, %t5
br i1 %t6, label %label_3, label %label_4
label_3:
%t7 = load i32, i32* %i
call void @printi(i32 %t7)
br label %label_2
br label %label_4
label_4:
%t9 = load i32, i32* %i
%t10 = add i32 0, 1
%t8 = add i32 %t9, %t10
store i32 %t8, i32* %i
br label %label_0
label_2:
ret void
}
