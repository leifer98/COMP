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
define i32 @retfalse() {
%t0 = getelementptr inbounds [6 x i8], [6 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
Visiting Return Node
%t1 = zext i1 0 to i32
}
define i32 @rettrue() {
%t2 = getelementptr inbounds [6 x i8], [6 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t2)
Visiting Return Node
%t3 = zext i1 1 to i32
}
define void @main() {
%t4 = zext i1 1 to i32
%t5 = call i32 @retfalse()
%t6 = icmp ne i32 %t4, 0
%t7 = icmp ne i32 %t5, 0
%t8 = or i1 %t6, %t7
%t9 = zext i1 %t8 to i32
Visiting RelOp Node
%t10 = icmp ne i32 %t9, 0
%t11 = icmp ne i32 , 0
%t12 = and i1 %t10, %t11
%t13 = zext i1 %t12 to i32
%t14 = getelementptr inbounds [5 x i8], [5 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t14)
%t15 = zext i1 0 to i32
%t16 = call i32 @rettrue()
%t17 = icmp ne i32 %t15, 0
%t18 = icmp ne i32 %t16, 0
%t19 = and i1 %t17, %t18
%t20 = zext i1 %t19 to i32
%t21 = getelementptr inbounds [6 x i8], [6 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t21)
Visiting Return Node
%t22 = getelementptr inbounds [5 x i8], [5 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t22)
ret void
}
