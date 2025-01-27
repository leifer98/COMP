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
Visiting RelOp Node
ret i1 
}
define i1 @oppo(i1) {
Visiting Not Node
ret i1 
}
define void @main() {
%t1 = add i32 0, 5
%t2 = add i8 0, 4
%t3 = call i1 @truther(i32 %t1, i8 %t2)
Visiting Not Node
%t4 = and i1 %t3, 
br i1 %t4, label %label_0, label %label_2
label_0:
%t5 = getelementptr inbounds [18 x i8], [18 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t5)
br label %label_1
label_2:
%t6 = getelementptr inbounds [9 x i8], [9 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t6)
br label %label_1
label_1:
%t7 = add i32 0, 1
%x = alloca i32 
store i32 %t7, i32* %x
Visiting Not Node
Visiting RelOp Node
%t8 = and i1 , 
br i1 %t8, label %label_3, label %label_4
label_3:
%t9 = getelementptr inbounds [24 x i8], [24 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t9)
Visiting Assign Node: Assigning to variable 'x'
%t10 = add i32 0, 6
br label %label_4
label_4:
%t11 = add i1 0, 0
%t12 = call i1 @oppo(i1 %t11)
br i1 %t12, label %label_5, label %label_6
label_5:
%t13 = getelementptr inbounds [12 x i8], [12 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t13)
br label %label_6
label_6:
Visiting RelOp Node
br i1 , label %label_7, label %label_8
label_7:
%t14 = getelementptr inbounds [28 x i8], [28 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t14)
br label %label_8
label_8:
ret void
}
