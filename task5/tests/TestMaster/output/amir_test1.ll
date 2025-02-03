@.str0 = constant [12 x i8] c"val is true\00"@.str1 = constant [13 x i8] c"val is false\00"@.str2 = constant [5 x i8] c"true\00"@.str3 = constant [5 x i8] c"true\00"
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
%t0 = add i1 0, 1
%t1 = zext i1 %t0 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t3 = load i32, i32* %t2
%t4 = trunc i32 %t3 to i1
br i1 %t4, label %label_0, label %label_2
label_0:
%t5 = getelementptr inbounds [12 x i8], [12 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t5)
br label %label_1
label_2:
%t6 = getelementptr inbounds [13 x i8], [13 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t6)
br label %label_1
label_1:
%t7 = add i1 0, 1
br i1 %t7, label %label_3, label %label_4
label_3:
%t8 = getelementptr inbounds [5 x i8], [5 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t8)
br label %label_4
label_4:
%t10 = add i1 0, 0
br i1 %t10, label %label_8, label %label_7
label_7:
%t12 = add i1 0, 0
br i1 %t12, label %label_11, label %label_13
label_11:
%t13 = add i1 0, 1
br i1 %t13, label %label_12, label %label_13
label_12:
br label %label_14
label_13:
br label %label_14
label_14:
%t11 = phi i1 [ 1, %label_12 ], [ 0, %label_13]
br i1 %t11, label %label_8, label %label_9
label_8:
br label %label_10
label_9:
br label %label_10
label_10:
%t9 = phi i1 [ 1, %label_8 ], [ 0, %label_9]
br i1 %t9, label %label_5, label %label_6
label_5:
%t14 = getelementptr inbounds [5 x i8], [5 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t14)
br label %label_6
label_6:
ret void
}
