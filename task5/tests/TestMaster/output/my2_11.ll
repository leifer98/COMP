
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
define i32 @multipleReturns(i32) {
%t0 = add i32 0, 0
%t1 = icmp slt i32 %0, %t0
br i1 %t1, label %label_0, label %label_2
label_0:
%t3 = add i32 0, 1
%t4 = add i32 0, 2
%t2 = sub i32 %t3, %t4
ret i32 %t2
br label %label_1
label_2:
%t5 = add i32 0, 0
%t6 = icmp eq i32 %0, %t5
br i1 %t6, label %label_3, label %label_4
label_3:
%t7 = add i32 0, 0
ret i32 %t7
br label %label_4
label_4:
br label %label_1
label_1:
%t8 = add i32 0, 1
ret i32 %t8
}
define void @main() {
%t10 = add i32 0, 5
%t11 = add i32 0, 10
%t9 = sub i32 %t10, %t11
%t12 = call i32 @multipleReturns(i32 %t9)
call void @printi(i32 %t12)
%t13 = add i32 0, 0
%t14 = call i32 @multipleReturns(i32 %t13)
call void @printi(i32 %t14)
%t15 = add i32 0, 5
%t16 = call i32 @multipleReturns(i32 %t15)
call void @printi(i32 %t16)
ret void
}
