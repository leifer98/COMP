@.str0 = constant [16 x i8] c"TRUE evaluation\00"@.str1 = constant [17 x i8] c"FALSE evaluation\00"@.str2 = constant [82 x i8] c"Evaluation with if (exp){printi(1)} with truth tabels {0, 1} and {00, 01, 10, 11}\00"@.str3 = constant [16 x i8] c"NOT truth table\00"@.str4 = constant [16 x i8] c"AND truth table\00"@.str5 = constant [15 x i8] c"OR truth table\00"
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
%t0 = getelementptr inbounds [16 x i8], [16 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
%t1 = add i1 0, 1
br i1 %t1, label %label_0, label %label_1
label_0:
%t2 = add i32 0, 1
call void @printi(i32 %t2)
br label %label_1
label_1:
%t3 = getelementptr inbounds [17 x i8], [17 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t3)
%t4 = add i1 0, 0
br i1 %t4, label %label_2, label %label_3
label_2:
%t5 = add i32 0, 1
call void @printi(i32 %t5)
br label %label_3
label_3:
%t6 = getelementptr inbounds [82 x i8], [82 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t6)
%t7 = getelementptr inbounds [16 x i8], [16 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t7)
%t8 = add i1 0, 0
%t9 = xor i1 1, %t8
br i1 %t9, label %label_4, label %label_5
label_4:
%t10 = add i32 0, 1
call void @printi(i32 %t10)
br label %label_5
label_5:
%t11 = add i1 0, 1
%t12 = xor i1 1, %t11
br i1 %t12, label %label_6, label %label_7
label_6:
%t13 = add i32 0, 1
call void @printi(i32 %t13)
br label %label_7
label_7:
%t14 = getelementptr inbounds [16 x i8], [16 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t14)
%t16 = add i1 0, 0
br i1 %t16, label %label_10, label %label_12
label_10:
%t17 = add i1 0, 0
br i1 %t17, label %label_11, label %label_12
label_11:
br label %label_13
label_12:
br label %label_13
label_13:
%t15 = phi i1 [ 1, %label_11 ], [ 0, %label_12]
br i1 %t15, label %label_8, label %label_9
label_8:
%t18 = add i32 0, 1
call void @printi(i32 %t18)
br label %label_9
label_9:
%t20 = add i1 0, 0
br i1 %t20, label %label_16, label %label_18
label_16:
%t21 = add i1 0, 1
br i1 %t21, label %label_17, label %label_18
label_17:
br label %label_19
label_18:
br label %label_19
label_19:
%t19 = phi i1 [ 1, %label_17 ], [ 0, %label_18]
br i1 %t19, label %label_14, label %label_15
label_14:
%t22 = add i32 0, 1
call void @printi(i32 %t22)
br label %label_15
label_15:
%t24 = add i1 0, 1
br i1 %t24, label %label_22, label %label_24
label_22:
%t25 = add i1 0, 0
br i1 %t25, label %label_23, label %label_24
label_23:
br label %label_25
label_24:
br label %label_25
label_25:
%t23 = phi i1 [ 1, %label_23 ], [ 0, %label_24]
br i1 %t23, label %label_20, label %label_21
label_20:
%t26 = add i32 0, 1
call void @printi(i32 %t26)
br label %label_21
label_21:
%t28 = add i1 0, 1
br i1 %t28, label %label_28, label %label_30
label_28:
%t29 = add i1 0, 1
br i1 %t29, label %label_29, label %label_30
label_29:
br label %label_31
label_30:
br label %label_31
label_31:
%t27 = phi i1 [ 1, %label_29 ], [ 0, %label_30]
br i1 %t27, label %label_26, label %label_27
label_26:
%t30 = add i32 0, 1
call void @printi(i32 %t30)
br label %label_27
label_27:
%t31 = getelementptr inbounds [15 x i8], [15 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t31)
%t33 = add i1 0, 0
br i1 %t33, label %label_35, label %label_34
label_34:
%t34 = add i1 0, 0
br i1 %t34, label %label_35, label %label_36
label_35:
br label %label_37
label_36:
br label %label_37
label_37:
%t32 = phi i1 [ 1, %label_35 ], [ 0, %label_36]
br i1 %t32, label %label_32, label %label_33
label_32:
%t35 = add i32 0, 1
call void @printi(i32 %t35)
br label %label_33
label_33:
%t37 = add i1 0, 0
br i1 %t37, label %label_41, label %label_40
label_40:
%t38 = add i1 0, 1
br i1 %t38, label %label_41, label %label_42
label_41:
br label %label_43
label_42:
br label %label_43
label_43:
%t36 = phi i1 [ 1, %label_41 ], [ 0, %label_42]
br i1 %t36, label %label_38, label %label_39
label_38:
%t39 = add i32 0, 1
call void @printi(i32 %t39)
br label %label_39
label_39:
%t41 = add i1 0, 1
br i1 %t41, label %label_47, label %label_46
label_46:
%t42 = add i1 0, 0
br i1 %t42, label %label_47, label %label_48
label_47:
br label %label_49
label_48:
br label %label_49
label_49:
%t40 = phi i1 [ 1, %label_47 ], [ 0, %label_48]
br i1 %t40, label %label_44, label %label_45
label_44:
%t43 = add i32 0, 1
call void @printi(i32 %t43)
br label %label_45
label_45:
%t45 = add i1 0, 1
br i1 %t45, label %label_53, label %label_52
label_52:
%t46 = add i1 0, 1
br i1 %t46, label %label_53, label %label_54
label_53:
br label %label_55
label_54:
br label %label_55
label_55:
%t44 = phi i1 [ 1, %label_53 ], [ 0, %label_54]
br i1 %t44, label %label_50, label %label_51
label_50:
%t47 = add i32 0, 1
call void @printi(i32 %t47)
br label %label_51
label_51:
ret void
}
