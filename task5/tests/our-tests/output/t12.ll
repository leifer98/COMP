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
define void @main() {
%t0 = add i32 0, 10
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = load i32, i32* %t1
%t3 = call i32 @complexFunction(i32 %t2)
%t4 = alloca i32 
store i32 %t3, i32* %t4
%t6 = add i32 0, 100
%t7 = load i32, i32* %t4
%t8 = icmp eq i32 %t7, 0
br i1 %t8, label %label_0, label %label_1
label_0:
%t9 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t9)
call void @exit(i32 1)
br label %label_1
label_1:
%t5 = sdiv i32 %t6, %t7
%t10 = alloca i32 
store i32 %t5, i32* %t10
ret void
}
define i32 @complexFunction(i32) {
%t11 = add i32 0, 5
%t12 = icmp sgt i32 %0, %t11
br i1 %t12, label %label_2, label %label_3
label_2:
%t13 = call i32 @zeroGenerator()
ret i32 %t13
br label %label_3
label_3:
%t14 = add i32 0, 1
ret i32 %t14
}
define i32 @zeroGenerator() {
%t16 = add i32 0, 3
%t17 = add i32 0, 3
%t15 = sub i32 %t16, %t17
%t18 = alloca i32 
store i32 %t15, i32* %t18
%t19 = load i32, i32* %t18
ret i32 %t19
}
