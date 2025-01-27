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
define i8 @intify(i32) {
%t0 = getelementptr inbounds [18 x i8], [18 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
Visiting Cast Node
ret i8 
}
define void @main() {
%t1 = add i32 0, 12
%t2 = call i8 @intify(i32 %t1)
%t3 = zext i8 %t2 to i32
%x = alloca i32 
store i32 %t3, i32* %x
%t4 = add i8 0, 8
%a = alloca i32 
store i32 %t4, i32* %a
%t5 = load i32, i32* %a
%t6 = call i8 @intify(i32 %t5)
%t7 = zext i8 %t6 to i32
%y = alloca i32 
store i32 %t7, i32* %y
%t8 = getelementptr inbounds [11 x i8], [11 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t8)
Visiting Cast Node
%t10 = load i32, i32* %x
%t11 = trunc i32 %t10 to i8
%t12 = load i32, i32* %y
%t13 = trunc i32 %t12 to i8
%t9 = mul i8 %t11, %t13
%t15 = zext i8  to i32
%t16 = zext i8 %t9 to i32
%t14 = icmp slt i32 %t15, %t16
br i1 %t14, label %label_0, label %label_1
label_0:
%t17 = getelementptr inbounds [41 x i8], [41 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t17)
br label %label_1
label_1:
ret void
}
