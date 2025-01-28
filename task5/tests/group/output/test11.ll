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
%t1 = trunc i32 %-21944 to i8
ret i8 %t1
}
define void @main() {
%t2 = add i32 0, 12
%t3 = call i8 @intify(i32 %t2)
%t4 = zext i8 %t3 to i32
%x = alloca i32 
store i32 %t4, i32* %x
%t5 = add i8 0, 8
%t6 = zext i8 %t5 to i32
%a = alloca i32 
store i32 %t6, i32* %a
%t7 = load i32, i32* %a
%t8 = call i8 @intify(i32 %t7)
%t9 = zext i8 %t8 to i32
%y = alloca i32 
store i32 %t9, i32* %y
%t10 = getelementptr inbounds [11 x i8], [11 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t10)
%t12 = add i8 0, 3
%t13 = add i8 0, 2
%t11 = add i8 %t12, %t13
%t15 = load i32, i32* %x
%t16 = trunc i32 %t15 to i8
%t17 = load i32, i32* %y
%t18 = trunc i32 %t17 to i8
%t14 = mul i8 %t16, %t18
%t20 = zext i8 %t11 to i32
%t21 = zext i8 %t14 to i32
%t19 = icmp slt i32 %t20, %t21
br i1 %t19, label %label_0, label %label_1
label_0:
%t22 = getelementptr inbounds [41 x i8], [41 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t22)
br label %label_1
label_1:
ret void
}
