@.str0 = constant [3 x i8] c"ok\00"@.str1 = constant [17 x i8] c"should not print\00"
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
%t13 = add i1 0, 1
br i1 %t13, label %label_50, label %label_52
label_50:
%t14 = add i1 0, 1
br i1 %t14, label %label_51, label %label_52
label_51:
br label %label_53
label_52:
br label %label_53
label_53:
%t12 = phi i1 [ 1, %label_51 ], [ 0, %label_52]
br i1 %t12, label %label_46, label %label_48
label_46:
%t15 = add i1 0, 1
br i1 %t15, label %label_47, label %label_48
label_47:
br label %label_49
label_48:
br label %label_49
label_49:
%t11 = phi i1 [ 1, %label_47 ], [ 0, %label_48]
br i1 %t11, label %label_42, label %label_44
label_42:
%t16 = add i32 0, 1
%t17 = add i32 0, 2
%t18 = icmp slt i32 %t16, %t17
br i1 %t18, label %label_43, label %label_44
label_43:
br label %label_45
label_44:
br label %label_45
label_45:
%t10 = phi i1 [ 1, %label_43 ], [ 0, %label_44]
br i1 %t10, label %label_38, label %label_40
label_38:
%t19 = add i32 0, 2
%t20 = add i32 0, 3
%t21 = icmp slt i32 %t19, %t20
br i1 %t21, label %label_39, label %label_40
label_39:
br label %label_41
label_40:
br label %label_41
label_41:
%t9 = phi i1 [ 1, %label_39 ], [ 0, %label_40]
br i1 %t9, label %label_34, label %label_36
label_34:
%t22 = add i32 0, 3
%t23 = add i32 0, 4
%t24 = icmp slt i32 %t22, %t23
br i1 %t24, label %label_35, label %label_36
label_35:
br label %label_37
label_36:
br label %label_37
label_37:
%t8 = phi i1 [ 1, %label_35 ], [ 0, %label_36]
br i1 %t8, label %label_30, label %label_32
label_30:
%t25 = add i32 0, 4
%t26 = add i32 0, 5
%t27 = icmp sle i32 %t25, %t26
br i1 %t27, label %label_31, label %label_32
label_31:
br label %label_33
label_32:
br label %label_33
label_33:
%t7 = phi i1 [ 1, %label_31 ], [ 0, %label_32]
br i1 %t7, label %label_26, label %label_28
label_26:
%t28 = add i32 0, 5
%t29 = add i32 0, 5
%t30 = icmp sle i32 %t28, %t29
br i1 %t30, label %label_27, label %label_28
label_27:
br label %label_29
label_28:
br label %label_29
label_29:
%t6 = phi i1 [ 1, %label_27 ], [ 0, %label_28]
br i1 %t6, label %label_22, label %label_24
label_22:
%t31 = add i1 0, 0
%t32 = xor i1 1, %t31
br i1 %t32, label %label_23, label %label_24
label_23:
br label %label_25
label_24:
br label %label_25
label_25:
%t5 = phi i1 [ 1, %label_23 ], [ 0, %label_24]
br i1 %t5, label %label_18, label %label_20
label_18:
%t33 = add i1 0, 1
br i1 %t33, label %label_19, label %label_20
label_19:
br label %label_21
label_20:
br label %label_21
label_21:
%t4 = phi i1 [ 1, %label_19 ], [ 0, %label_20]
br i1 %t4, label %label_14, label %label_16
label_14:
%t34 = add i1 0, 1
br i1 %t34, label %label_15, label %label_16
label_15:
br label %label_17
label_16:
br label %label_17
label_17:
%t3 = phi i1 [ 1, %label_15 ], [ 0, %label_16]
br i1 %t3, label %label_10, label %label_12
label_10:
%t35 = add i1 0, 1
br i1 %t35, label %label_11, label %label_12
label_11:
br label %label_13
label_12:
br label %label_13
label_13:
%t2 = phi i1 [ 1, %label_11 ], [ 0, %label_12]
br i1 %t2, label %label_6, label %label_8
label_6:
%t36 = add i1 0, 0
%t37 = xor i1 1, %t36
br i1 %t37, label %label_7, label %label_8
label_7:
br label %label_9
label_8:
br label %label_9
label_9:
%t1 = phi i1 [ 1, %label_7 ], [ 0, %label_8]
br i1 %t1, label %label_2, label %label_4
label_2:
%t39 = add i32 0, 1
%t40 = add i32 0, 2
%t38 = add i32 %t39, %t40
%t47 = add i32 0, 1
%t48 = add i32 0, 2
%t46 = add i32 %t47, %t48
%t49 = add i32 0, 3
%t45 = add i32 %t46, %t49
%t50 = add i32 0, 4
%t44 = add i32 %t45, %t50
%t51 = add i32 0, 5
%t43 = add i32 %t44, %t51
%t52 = add i32 0, 5
%t42 = add i32 %t43, %t52
%t53 = add i32 0, 1
%t41 = add i32 %t42, %t53
%t54 = icmp sle i32 %t38, %t41
br i1 %t54, label %label_3, label %label_4
label_3:
br label %label_5
label_4:
br label %label_5
label_5:
%t0 = phi i1 [ 1, %label_3 ], [ 0, %label_4]
br i1 %t0, label %label_0, label %label_1
label_0:
%t55 = getelementptr inbounds [3 x i8], [3 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t55)
br label %label_1
label_1:
%t60 = add i1 0, 0
br i1 %t60, label %label_69, label %label_68
label_68:
%t64 = add i1 0, 0
br i1 %t64, label %label_80, label %label_82
label_80:
%t65 = add i1 0, 1
br i1 %t65, label %label_81, label %label_82
label_81:
br label %label_83
label_82:
br label %label_83
label_83:
%t63 = phi i1 [ 1, %label_81 ], [ 0, %label_82]
br i1 %t63, label %label_76, label %label_78
label_76:
%t66 = add i1 0, 0
%t67 = xor i1 1, %t66
br i1 %t67, label %label_77, label %label_78
label_77:
br label %label_79
label_78:
br label %label_79
label_79:
%t62 = phi i1 [ 1, %label_77 ], [ 0, %label_78]
br i1 %t62, label %label_72, label %label_74
label_72:
%t68 = add i1 0, 0
br i1 %t68, label %label_73, label %label_74
label_73:
br label %label_75
label_74:
br label %label_75
label_75:
%t61 = phi i1 [ 1, %label_73 ], [ 0, %label_74]
br i1 %t61, label %label_69, label %label_70
label_69:
br label %label_71
label_70:
br label %label_71
label_71:
%t59 = phi i1 [ 1, %label_69 ], [ 0, %label_70]
br i1 %t59, label %label_65, label %label_64
label_64:
%t70 = add i1 0, 0
%t71 = xor i1 1, %t70
br i1 %t71, label %label_84, label %label_86
label_84:
%t72 = add i1 0, 0
br i1 %t72, label %label_85, label %label_86
label_85:
br label %label_87
label_86:
br label %label_87
label_87:
%t69 = phi i1 [ 1, %label_85 ], [ 0, %label_86]
br i1 %t69, label %label_65, label %label_66
label_65:
br label %label_67
label_66:
br label %label_67
label_67:
%t58 = phi i1 [ 1, %label_65 ], [ 0, %label_66]
br i1 %t58, label %label_61, label %label_60
label_60:
%t73 = add i1 0, 0
br i1 %t73, label %label_61, label %label_62
label_61:
br label %label_63
label_62:
br label %label_63
label_63:
%t57 = phi i1 [ 1, %label_61 ], [ 0, %label_62]
br i1 %t57, label %label_57, label %label_56
label_56:
%t76 = add i1 0, 0
br i1 %t76, label %label_92, label %label_94
label_92:
%t77 = add i1 0, 0
%t78 = xor i1 1, %t77
br i1 %t78, label %label_93, label %label_94
label_93:
br label %label_95
label_94:
br label %label_95
label_95:
%t75 = phi i1 [ 1, %label_93 ], [ 0, %label_94]
br i1 %t75, label %label_88, label %label_90
label_88:
%t84 = add i32 0, 9
%t85 = add i32 0, 8
%t83 = add i32 %t84, %t85
%t86 = add i32 0, 7
%t82 = add i32 %t83, %t86
%t87 = add i32 0, 6
%t81 = add i32 %t82, %t87
%t88 = add i32 0, 5
%t80 = add i32 %t81, %t88
%t89 = add i32 0, 4
%t79 = add i32 %t80, %t89
%t90 = add i32 0, 50
%t91 = icmp slt i32 %t79, %t90
br i1 %t91, label %label_89, label %label_90
label_89:
br label %label_91
label_90:
br label %label_91
label_91:
%t74 = phi i1 [ 1, %label_89 ], [ 0, %label_90]
br i1 %t74, label %label_57, label %label_58
label_57:
br label %label_59
label_58:
br label %label_59
label_59:
%t56 = phi i1 [ 1, %label_57 ], [ 0, %label_58]
br i1 %t56, label %label_54, label %label_55
label_54:
%t92 = getelementptr inbounds [17 x i8], [17 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t92)
br label %label_55
label_55:
ret void
}
