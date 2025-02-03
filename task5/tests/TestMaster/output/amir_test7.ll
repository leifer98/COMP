@.str0 = constant [19 x i8] c"5 == 5b evaluation\00"@.str1 = constant [19 x i8] c"5 != 5b evaluation\00"@.str2 = constant [124 x i8] c"Evaluation with if (exp){printi(1)}else{printi(0)} with truth tabels {0, 1} and {00, 01, 10, 11} but values are relationals\00"@.str3 = constant [16 x i8] c"NOT truth table\00"@.str4 = constant [16 x i8] c"AND truth table\00"@.str5 = constant [15 x i8] c"OR truth table\00"
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
%t0 = getelementptr inbounds [19 x i8], [19 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
%t1 = add i32 0, 5
%t2 = add i8 0, 5
%t4 = zext i8 %t2 to i32
%t3 = icmp eq i32 %t1, %t4
br i1 %t3, label %label_0, label %label_2
label_0:
%t5 = add i32 0, 1
call void @printi(i32 %t5)
br label %label_1
label_2:
%t6 = add i32 0, 0
call void @printi(i32 %t6)
br label %label_1
label_1:
%t7 = getelementptr inbounds [19 x i8], [19 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t7)
%t8 = add i32 0, 5
%t9 = add i8 0, 5
%t11 = zext i8 %t9 to i32
%t10 = icmp ne i32 %t8, %t11
br i1 %t10, label %label_3, label %label_5
label_3:
%t12 = add i32 0, 1
call void @printi(i32 %t12)
br label %label_4
label_5:
%t13 = add i32 0, 0
call void @printi(i32 %t13)
br label %label_4
label_4:
%t14 = getelementptr inbounds [124 x i8], [124 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t14)
%t15 = getelementptr inbounds [16 x i8], [16 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t15)
%t16 = add i32 0, 5
%t17 = add i32 0, 4
%t18 = icmp eq i32 %t16, %t17
%t19 = xor i1 1, %t18
br i1 %t19, label %label_6, label %label_8
label_6:
%t20 = add i32 0, 1
call void @printi(i32 %t20)
br label %label_7
label_8:
%t21 = add i32 0, 0
call void @printi(i32 %t21)
br label %label_7
label_7:
%t22 = add i32 0, 5
%t23 = add i32 0, 4
%t24 = icmp ne i32 %t22, %t23
%t25 = xor i1 1, %t24
br i1 %t25, label %label_9, label %label_11
label_9:
%t26 = add i32 0, 1
call void @printi(i32 %t26)
br label %label_10
label_11:
%t27 = add i32 0, 0
call void @printi(i32 %t27)
br label %label_10
label_10:
%t28 = getelementptr inbounds [16 x i8], [16 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t28)
%t30 = add i32 0, 0
%t31 = add i32 0, 1
%t32 = icmp sgt i32 %t30, %t31
br i1 %t32, label %label_15, label %label_17
label_15:
%t33 = add i32 0, 1
%t34 = add i32 0, 0
%t35 = icmp slt i32 %t33, %t34
br i1 %t35, label %label_16, label %label_17
label_16:
br label %label_18
label_17:
br label %label_18
label_18:
%t29 = phi i1 [ 1, %label_16 ], [ 0, %label_17]
br i1 %t29, label %label_12, label %label_14
label_12:
%t36 = add i32 0, 1
call void @printi(i32 %t36)
br label %label_13
label_14:
%t37 = add i32 0, 0
call void @printi(i32 %t37)
br label %label_13
label_13:
%t39 = add i32 0, 0
%t40 = add i32 0, 1
%t41 = icmp sge i32 %t39, %t40
br i1 %t41, label %label_22, label %label_24
label_22:
%t42 = add i32 0, 0
%t43 = add i32 0, 0
%t44 = icmp sge i32 %t42, %t43
br i1 %t44, label %label_23, label %label_24
label_23:
br label %label_25
label_24:
br label %label_25
label_25:
%t38 = phi i1 [ 1, %label_23 ], [ 0, %label_24]
br i1 %t38, label %label_19, label %label_21
label_19:
%t45 = add i32 0, 1
call void @printi(i32 %t45)
br label %label_20
label_21:
%t46 = add i32 0, 0
call void @printi(i32 %t46)
br label %label_20
label_20:
%t48 = add i32 0, 0
%t49 = add i32 0, 0
%t50 = icmp sle i32 %t48, %t49
br i1 %t50, label %label_29, label %label_31
label_29:
%t51 = add i32 0, 1
%t52 = add i32 0, 0
%t53 = icmp sle i32 %t51, %t52
br i1 %t53, label %label_30, label %label_31
label_30:
br label %label_32
label_31:
br label %label_32
label_32:
%t47 = phi i1 [ 1, %label_30 ], [ 0, %label_31]
br i1 %t47, label %label_26, label %label_28
label_26:
%t54 = add i32 0, 1
call void @printi(i32 %t54)
br label %label_27
label_28:
%t55 = add i32 0, 0
call void @printi(i32 %t55)
br label %label_27
label_27:
%t57 = add i32 0, 0
%t58 = add i32 0, 1
%t59 = icmp slt i32 %t57, %t58
br i1 %t59, label %label_36, label %label_38
label_36:
%t60 = add i32 0, 1
%t61 = add i32 0, 0
%t62 = icmp sgt i32 %t60, %t61
br i1 %t62, label %label_37, label %label_38
label_37:
br label %label_39
label_38:
br label %label_39
label_39:
%t56 = phi i1 [ 1, %label_37 ], [ 0, %label_38]
br i1 %t56, label %label_33, label %label_35
label_33:
%t63 = add i32 0, 1
call void @printi(i32 %t63)
br label %label_34
label_35:
%t64 = add i32 0, 0
call void @printi(i32 %t64)
br label %label_34
label_34:
%t65 = getelementptr inbounds [15 x i8], [15 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t65)
%t67 = add i8 0, 0
%t68 = add i32 0, 0
%t70 = zext i8 %t67 to i32
%t69 = icmp sgt i32 %t70, %t68
br i1 %t69, label %label_44, label %label_43
label_43:
%t71 = add i8 0, 0
%t72 = add i32 0, 0
%t74 = zext i8 %t71 to i32
%t73 = icmp slt i32 %t74, %t72
br i1 %t73, label %label_44, label %label_45
label_44:
br label %label_46
label_45:
br label %label_46
label_46:
%t66 = phi i1 [ 1, %label_44 ], [ 0, %label_45]
br i1 %t66, label %label_40, label %label_42
label_40:
%t75 = add i32 0, 1
call void @printi(i32 %t75)
br label %label_41
label_42:
%t76 = add i32 0, 0
call void @printi(i32 %t76)
br label %label_41
label_41:
%t78 = add i8 0, 0
%t79 = add i32 0, 0
%t81 = zext i8 %t78 to i32
%t80 = icmp sgt i32 %t81, %t79
br i1 %t80, label %label_51, label %label_50
label_50:
%t82 = add i32 0, 0
%t83 = add i8 0, 0
%t85 = zext i8 %t83 to i32
%t84 = icmp sge i32 %t82, %t85
br i1 %t84, label %label_51, label %label_52
label_51:
br label %label_53
label_52:
br label %label_53
label_53:
%t77 = phi i1 [ 1, %label_51 ], [ 0, %label_52]
br i1 %t77, label %label_47, label %label_49
label_47:
%t86 = add i32 0, 1
call void @printi(i32 %t86)
br label %label_48
label_49:
%t87 = add i32 0, 0
call void @printi(i32 %t87)
br label %label_48
label_48:
%t89 = add i32 0, 0
%t90 = add i8 0, 0
%t92 = zext i8 %t90 to i32
%t91 = icmp sle i32 %t89, %t92
br i1 %t91, label %label_58, label %label_57
label_57:
%t93 = add i8 0, 0
%t94 = add i32 0, 0
%t96 = zext i8 %t93 to i32
%t95 = icmp slt i32 %t96, %t94
br i1 %t95, label %label_58, label %label_59
label_58:
br label %label_60
label_59:
br label %label_60
label_60:
%t88 = phi i1 [ 1, %label_58 ], [ 0, %label_59]
br i1 %t88, label %label_54, label %label_56
label_54:
%t97 = add i32 0, 1
call void @printi(i32 %t97)
br label %label_55
label_56:
%t98 = add i32 0, 0
call void @printi(i32 %t98)
br label %label_55
label_55:
%t100 = add i32 0, 0
%t101 = add i8 0, 1
%t103 = zext i8 %t101 to i32
%t102 = icmp slt i32 %t100, %t103
br i1 %t102, label %label_65, label %label_64
label_64:
%t104 = add i32 0, 1
%t105 = add i8 0, 0
%t107 = zext i8 %t105 to i32
%t106 = icmp sgt i32 %t104, %t107
br i1 %t106, label %label_65, label %label_66
label_65:
br label %label_67
label_66:
br label %label_67
label_67:
%t99 = phi i1 [ 1, %label_65 ], [ 0, %label_66]
br i1 %t99, label %label_61, label %label_63
label_61:
%t108 = add i32 0, 1
call void @printi(i32 %t108)
br label %label_62
label_63:
%t109 = add i32 0, 0
call void @printi(i32 %t109)
br label %label_62
label_62:
ret void
}
