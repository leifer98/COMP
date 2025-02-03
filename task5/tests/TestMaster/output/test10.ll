@.str0 = constant [6 x i8] c"wrong\00"@.str1 = constant [6 x i8] c"wrong\00"@.str2 = constant [5 x i8] c"good\00"@.str3 = constant [6 x i8] c"wrong\00"@.str4 = constant [5 x i8] c"good\00"
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
define i1 @retfalse() {
%t0 = getelementptr inbounds [6 x i8], [6 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
%t1 = add i1 0, 0
ret i1 %t1
}
define i1 @rettrue() {
%t2 = getelementptr inbounds [6 x i8], [6 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t2)
%t3 = add i1 0, 1
ret i1 %t3
}
define void @main() {
%t6 = add i1 0, 1
br i1 %t6, label %label_7, label %label_6
label_6:
%t7 = call i1 @retfalse()
br i1 %t7, label %label_7, label %label_8
label_7:
br label %label_9
label_8:
br label %label_9
label_9:
%t5 = phi i1 [ 1, %label_7 ], [ 0, %label_8]
br i1 %t5, label %label_2, label %label_4
label_2:
%t8 = add i32 0, 5
%t9 = add i32 0, 5
%t10 = icmp eq i32 %t8, %t9
br i1 %t10, label %label_3, label %label_4
label_3:
br label %label_5
label_4:
br label %label_5
label_5:
%t4 = phi i1 [ 1, %label_3 ], [ 0, %label_4]
br i1 %t4, label %label_0, label %label_1
label_0:
%t11 = getelementptr inbounds [5 x i8], [5 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t11)
br label %label_1
label_1:
%t13 = add i1 0, 0
br i1 %t13, label %label_12, label %label_14
label_12:
%t14 = call i1 @rettrue()
br i1 %t14, label %label_13, label %label_14
label_13:
br label %label_15
label_14:
br label %label_15
label_15:
%t12 = phi i1 [ 1, %label_13 ], [ 0, %label_14]
br i1 %t12, label %label_10, label %label_11
label_10:
%t15 = getelementptr inbounds [6 x i8], [6 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t15)
ret void
br label %label_11
label_11:
%t16 = getelementptr inbounds [5 x i8], [5 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t16)
ret void
}
