
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
%t0 = mul i32 %0, %1
%t = alloca i32 
store i32 %t0, i32* %t
%t2 = load i32, i32* %t
%t3 = add i32 0, 1
%t1 = sub i32 %t2, %t3
store i32 %t1, i32* %t
%t4 = load i32, i32* %t
%t5 = add i32 0, 5
%t6 = icmp eq i32 %t4, %t5
br i1 %t6, label %label_0, label %label_1
label_0:
%t7 = add i32 0, 0
store i32 %t7, i32* %t
br label %label_1
label_1:
ret void
}
define void @fuckyou(i32, i32) {
%t9 = add i32 0, 9
%t8 = sub i32 %1, %t9
%g = alloca i32 
store i32 %t8, i32* %g
%t11 = load i32, i32* %g
%t12 = add i32 0, 1
%t10 = sub i32 %t11, %t12
store i32 %t10, i32* %a
br label %label_2
label_2:
%t13 = add i32 0, 12
%t14 = icmp slt i32 %1, %t13
br i1 %t14, label %label_3, label %label_4
label_3:
%t16 = add i32 0, 5
%t15 = add i32 %1, %t16
store i32 %t15, i32* %b
br label %label_2
label_4:
ret void
}
define i32 @fuckoff(i32, i32) {
%t17 = add i32 0, 5
ret i32 %t17
}
define void @main() {
%t18 = add i32 0, 1
%t19 = add i32 0, 2
call void @fuckme(i32 %t18, i32 %t19)
%t20 = add i32 0, 3
%t21 = add i32 0, 4
%t22 = call i32 @fuckoff(i32 %t20, i32 %t21)
%t23 = add i32 0, 6
%t24 = add i32 0, 7
%t25 = call i32 @fuckoff(i32 %t23, i32 %t24)
%x = alloca i32 
store i32 %t25, i32* %x
%t26 = add i32 0, 0
call void @printi(i32 %t26)
ret void
}
