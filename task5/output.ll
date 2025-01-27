@.str0 = constant [5 x i8] c"true\00"@.str1 = constant [5 x i8] c"true\00"@.str2 = constant [12 x i8] c"val is true\00"@.str3 = constant [13 x i8] c"val is false\00"
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
%t0 = zext i1 1 to i32
call void @printByValue(i32 %t0)
%t1 = zext i1 0 to i32
call void @printByValue(i32 %t1)
%t2 = zext i1 1 to i32
%t3 = getelementptr inbounds [5 x i8], [5 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t3)
%t4 = zext i1 0 to i32
%t5 = zext i1 0 to i32
%t6 = zext i1 1 to i32
%t7 = icmp ne i32 %t5, 0
%t8 = icmp ne i32 %t6, 0
%t9 = and i1 %t7, %t8
%t10 = zext i1 %t9 to i32
%t11 = icmp ne i32 %t4, 0
%t12 = icmp ne i32 %t10, 0
%t13 = or i1 %t11, %t12
%t14 = zext i1 %t13 to i32
%t15 = getelementptr inbounds [5 x i8], [5 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t15)
ret void
}
define void @printByValue(i32) {
%t16 = getelementptr inbounds [12 x i8], [12 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t16)
%t17 = getelementptr inbounds [13 x i8], [13 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t17)
ret void
}
