@.str0 = constant [18 x i8] c"bow chica bow wow\00"@.str1 = constant [9 x i8] c"dishonor\00"@.str2 = constant [24 x i8] c"thats what my baby said\00"@.str3 = constant [12 x i8] c"mow mow mow\00"@.str4 = constant [28 x i8] c"and my heart starts bumping\00"
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
define i32 @truther(i32, i32) {
Visiting Return Node
%t0 = zext i1 1 to i32
}
define i32 @falsesr(i32) {
Visiting Return Node
Visiting RelOp Node
}
define i32 @oppo(i32) {
Visiting Return Node
Visiting Not Node
}
define void @main() {
%t1 = add i32 0, 5
%t2 = zext i8 4 to i32
%t3 = call i32 @truther(i32 %t1, i32 %t2)
Visiting Not Node
%t4 = icmp ne i32 %t3, 0
%t5 = icmp ne i32 , 0
%t6 = and i1 %t4, %t5
%t7 = zext i1 %t6 to i32
%t8 = getelementptr inbounds [18 x i8], [18 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t8)
%t9 = getelementptr inbounds [9 x i8], [9 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t9)
%t10 = add i32 0, 1
%x = alloca i32 
store i32 %t10, i32* %x
Visiting Not Node
Visiting RelOp Node
%t11 = icmp ne i32 , 0
%t12 = icmp ne i32 , 0
%t13 = and i1 %t11, %t12
%t14 = zext i1 %t13 to i32
%t15 = getelementptr inbounds [24 x i8], [24 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t15)
Visiting Assign Node: Assigning to variable 'x'
%t16 = add i32 0, 6
%t17 = zext i1 0 to i32
%t18 = call i32 @oppo(i32 %t17)
%t19 = getelementptr inbounds [12 x i8], [12 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t19)
Visiting RelOp Node
%t20 = getelementptr inbounds [28 x i8], [28 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t20)
ret void
}
