
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
Visiting Assign Node: Assigning to variable 't'
%t2 = load i32, i32* %t
%t3 = add i32 0, 1
%t1 = sub i32 %t2, %t3
Visiting RelOp Node
br i1 , label %label_0, label %label_1
label_0:
Visiting Assign Node: Assigning to variable 't'
%t4 = add i32 0, 0
br label %label_1
label_1:
ret void
}
define void @fuckyou(i32, i32) {
%t6 = add i32 0, 9
%t5 = sub i32 %1, %t6
%g = alloca i32 
store i32 %t5, i32* %g
Visiting Assign Node: Assigning to variable 'a'
%t8 = load i32, i32* %g
%t9 = add i32 0, 1
%t7 = sub i32 %t8, %t9
Visiting While Node
ret void
}
define i32 @fuckoff(i32, i32) {
%t10 = add i32 0, 5
ret i32 %t10
}
define void @main() {
%t11 = add i32 0, 1
%t12 = add i32 0, 2
call void @fuckme(i32 %t11, i32 %t12)
%t13 = add i32 0, 3
%t14 = add i32 0, 4
%t15 = call i32 @fuckoff(i32 %t13, i32 %t14)
%t16 = add i32 0, 6
%t17 = add i32 0, 7
%t18 = call i32 @fuckoff(i32 %t16, i32 %t17)
%x = alloca i32 
store i32 %t18, i32* %x
%t19 = add i32 0, 0
call void @printi(i32 %t19)
ret void
}
