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
%t5 = zext i8 %t4 to i32
%a = alloca i32 
store i32 %t5, i32* %a
%t6 = load i32, i32* %a
%t7 = call i8 @intify(i32 %t6)
%t8 = zext i8 %t7 to i32
%y = alloca i32 
store i32 %t8, i32* %y
%t9 = getelementptr inbounds [11 x i8], [11 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t9)
Visiting Cast Node
%t11 = load i32, i32* %x
%t12 = trunc i32 %t11 to i8
%t13 = load i32, i32* %y
%t14 = trunc i32 %t13 to i8
%t10 = mul i8 %t12, %t14
%t16 = zext i8  to i32
%t17 = zext i8 %t10 to i32
%t15 = icmp slt i32 %t16, %t17
br i1 %t15, label %label_0, label %label_1
label_0:
%t18 = getelementptr inbounds [41 x i8], [41 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t18)
br label %label_1
label_1:
ret void
}
