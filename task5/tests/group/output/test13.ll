@.str0 = constant [18 x i8] c"bow chica bow wow\00"@.str1 = constant [9 x i8] c"dishonor\00"@.str2 = constant [24 x i8] c"thats what my baby said\00"@.str3 = constant [12 x i8] c"mow mow mow\00"@.str4 = constant [28 x i8] c"and my heart starts bumping\00"
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
define i1 @truther(i32, i8) {
%t0 = add i1 0, 1
ret i1 %t0
}
define i1 @falsesr(i32) {
%t1 = add i32 0, 5
%t2 = icmp sle i32 %0, %t1
ret i1 %t2
}
define i1 @oppo(i1) {
Visiting Not Node
ret i1 
}
define void @main() {
%t3 = add i32 0, 5
%t4 = add i8 0, 4
%t5 = call i1 @truther(i32 %t3, i8 %t4)
Visiting Not Node
%t6 = and i1 %t5, 
br i1 %t6, label %label_0, label %label_2
label_0:
%t7 = getelementptr inbounds [18 x i8], [18 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t7)
br label %label_1
label_2:
%t8 = getelementptr inbounds [9 x i8], [9 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t8)
br label %label_1
label_1:
%t9 = add i32 0, 1
%x = alloca i32 
store i32 %t9, i32* %x
Visiting Not Node
%t10 = add i32 0, 3
%t11 = add i32 0, 0
%t12 = icmp sgt i32 %t10, %t11
%t13 = and i1 , %t12
br i1 %t13, label %label_3, label %label_4
label_3:
%t14 = getelementptr inbounds [24 x i8], [24 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t14)
%t15 = add i32 0, 6
store i32 %t15, i32* %x
br label %label_4
label_4:
%t16 = add i1 0, 0
%t17 = call i1 @oppo(i1 %t16)
br i1 %t17, label %label_5, label %label_6
label_5:
%t18 = getelementptr inbounds [12 x i8], [12 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t18)
br label %label_6
label_6:
%t19 = load i32, i32* %x
%t20 = add i32 0, 6
%t21 = icmp eq i32 %t19, %t20
br i1 %t21, label %label_7, label %label_8
label_7:
%t22 = getelementptr inbounds [28 x i8], [28 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t22)
br label %label_8
label_8:
ret void
}
