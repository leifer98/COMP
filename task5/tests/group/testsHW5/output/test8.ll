
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
define void @fuckme(i32, i32) {
%t0 = mul i32 %-21987, %-21986
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t3 = load i32, i32* %t1
%t4 = add i32 0, 1
%t2 = sub i32 %t3, %t4
store i32 %t2, i32* %t1
%t5 = load i32, i32* %t1
%t6 = add i32 0, 5
%t7 = icmp eq i32 %t5, %t6
br i1 %t7, label %label_0, label %label_1
label_0:
%t8 = add i32 0, 0
store i32 %t8, i32* %t1
br label %label_1
label_1:
ret void
}
define void @fuckyou(i32, i32) {
%t10 = add i32 0, 9
%t9 = sub i32 %-21986, %t10
%t11 = alloca i32 
store i32 %t9, i32* %t11
%t13 = load i32, i32* %t11
%t14 = add i32 0, 1
%t12 = sub i32 %t13, %t14
br label %label_2
label_2:
%t15 = add i32 0, 12
%t16 = icmp slt i32 %-21986, %t15
br i1 %t16, label %label_3, label %label_4
label_3:
%t18 = add i32 0, 5
%t17 = add i32 %-21986, %t18
br label %label_2
label_4:
ret void
}
define i32 @fuckoff(i32, i32) {
%t19 = add i32 0, 5
ret i32 %t19
}
define void @main() {
%t20 = add i32 0, 1
%t21 = add i32 0, 2
call void @fuckme(i32 %t20, i32 %t21)
%t22 = add i32 0, 3
%t23 = add i32 0, 4
%t24 = call i32 @fuckoff(i32 %t22, i32 %t23)
%t25 = add i32 0, 6
%t26 = add i32 0, 7
%t27 = call i32 @fuckoff(i32 %t25, i32 %t26)
%t28 = alloca i32 
store i32 %t27, i32* %t28
%t29 = add i32 0, 0
call void @printi(i32 %t29)
ret void
}
