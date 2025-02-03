@.str0 = constant [23 x i8] c"Error division by zero\00"
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
define i32 @safedivgt(i32, i32, i32) {
%t1 = add i32 0, 0
%t2 = icmp ne i32 %1, %t1
br i1 %t2, label %label_2, label %label_4
label_2:
%t4 = icmp eq i32 %1, 0
br i1 %t4, label %label_6, label %label_7
label_6:
%t5 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t5)
call void @exit(i32 1)
br label %label_7
label_7:
%t3 = sdiv i32 %0, %1
%t6 = icmp sgt i32 %t3, %2
br i1 %t6, label %label_3, label %label_4
label_3:
br label %label_5
label_4:
br label %label_5
label_5:
%t0 = phi i1 [ 1, %label_3 ], [ 0, %label_4]
br i1 %t0, label %label_0, label %label_1
label_0:
%t7 = add i32 0, 1
ret i32 %t7
br label %label_1
label_1:
%t8 = add i32 0, 0
ret i32 %t8
}
define void @main() {
%t9 = add i32 0, 120
%t10 = add i32 0, 4
%t11 = add i32 0, 28
%t12 = call i32 @safedivgt(i32 %t9, i32 %t10, i32 %t11)
call void @printi(i32 %t12)
%t13 = add i32 0, 120
%t14 = add i32 0, 4
%t15 = add i32 0, 32
%t16 = call i32 @safedivgt(i32 %t13, i32 %t14, i32 %t15)
call void @printi(i32 %t16)
%t17 = add i32 0, 120
%t18 = add i32 0, 0
%t19 = add i32 0, 32
%t20 = call i32 @safedivgt(i32 %t17, i32 %t18, i32 %t19)
call void @printi(i32 %t20)
%t21 = add i32 0, 120
%t22 = add i32 0, 1
%t23 = add i32 0, 32
%t24 = call i32 @safedivgt(i32 %t21, i32 %t22, i32 %t23)
call void @printi(i32 %t24)
ret void
}
