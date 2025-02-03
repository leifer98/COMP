@.str0 = constant [9 x i8] c"AND true\00"@.str1 = constant [10 x i8] c"AND false\00"
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
%t1 = add i1 0, 1
br i1 %t1, label %label_3, label %label_5
label_3:
%t2 = add i1 0, 0
br i1 %t2, label %label_4, label %label_5
label_4:
br label %label_6
label_5:
br label %label_6
label_6:
%t0 = phi i1 [ 1, %label_4 ], [ 0, %label_5]
br i1 %t0, label %label_0, label %label_2
label_0:
%t3 = getelementptr inbounds [9 x i8], [9 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t3)
br label %label_1
label_2:
%t4 = getelementptr inbounds [10 x i8], [10 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t4)
br label %label_1
label_1:
ret void
}
