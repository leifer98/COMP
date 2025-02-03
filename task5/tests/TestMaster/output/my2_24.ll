
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
define void @recursiveWithLocals(i32) {
%t0 = alloca i32 
store i32 %0, i32* %t0
%t1 = trunc i32 %0 to i8
%t2 = zext i8 %t1 to i32
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = add i32 0, 0
%t5 = icmp sgt i32 %0, %t4
br i1 %t5, label %label_0, label %label_1
label_0:
%t7 = add i32 0, 1
%t6 = sub i32 %0, %t7
call void @recursiveWithLocals(i32 %t6)
br label %label_1
label_1:
%t8 = load i32, i32* %t0
call void @printi(i32 %t8)
ret void
}
define void @main() {
%t9 = add i32 0, 60
call void @recursiveWithLocals(i32 %t9)
ret void
}
