
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
%t3 = add i32 0, 5
%t4 = icmp slt i32 %t2, %t3
br i1 %t4, label %label_1, label %label_2
label_1:
%t5 = load i32, i32* %t1
%t6 = add i32 0, 3
%t7 = icmp eq i32 %t5, %t6
br i1 %t7, label %label_3, label %label_4
label_3:
%t9 = load i32, i32* %t1
%t10 = add i32 0, 1
%t8 = add i32 %t9, %t10
store i32 %t8, i32* %t1
br label %label_0
br label %label_4
label_4:
%t11 = load i32, i32* %t1
%t12 = add i32 0, 4
%t13 = icmp eq i32 %t11, %t12
br i1 %t13, label %label_5, label %label_6
label_5:
br label %label_2
br label %label_6
label_6:
%t14 = load i32, i32* %t1
call void @printi(i32 %t14)
%t16 = load i32, i32* %t1
%t17 = add i32 0, 1
%t15 = add i32 %t16, %t17
store i32 %t15, i32* %t1
br label %label_0
label_2:
ret void
}
