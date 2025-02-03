
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
br label %label_0
label_0:
%t2 = load i32, i32* %t1
%t3 = add i32 0, 10
%t4 = icmp slt i32 %t2, %t3
br i1 %t4, label %label_1, label %label_2
label_1:
%t5 = load i32, i32* %t1
%t6 = add i32 0, 2
%t7 = icmp slt i32 %t5, %t6
br i1 %t7, label %label_3, label %label_4
label_3:
%t8 = load i32, i32* %t1
call void @printi(i32 %t8)
br label %label_2
br label %label_4
label_4:
%t10 = load i32, i32* %t1
%t11 = add i32 0, 1
%t9 = add i32 %t10, %t11
store i32 %t9, i32* %t1
br label %label_0
label_2:
ret void
}
