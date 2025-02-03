@.str0 = constant [16 x i8] c"TRUE evaluation\00"@.str1 = constant [17 x i8] c"FALSE evaluation\00"@.str2 = constant [97 x i8] c"Evaluation with if (exp){printi(1)}else{printi(0)} with truth tabels {0, 1} and {00, 01, 10, 11}\00"@.str3 = constant [16 x i8] c"NOT truth table\00"@.str4 = constant [16 x i8] c"AND truth table\00"@.str5 = constant [15 x i8] c"OR truth table\00"
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
br i1 %t1, label %label_0, label %label_2
label_0:
%t2 = add i32 0, 1
call void @printi(i32 %t2)
br label %label_1
label_2:
%t3 = add i32 0, 0
call void @printi(i32 %t3)
br label %label_1
label_1:
%t4 = getelementptr inbounds [17 x i8], [17 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t4)
%t5 = add i1 0, 0
br i1 %t5, label %label_3, label %label_5
label_3:
%t6 = add i32 0, 1
call void @printi(i32 %t6)
br label %label_4
label_5:
%t7 = add i32 0, 0
call void @printi(i32 %t7)
br label %label_4
label_4:
%t8 = getelementptr inbounds [97 x i8], [97 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t8)
%t9 = getelementptr inbounds [16 x i8], [16 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t9)
%t10 = add i1 0, 0
%t11 = xor i1 1, %t10
br i1 %t11, label %label_6, label %label_8
label_6:
%t12 = add i32 0, 1
call void @printi(i32 %t12)
br label %label_7
label_8:
%t13 = add i32 0, 0
call void @printi(i32 %t13)
br label %label_7
label_7:
%t14 = add i1 0, 1
%t15 = xor i1 1, %t14
br i1 %t15, label %label_9, label %label_11
label_9:
%t16 = add i32 0, 1
call void @printi(i32 %t16)
br label %label_10
label_11:
%t17 = add i32 0, 0
call void @printi(i32 %t17)
br label %label_10
label_10:
%t18 = getelementptr inbounds [16 x i8], [16 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t18)
%t20 = add i1 0, 0
br i1 %t20, label %label_15, label %label_17
label_15:
%t21 = add i1 0, 0
br i1 %t21, label %label_16, label %label_17
label_16:
br label %label_18
label_17:
br label %label_18
label_18:
%t19 = phi i1 [ 1, %label_16 ], [ 0, %label_17]
br i1 %t19, label %label_12, label %label_14
label_12:
%t22 = add i32 0, 1
call void @printi(i32 %t22)
br label %label_13
label_14:
%t23 = add i32 0, 0
call void @printi(i32 %t23)
br label %label_13
label_13:
%t25 = add i1 0, 0
br i1 %t25, label %label_22, label %label_24
label_22:
%t26 = add i1 0, 1
br i1 %t26, label %label_23, label %label_24
label_23:
br label %label_25
label_24:
br label %label_25
label_25:
%t24 = phi i1 [ 1, %label_23 ], [ 0, %label_24]
br i1 %t24, label %label_19, label %label_21
label_19:
%t27 = add i32 0, 1
call void @printi(i32 %t27)
br label %label_20
label_21:
%t28 = add i32 0, 0
call void @printi(i32 %t28)
br label %label_20
label_20:
%t30 = add i1 0, 1
br i1 %t30, label %label_29, label %label_31
label_29:
%t31 = add i1 0, 0
br i1 %t31, label %label_30, label %label_31
label_30:
br label %label_32
label_31:
br label %label_32
label_32:
%t29 = phi i1 [ 1, %label_30 ], [ 0, %label_31]
br i1 %t29, label %label_26, label %label_28
label_26:
%t32 = add i32 0, 1
call void @printi(i32 %t32)
br label %label_27
label_28:
%t33 = add i32 0, 0
call void @printi(i32 %t33)
br label %label_27
label_27:
%t35 = add i1 0, 1
br i1 %t35, label %label_36, label %label_38
label_36:
%t36 = add i1 0, 1
br i1 %t36, label %label_37, label %label_38
label_37:
br label %label_39
label_38:
br label %label_39
label_39:
%t34 = phi i1 [ 1, %label_37 ], [ 0, %label_38]
br i1 %t34, label %label_33, label %label_35
label_33:
%t37 = add i32 0, 1
call void @printi(i32 %t37)
br label %label_34
label_35:
%t38 = add i32 0, 0
call void @printi(i32 %t38)
br label %label_34
label_34:
%t39 = getelementptr inbounds [15 x i8], [15 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t39)
%t41 = add i1 0, 0
br i1 %t41, label %label_44, label %label_43
label_43:
%t42 = add i1 0, 0
br i1 %t42, label %label_44, label %label_45
label_44:
br label %label_46
label_45:
br label %label_46
label_46:
%t40 = phi i1 [ 1, %label_44 ], [ 0, %label_45]
br i1 %t40, label %label_40, label %label_42
label_40:
%t43 = add i32 0, 1
call void @printi(i32 %t43)
br label %label_41
label_42:
%t44 = add i32 0, 0
call void @printi(i32 %t44)
br label %label_41
label_41:
%t46 = add i1 0, 0
br i1 %t46, label %label_51, label %label_50
label_50:
%t47 = add i1 0, 1
br i1 %t47, label %label_51, label %label_52
label_51:
br label %label_53
label_52:
br label %label_53
label_53:
%t45 = phi i1 [ 1, %label_51 ], [ 0, %label_52]
br i1 %t45, label %label_47, label %label_49
label_47:
%t48 = add i32 0, 1
call void @printi(i32 %t48)
br label %label_48
label_49:
%t49 = add i32 0, 0
call void @printi(i32 %t49)
br label %label_48
label_48:
%t51 = add i1 0, 1
br i1 %t51, label %label_58, label %label_57
label_57:
%t52 = add i1 0, 0
br i1 %t52, label %label_58, label %label_59
label_58:
br label %label_60
label_59:
br label %label_60
label_60:
%t50 = phi i1 [ 1, %label_58 ], [ 0, %label_59]
br i1 %t50, label %label_54, label %label_56
label_54:
%t53 = add i32 0, 1
call void @printi(i32 %t53)
br label %label_55
label_56:
%t54 = add i32 0, 0
call void @printi(i32 %t54)
br label %label_55
label_55:
%t56 = add i1 0, 1
br i1 %t56, label %label_65, label %label_64
label_64:
%t57 = add i1 0, 1
br i1 %t57, label %label_65, label %label_66
label_65:
br label %label_67
label_66:
br label %label_67
label_67:
%t55 = phi i1 [ 1, %label_65 ], [ 0, %label_66]
br i1 %t55, label %label_61, label %label_63
label_61:
%t58 = add i32 0, 1
call void @printi(i32 %t58)
br label %label_62
label_63:
%t59 = add i32 0, 0
call void @printi(i32 %t59)
br label %label_62
label_62:
ret void
}
