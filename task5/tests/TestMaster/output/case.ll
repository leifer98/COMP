@.str0 = constant [23 x i8] c"Error division by zero\00"@.str1 = constant [13 x i8] c"Hello world!\00"@.str2 = constant [63 x i8] c"Something's wrong, we not too low (should have exited with 0!)\00"@.str3 = constant [45 x i8] c"Loop should have decreased 'a' down to zero!\00"@.str4 = constant [23 x i8] c"Error division by zero\00"@.str5 = constant [23 x i8] c"Error division by zero\00"@.str6 = constant [23 x i8] c"Error division by zero\00"@.str7 = constant [45 x i8] c"Just making sure boolean are short circuited\00"@.str8 = constant [46 x i8] c"Goodbye world! (proceeding to divide by zero)\00"@.str9 = constant [23 x i8] c"Error division by zero\00"@.str10 = constant [21 x i8] c"Should have crashed!\00"
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
%t1 = add i32 0, 3
%t2 = add i32 0, 1
%t3 = icmp eq i32 %t2, 0
br i1 %t3, label %label_0, label %label_1
label_0:
%t4 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t4)
call void @exit(i32 1)
br label %label_1
label_1:
%t0 = sdiv i32 %t1, %t2
%t5 = alloca i32 
store i32 %t0, i32* %t5
%t6 = getelementptr inbounds [13 x i8], [13 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t6)
br label %label_2
label_2:
%t7 = load i32, i32* %t5
%t8 = add i32 0, 0
%t9 = icmp sgt i32 %t7, %t8
br i1 %t9, label %label_3, label %label_4
label_3:
%t11 = load i32, i32* %t5
%t12 = add i32 0, 1
%t10 = add i32 %t11, %t12
%t13 = alloca i32 
store i32 %t10, i32* %t13
%t14 = load i32, i32* %t13
%t15 = call i32 @printDownTimesTen(i32 %t14)
%t16 = add i32 0, 0
%t17 = icmp ne i32 %t15, %t16
br i1 %t17, label %label_5, label %label_6
label_5:
%t18 = getelementptr inbounds [63 x i8], [63 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t18)
ret void
br label %label_6
label_6:
%t19 = load i32, i32* %t5
call void @printi(i32 %t19)
%t21 = load i32, i32* %t5
%t22 = add i32 0, 1
%t20 = sub i32 %t21, %t22
store i32 %t20, i32* %t5
br label %label_2
label_4:
%t23 = load i32, i32* %t5
%t24 = add i32 0, 0
%t25 = icmp ne i32 %t23, %t24
br i1 %t25, label %label_7, label %label_8
label_7:
%t26 = getelementptr inbounds [45 x i8], [45 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t26)
ret void
br label %label_8
label_8:
%t28 = add i1 0, 1
br i1 %t28, label %label_10, label %label_9
label_9:
%t30 = add i32 0, 3
%t31 = add i32 0, 0
%t32 = icmp eq i32 %t31, 0
br i1 %t32, label %label_13, label %label_14
label_13:
%t33 = getelementptr inbounds [23 x i8], [23 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t33)
call void @exit(i32 1)
br label %label_14
label_14:
%t29 = sdiv i32 %t30, %t31
%t34 = add i32 0, 0
%t35 = icmp slt i32 %t29, %t34
br i1 %t35, label %label_10, label %label_11
label_10:
br label %label_12
label_11:
br label %label_12
label_12:
%t27 = phi i1 [ 1, %label_10 ], [ 0, %label_11]
%t36 = zext i1 %t27 to i32
%t37 = alloca i32 
store i32 %t36, i32* %t37
%t40 = load i32, i32* %t37
%t41 = trunc i32 %t40 to i1
br i1 %t41, label %label_21, label %label_23
label_21:
%t43 = add i1 0, 1
br i1 %t43, label %label_26, label %label_25
label_25:
%t45 = add i32 0, 3
%t46 = add i32 0, 0
%t47 = icmp eq i32 %t46, 0
br i1 %t47, label %label_29, label %label_30
label_29:
%t48 = getelementptr inbounds [23 x i8], [23 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t48)
call void @exit(i32 1)
br label %label_30
label_30:
%t44 = sdiv i32 %t45, %t46
%t49 = add i32 0, 0
%t50 = icmp slt i32 %t44, %t49
br i1 %t50, label %label_26, label %label_27
label_26:
br label %label_28
label_27:
br label %label_28
label_28:
%t42 = phi i1 [ 1, %label_26 ], [ 0, %label_27]
br i1 %t42, label %label_22, label %label_23
label_22:
br label %label_24
label_23:
br label %label_24
label_24:
%t39 = phi i1 [ 1, %label_22 ], [ 0, %label_23]
br i1 %t39, label %label_17, label %label_19
label_17:
%t53 = add i1 0, 0
br i1 %t53, label %label_35, label %label_37
label_35:
%t55 = add i32 0, 3
%t56 = add i32 0, 0
%t57 = icmp eq i32 %t56, 0
br i1 %t57, label %label_39, label %label_40
label_39:
%t58 = getelementptr inbounds [23 x i8], [23 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t58)
call void @exit(i32 1)
br label %label_40
label_40:
%t54 = sdiv i32 %t55, %t56
%t59 = add i32 0, 0
%t60 = icmp sgt i32 %t54, %t59
br i1 %t60, label %label_36, label %label_37
label_36:
br label %label_38
label_37:
br label %label_38
label_38:
%t52 = phi i1 [ 1, %label_36 ], [ 0, %label_37]
br i1 %t52, label %label_32, label %label_31
label_31:
%t61 = add i1 0, 1
br i1 %t61, label %label_32, label %label_33
label_32:
br label %label_34
label_33:
br label %label_34
label_34:
%t51 = phi i1 [ 1, %label_32 ], [ 0, %label_33]
br i1 %t51, label %label_18, label %label_19
label_18:
br label %label_20
label_19:
br label %label_20
label_20:
%t38 = phi i1 [ 1, %label_18 ], [ 0, %label_19]
br i1 %t38, label %label_15, label %label_16
label_15:
%t62 = getelementptr inbounds [45 x i8], [45 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t62)
br label %label_16
label_16:
%t63 = getelementptr inbounds [46 x i8], [46 x i8]* @.str8, i32 0, i32 0
call void @print(i8* %t63)
%t65 = add i32 0, 1
%t66 = load i32, i32* %t5
%t67 = icmp eq i32 %t66, 0
br i1 %t67, label %label_41, label %label_42
label_41:
%t68 = getelementptr inbounds [23 x i8], [23 x i8]* @.str9, i32 0, i32 0
call void @print(i8* %t68)
call void @exit(i32 1)
br label %label_42
label_42:
%t64 = sdiv i32 %t65, %t66
call void @printi(i32 %t64)
%t69 = getelementptr inbounds [21 x i8], [21 x i8]* @.str10, i32 0, i32 0
call void @print(i8* %t69)
ret void
}
define i32 @printDownTimesTen(i32) {
%t70 = add i1 0, 1
%t71 = zext i1 %t70 to i32
%t72 = alloca i32 
store i32 %t71, i32* %t72
%t73 = alloca i32 
store i32 %0, i32* %t73
br label %label_43
label_43:
%t77 = load i32, i32* %t72
%t78 = trunc i32 %t77 to i1
br i1 %t78, label %label_54, label %label_56
label_54:
%t79 = load i32, i32* %t72
%t80 = trunc i32 %t79 to i1
%t81 = xor i1 1, %t80
%t82 = xor i1 1, %t81
br i1 %t82, label %label_55, label %label_56
label_55:
br label %label_57
label_56:
br label %label_57
label_57:
%t76 = phi i1 [ 1, %label_55 ], [ 0, %label_56]
br i1 %t76, label %label_50, label %label_52
label_50:
%t83 = load i32, i32* %t73
%t84 = add i32 0, 0
%t85 = icmp sgt i32 %t83, %t84
br i1 %t85, label %label_51, label %label_52
label_51:
br label %label_53
label_52:
br label %label_53
label_53:
%t75 = phi i1 [ 1, %label_51 ], [ 0, %label_52]
br i1 %t75, label %label_46, label %label_48
label_46:
%t86 = load i32, i32* %t73
%t87 = add i32 0, 0
%t88 = icmp sgt i32 %t86, %t87
%t89 = xor i1 1, %t88
%t90 = xor i1 1, %t89
%t91 = xor i1 1, %t90
%t92 = xor i1 1, %t91
br i1 %t92, label %label_47, label %label_48
label_47:
br label %label_49
label_48:
br label %label_49
label_49:
%t74 = phi i1 [ 1, %label_47 ], [ 0, %label_48]
%t93 = xor i1 1, %t74
%t94 = xor i1 1, %t93
%t95 = xor i1 1, %t94
%t96 = xor i1 1, %t95
br i1 %t96, label %label_44, label %label_45
label_44:
%t98 = load i32, i32* %t73
%t99 = add i32 0, 10
%t97 = mul i32 %t98, %t99
%t100 = alloca i32 
store i32 %t97, i32* %t100
%t101 = load i32, i32* %t100
call void @printi(i32 %t101)
%t103 = load i32, i32* %t73
%t104 = add i32 0, 1
%t102 = sub i32 %t103, %t104
store i32 %t102, i32* %t73
%t105 = load i32, i32* %t73
%t106 = add i32 0, 0
%t107 = icmp sgt i32 %t105, %t106
%t108 = zext i1 %t107 to i32
store i32 %t108, i32* %t72
br label %label_43
label_45:
%t109 = load i32, i32* %t73
ret i32 %t109
}
