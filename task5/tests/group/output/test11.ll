@.str0 = constant [18 x i8] c"gimmie gimmie now\00"@.str1 = constant [11 x i8] c"zuzuzuzuzu\00"@.str2 = constant [41 x i8] c"Ijen naega neoreul jaba now, imma savage\00"
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
define i32 @intify(i32) {
%t0 = getelementptr inbounds [18 x i8], [18 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
Visiting Return Node
Visiting Cast Node
}
define void @main() {
%t1 = add i32 0, 12
%t2 = call i32 @intify(i32 %t1)
%x = alloca i32 
store i32 %t2, i32* %x
%t3 = zext i8 8 to i32
%a = alloca i32 
store i32 %t3, i32* %a
%t4 = load i32, i32* %a
%t5 = call i32 @intify(i32 %t4)
%y = alloca i32 
store i32 %t5, i32* %y
%t6 = getelementptr inbounds [11 x i8], [11 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t6)
Visiting RelOp Node
%t7 = getelementptr inbounds [41 x i8], [41 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t7)
ret void
}
