
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
%t0 = add i32 0, 3
%i = alloca i32 
store i32 %t0, i32* %i
Visiting Assign Node: Assigning to variable 'i'
%t2 = load i32, i32* %i
%t3 = add i32 0, 8
%t1 = add i32 %t2, %t3
%t4 = add i32 0, 2
%x = alloca i32 
store i32 %t4, i32* %x
Visiting Assign Node: Assigning to variable 'i'
%t6 = load i32, i32* %x
%t7 = load i32, i32* %i
%t5 = mul i32 %t6, %t7
%t8 = load i32, i32* %i
call void @printi(i32 %t8)
ret void
}
