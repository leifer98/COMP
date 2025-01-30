@.str0 = constant [25 x i8] c"\tInner loop iteration: \00"@.str1 = constant [3 x i8] c"\n\00"@.str2 = constant [23 x i8] c"Outer loop iteration: \00"@.str3 = constant [3 x i8] c"\n\00"
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
define void @innerLoop(i32) {
%t0 = add i32 0, 3
%t1 = icmp sgt i32 %-21886, %t0
br i1 %t1, label %label_0, label %label_1
label_0:
ret void
br label %label_1
label_1:
%t2 = getelementptr inbounds [25 x i8], [25 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t2)
call void @printi(i32 %-21886)
%t3 = getelementptr inbounds [3 x i8], [3 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t3)
%t5 = add i32 0, 1
%t4 = add i32 %-21886, %t5
call void @innerLoop(i32 %t4)
ret void
}
define void @outerLoop(i32) {
%t6 = add i32 0, 10
%t7 = icmp sge i32 %-21886, %t6
br i1 %t7, label %label_2, label %label_3
label_2:
ret void
br label %label_3
label_3:
%t8 = getelementptr inbounds [23 x i8], [23 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t8)
call void @printi(i32 %-21886)
%t9 = getelementptr inbounds [3 x i8], [3 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t9)
%t10 = add i32 0, 1
call void @innerLoop(i32 %t10)
%t12 = add i32 0, 1
%t11 = add i32 %-21886, %t12
call void @outerLoop(i32 %t11)
ret void
}
define void @main() {
%t13 = add i32 0, 0
call void @outerLoop(i32 %t13)
ret void
}
