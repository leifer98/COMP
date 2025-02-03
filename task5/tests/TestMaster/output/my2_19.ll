@.str0 = constant [12 x i8] c"Side effect\00"@.str1 = constant [13 x i8] c"Never prints\00"@.str2 = constant [27 x i8] c"Prints without side effect\00"
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
define i1 @sideEffect() {
%t0 = getelementptr inbounds [12 x i8], [12 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
%t1 = add i1 0, 0
ret i1 %t1
}
define void @main() {
%t3 = add i1 0, 0
br i1 %t3, label %label_2, label %label_4
label_2:
%t4 = call i1 @sideEffect()
br i1 %t4, label %label_3, label %label_4
label_3:
br label %label_5
label_4:
br label %label_5
label_5:
%t2 = phi i1 [ 1, %label_3 ], [ 0, %label_4]
br i1 %t2, label %label_0, label %label_1
label_0:
%t5 = getelementptr inbounds [13 x i8], [13 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t5)
br label %label_1
label_1:
%t7 = add i1 0, 1
br i1 %t7, label %label_9, label %label_8
label_8:
%t8 = call i1 @sideEffect()
br i1 %t8, label %label_9, label %label_10
label_9:
br label %label_11
label_10:
br label %label_11
label_11:
%t6 = phi i1 [ 1, %label_9 ], [ 0, %label_10]
br i1 %t6, label %label_6, label %label_7
label_6:
%t9 = getelementptr inbounds [27 x i8], [27 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t9)
br label %label_7
label_7:
ret void
}
