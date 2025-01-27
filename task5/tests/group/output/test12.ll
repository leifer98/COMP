@.str0 = constant [5 x i8] c"good\00"@.str1 = constant [10 x i8] c"very good\00"@.str2 = constant [15 x i8] c"fail, im sorry\00"
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
define i32 @plusser(i32, i32, i32, i8) {
%t8 = add i32 0, 9
%t7 = add i32 %t8, %0
%t6 = add i32 %t7, %1
%t5 = add i32 %t6, %2
%t4 = add i32 %t5, %3
%t3 = add i32 %t4, %0
%t2 = add i32 %t3, %1
%t1 = add i32 %t2, %2
%t0 = add i32 %t1, %3
%y = alloca i32 
store i32 %t0, i32* %y
%t9 = load i32, i32* %y
ret i32 %t9
}
define void @main() {
Visiting RelOp Node
br i1 , label %label_0, label %label_1
label_0:
%t10 = getelementptr inbounds [5 x i8], [5 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t10)
br label %label_1
label_1:
Visiting RelOp Node
br i1 , label %label_2, label %label_3
label_2:
%t11 = getelementptr inbounds [10 x i8], [10 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t11)
br label %label_3
label_3:
%t12 = getelementptr inbounds [15 x i8], [15 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t12)
ret void
}
