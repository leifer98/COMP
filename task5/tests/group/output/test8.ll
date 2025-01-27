
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
%t1 = load i32, i32* %x
%t2 = load i32, i32* %y
%t0 = mul i32 %t1, %t2
%t = alloca i32 
store i32 %t0, i32* %t
Visiting Assign Node: Assigning to variable 't'
%t4 = load i32, i32* %t
%t5 = add i32 0, 1
%t3 = sub i32 %t4, %t5
Visiting RelOp Node
Visiting Assign Node: Assigning to variable 't'
%t6 = add i32 0, 0
ret void
}
define void @fuckyou(i32, i32) {
%t8 = load i32, i32* %b
%t9 = add i32 0, 9
%t7 = sub i32 %t8, %t9
%g = alloca i32 
store i32 %t7, i32* %g
Visiting Assign Node: Assigning to variable 'a'
%t11 = load i32, i32* %g
%t12 = add i32 0, 1
%t10 = sub i32 %t11, %t12
Visiting While Node
ret void
}
define i32 @fuckoff(i32, i32) {
Visiting Return Node
%t13 = add i32 0, 5
}
define void @main() {
%t14 = add i32 0, 1
%t15 = add i32 0, 2
call void @fuckme(i32 %t14, i32 %t15)
%t16 = add i32 0, 3
%t17 = add i32 0, 4
%t18 = call i32 @fuckoff(i32 %t16, i32 %t17)
%t19 = add i32 0, 6
%t20 = add i32 0, 7
%t21 = call i32 @fuckoff(i32 %t19, i32 %t20)
%x = alloca i32 
store i32 %t21, i32* %x
%t22 = add i32 0, 0
call void @printi(i32 %t22)
ret void
}
