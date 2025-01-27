@.str0 = constant [4 x i8] c"bad\00"@.str1 = constant [5 x i8] c"good\00"@.str2 = constant [5 x i8] c"good\00"@.str3 = constant [9 x i8] c"very bad\00"
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
%t0 = add i32 0, 1
%a = alloca i32 
store i32 %t0, i32* %a
%t1 = add i32 0, 2
%b = alloca i32 
store i32 %t1, i32* %b
%t2 = add i32 0, 3
%c = alloca i32 
store i32 %t2, i32* %c
%t3 = add i32 0, 4
%d = alloca i32 
store i32 %t3, i32* %d
%t4 = load i32, i32* %a
%e = alloca i32 
store i32 %t4, i32* %e
%t5 = load i32, i32* %c
%f = alloca i32 
store i32 %t5, i32* %f
%t6 = load i32, i32* %d
%g = alloca i32 
store i32 %t6, i32* %g
Visiting Assign Node: Assigning to variable 'a'
%t7 = load i32, i32* %b
Visiting Assign Node: Assigning to variable 'a'
%t8 = load i32, i32* %c
Visiting RelOp Node
Visiting RelOp Node
%t9 = icmp ne i32 , 0
%t10 = icmp ne i32 , 0
%t11 = and i1 %t9, %t10
%t12 = zext i1 %t11 to i32
%t13 = getelementptr inbounds [4 x i8], [4 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t13)
%t14 = getelementptr inbounds [5 x i8], [5 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t14)
Visiting Assign Node: Assigning to variable 'e'
%t15 = load i32, i32* %b
Visiting RelOp Node
Visiting RelOp Node
%t16 = icmp ne i32 , 0
%t17 = icmp ne i32 , 0
%t18 = and i1 %t16, %t17
%t19 = zext i1 %t18 to i32
%t20 = getelementptr inbounds [5 x i8], [5 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t20)
Visiting Return Node
%t21 = getelementptr inbounds [9 x i8], [9 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t21)
ret void
}
