
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
%t5 = sdiv i32 %t6, %t7
%t8 = alloca i32 
store i32 %t5, i32* %t8
ret void
}
define i32 @complexFunction(i32) {
%t9 = add i32 0, 5
%t10 = icmp sgt i32 %-22055, %t9
br i1 %t10, label %label_0, label %label_1
label_0:
%t11 = call i32 @zeroGenerator()
ret i32 %t11
br label %label_1
label_1:
%t12 = add i32 0, 1
ret i32 %t12
}
define i32 @zeroGenerator() {
%t14 = add i32 0, 3
%t15 = add i32 0, 3
%t13 = sub i32 %t14, %t15
%t16 = alloca i32 
store i32 %t13, i32* %t16
%t17 = load i32, i32* %t16
ret i32 %t17
}
