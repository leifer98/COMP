@.str0 = constant [5 x i8] c"foo!\00"
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
define void @foo() {
%t0 = getelementptr inbounds [5 x i8], [5 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
ret void
}
define void @bar(i32) {
call void @printi(i32 %0)
ret void
}
define void @moo(i1) {
br i1 %0, label %label_0, label %label_2
label_0:
call void @foo()
br label %label_1
label_2:
%t1 = add i32 0, 110
call void @bar(i32 %t1)
br label %label_1
label_1:
ret void
}
define void @main() {
call void @foo()
%t2 = add i32 0, 150
call void @bar(i32 %t2)
%t3 = add i1 0, 1
call void @moo(i1 %t3)
call void @foo()
%t4 = add i1 0, 0
call void @moo(i1 %t4)
ret void
}
