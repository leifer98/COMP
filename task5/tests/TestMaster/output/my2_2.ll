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
define i32 @compute() {
%t4 = add i32 0, 1
%t5 = add i32 0, 2
%t3 = add i32 %t4, %t5
%t7 = add i32 0, 3
%t8 = add i32 0, 4
%t6 = sub i32 %t7, %t8
%t2 = mul i32 %t3, %t6
%t9 = add i32 0, 5
%t1 = add i32 %t2, %t9
%t10 = add i32 0, 1
%t11 = icmp eq i32 %t10, 0
br i1 %t11, label %label_0, label %label_1
label_0:
%t12 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t12)
call void @exit(i32 1)
br label %label_1
label_1:
%t0 = sdiv i32 %t1, %t10
%t13 = alloca i32 
store i32 %t0, i32* %t13
%t14 = load i32, i32* %t13
ret i32 %t14
}
define void @main() {
%t15 = add i32 0, 5
%t16 = alloca i32 
store i32 %t15, i32* %t16
%t17 = call i32 @compute()
call void @printi(i32 %t17)
%t18 = call i32 @deepNesting()
call void @printi(i32 %t18)
ret void
}
define i32 @deepNesting() {
%t19 = add i32 0, 1
%t20 = add i32 0, 0
%t21 = icmp sgt i32 %t19, %t20
br i1 %t21, label %label_2, label %label_3
label_2:
%t22 = add i32 0, 2
%t23 = add i32 0, 0
%t24 = icmp sgt i32 %t22, %t23
br i1 %t24, label %label_4, label %label_5
label_4:
%t25 = add i32 0, 3
%t26 = add i32 0, 0
%t27 = icmp sgt i32 %t25, %t26
br i1 %t27, label %label_6, label %label_7
label_6:
%t28 = add i32 0, 4
%t29 = add i32 0, 0
%t30 = icmp sgt i32 %t28, %t29
br i1 %t30, label %label_8, label %label_9
label_8:
%t31 = add i32 0, 1
ret i32 %t31
br label %label_9
label_9:
br label %label_7
label_7:
br label %label_5
label_5:
br label %label_3
label_3:
%t32 = add i32 0, 0
ret i32 %t32
}
