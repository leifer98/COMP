@.str0 = constant [4 x i8] c"f1!\00"@.str1 = constant [4 x i8] c"f2!\00"@.str2 = constant [4 x i8] c"f3!\00"@.str3 = constant [14 x i8] c"call me maybe\00"
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
define i32 @f1(i32) {
%t0 = getelementptr inbounds [4 x i8], [4 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
ret i32 %0
}
define i8 @f2(i8) {
%t1 = getelementptr inbounds [4 x i8], [4 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t1)
ret i8 %0
}
define i1 @f3(i1) {
%t2 = getelementptr inbounds [4 x i8], [4 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t2)
ret i1 %0
}
define void @callMe(i32, i32, i8, i1, i1, i8, i32, i1) {
%t3 = getelementptr inbounds [14 x i8], [14 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t3)
call void @printi(i32 %0)
call void @printi(i32 %1)
%t4 = zext i8 %2 to i32
call void @printi(i32 %t4)
%t5 = zext i8 %5 to i32
call void @printi(i32 %t5)
call void @printi(i32 %6)
ret void
}
define void @main() {
%t6 = add i32 0, 2
%t7 = call i32 @f1(i32 %t6)
%t8 = add i8 0, 4
%t9 = call i8 @f2(i8 %t8)
%t10 = add i8 0, 5
%t11 = call i8 @f2(i8 %t10)
%t12 = add i1 0, 1
%t13 = call i1 @f3(i1 %t12)
%t14 = add i1 0, 0
%t15 = call i1 @f3(i1 %t14)
%t16 = add i8 0, 3
%t17 = call i8 @f2(i8 %t16)
%t18 = add i32 0, 22
%t19 = call i32 @f1(i32 %t18)
%t20 = add i1 0, 0
%t21 = call i1 @f3(i1 %t20)
%t22 = zext i8 %t9 to i32
call void @callMe(i32 %t7, i32 %t22, i8 %t11, i1 %t13, i1 %t15, i8 %t17, i32 %t19, i1 %t21)
ret void
}
