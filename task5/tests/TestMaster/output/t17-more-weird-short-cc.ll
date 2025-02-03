@.str0 = constant [4 x i8] c"ff1\00"@.str1 = constant [4 x i8] c"ff2\00"@.str2 = constant [7 x i8] c"or1 ok\00"@.str3 = constant [11 x i8] c"or2 not ok\00"@.str4 = constant [7 x i8] c"or2 ok\00"@.str5 = constant [12 x i8] c"and1 not ok\00"@.str6 = constant [8 x i8] c"and1 ok\00"@.str7 = constant [17 x i8] c"should not print\00"@.str8 = constant [13 x i8] c"should print\00"@.str9 = constant [5 x i8] c"aha!\00"@.str10 = constant [4 x i8] c"yes\00"@.str11 = constant [3 x i8] c"no\00"@.str12 = constant [3 x i8] c"no\00"@.str13 = constant [3 x i8] c"no\00"
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
define i1 @f1() {
%t0 = getelementptr inbounds [4 x i8], [4 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
%t1 = add i1 0, 1
ret i1 %t1
}
define i1 @f2() {
%t2 = getelementptr inbounds [4 x i8], [4 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t2)
%t3 = add i1 0, 0
ret i1 %t3
}
define void @foo(i1) {
br i1 %0, label %label_0, label %label_2
label_0:
%t4 = add i32 0, 1
call void @printi(i32 %t4)
br label %label_1
label_2:
%t5 = add i32 0, 0
call void @printi(i32 %t5)
br label %label_1
label_1:
ret void
}
define void @main() {
%t7 = call i1 @f1()
br i1 %t7, label %label_6, label %label_5
label_5:
%t8 = call i1 @f2()
br i1 %t8, label %label_6, label %label_7
label_6:
br label %label_8
label_7:
br label %label_8
label_8:
%t6 = phi i1 [ 1, %label_6 ], [ 0, %label_7]
br i1 %t6, label %label_3, label %label_4
label_3:
%t9 = getelementptr inbounds [7 x i8], [7 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t9)
br label %label_4
label_4:
%t11 = call i1 @f1()
%t12 = xor i1 1, %t11
br i1 %t12, label %label_13, label %label_12
label_12:
%t13 = call i1 @f2()
br i1 %t13, label %label_13, label %label_14
label_13:
br label %label_15
label_14:
br label %label_15
label_15:
%t10 = phi i1 [ 1, %label_13 ], [ 0, %label_14]
br i1 %t10, label %label_9, label %label_11
label_9:
%t14 = getelementptr inbounds [11 x i8], [11 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t14)
br label %label_10
label_11:
%t15 = getelementptr inbounds [7 x i8], [7 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t15)
br label %label_10
label_10:
%t17 = call i1 @f1()
br i1 %t17, label %label_19, label %label_21
label_19:
%t18 = call i1 @f2()
br i1 %t18, label %label_20, label %label_21
label_20:
br label %label_22
label_21:
br label %label_22
label_22:
%t16 = phi i1 [ 1, %label_20 ], [ 0, %label_21]
br i1 %t16, label %label_16, label %label_18
label_16:
%t19 = getelementptr inbounds [12 x i8], [12 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t19)
br label %label_17
label_18:
%t20 = getelementptr inbounds [8 x i8], [8 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t20)
br label %label_17
label_17:
%t22 = call i1 @f2()
br i1 %t22, label %label_25, label %label_27
label_25:
%t23 = call i1 @f1()
br i1 %t23, label %label_26, label %label_27
label_26:
br label %label_28
label_27:
br label %label_28
label_28:
%t21 = phi i1 [ 1, %label_26 ], [ 0, %label_27]
br i1 %t21, label %label_23, label %label_24
label_23:
%t24 = getelementptr inbounds [17 x i8], [17 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t24)
br label %label_24
label_24:
%t26 = call i1 @f2()
br i1 %t26, label %label_31, label %label_33
label_31:
%t27 = call i1 @f1()
br i1 %t27, label %label_32, label %label_33
label_32:
br label %label_34
label_33:
br label %label_34
label_34:
%t25 = phi i1 [ 1, %label_32 ], [ 0, %label_33]
%t28 = xor i1 1, %t25
br i1 %t28, label %label_29, label %label_30
label_29:
%t29 = getelementptr inbounds [13 x i8], [13 x i8]* @.str8, i32 0, i32 0
call void @print(i8* %t29)
br label %label_30
label_30:
%t31 = call i1 @f2()
br i1 %t31, label %label_38, label %label_37
label_37:
%t33 = call i1 @f1()
br i1 %t33, label %label_41, label %label_43
label_41:
%t34 = call i1 @f2()
%t35 = xor i1 1, %t34
br i1 %t35, label %label_42, label %label_43
label_42:
br label %label_44
label_43:
br label %label_44
label_44:
%t32 = phi i1 [ 1, %label_42 ], [ 0, %label_43]
br i1 %t32, label %label_38, label %label_39
label_38:
br label %label_40
label_39:
br label %label_40
label_40:
%t30 = phi i1 [ 1, %label_38 ], [ 0, %label_39]
br i1 %t30, label %label_35, label %label_36
label_35:
%t36 = getelementptr inbounds [5 x i8], [5 x i8]* @.str9, i32 0, i32 0
call void @print(i8* %t36)
br label %label_36
label_36:
%t39 = call i1 @f2()
br i1 %t39, label %label_51, label %label_53
label_51:
%t40 = call i1 @f2()
br i1 %t40, label %label_52, label %label_53
label_52:
br label %label_54
label_53:
br label %label_54
label_54:
%t38 = phi i1 [ 1, %label_52 ], [ 0, %label_53]
br i1 %t38, label %label_48, label %label_47
label_47:
%t41 = call i1 @f1()
br i1 %t41, label %label_48, label %label_49
label_48:
br label %label_50
label_49:
br label %label_50
label_50:
%t37 = phi i1 [ 1, %label_48 ], [ 0, %label_49]
br i1 %t37, label %label_45, label %label_46
label_45:
%t42 = getelementptr inbounds [4 x i8], [4 x i8]* @.str10, i32 0, i32 0
call void @print(i8* %t42)
br label %label_46
label_46:
%t44 = call i1 @f1()
br i1 %t44, label %label_58, label %label_57
label_57:
%t46 = call i1 @f2()
br i1 %t46, label %label_61, label %label_63
label_61:
%t47 = call i1 @f1()
%t48 = xor i1 1, %t47
br i1 %t48, label %label_62, label %label_63
label_62:
br label %label_64
label_63:
br label %label_64
label_64:
%t45 = phi i1 [ 1, %label_62 ], [ 0, %label_63]
br i1 %t45, label %label_58, label %label_59
label_58:
br label %label_60
label_59:
br label %label_60
label_60:
%t43 = phi i1 [ 1, %label_58 ], [ 0, %label_59]
br i1 %t43, label %label_55, label %label_56
label_55:
%t49 = getelementptr inbounds [3 x i8], [3 x i8]* @.str11, i32 0, i32 0
call void @print(i8* %t49)
br label %label_56
label_56:
%t51 = call i1 @f1()
br i1 %t51, label %label_68, label %label_67
label_67:
%t53 = call i1 @f1()
br i1 %t53, label %label_71, label %label_73
label_71:
%t54 = call i1 @f2()
br i1 %t54, label %label_72, label %label_73
label_72:
br label %label_74
label_73:
br label %label_74
label_74:
%t52 = phi i1 [ 1, %label_72 ], [ 0, %label_73]
br i1 %t52, label %label_68, label %label_69
label_68:
br label %label_70
label_69:
br label %label_70
label_70:
%t50 = phi i1 [ 1, %label_68 ], [ 0, %label_69]
br i1 %t50, label %label_65, label %label_66
label_65:
%t55 = getelementptr inbounds [3 x i8], [3 x i8]* @.str12, i32 0, i32 0
call void @print(i8* %t55)
br label %label_66
label_66:
%t57 = call i1 @f1()
br i1 %t57, label %label_78, label %label_77
label_77:
%t59 = call i1 @f1()
br i1 %t59, label %label_81, label %label_83
label_81:
%t60 = call i1 @f2()
br i1 %t60, label %label_82, label %label_83
label_82:
br label %label_84
label_83:
br label %label_84
label_84:
%t58 = phi i1 [ 1, %label_82 ], [ 0, %label_83]
br i1 %t58, label %label_78, label %label_79
label_78:
br label %label_80
label_79:
br label %label_80
label_80:
%t56 = phi i1 [ 1, %label_78 ], [ 0, %label_79]
br i1 %t56, label %label_75, label %label_76
label_75:
%t61 = getelementptr inbounds [3 x i8], [3 x i8]* @.str13, i32 0, i32 0
call void @print(i8* %t61)
br label %label_76
label_76:
%t63 = call i1 @f1()
br i1 %t63, label %label_86, label %label_85
label_85:
%t64 = call i1 @f2()
br i1 %t64, label %label_86, label %label_87
label_86:
br label %label_88
label_87:
br label %label_88
label_88:
%t62 = phi i1 [ 1, %label_86 ], [ 0, %label_87]
call void @foo(i1 %t62)
%t66 = call i1 @f2()
br i1 %t66, label %label_90, label %label_89
label_89:
%t67 = call i1 @f1()
%t68 = xor i1 1, %t67
br i1 %t68, label %label_90, label %label_91
label_90:
br label %label_92
label_91:
br label %label_92
label_92:
%t65 = phi i1 [ 1, %label_90 ], [ 0, %label_91]
call void @foo(i1 %t65)
%t70 = call i1 @f1()
br i1 %t70, label %label_93, label %label_95
label_93:
%t71 = call i1 @f1()
br i1 %t71, label %label_94, label %label_95
label_94:
br label %label_96
label_95:
br label %label_96
label_96:
%t69 = phi i1 [ 1, %label_94 ], [ 0, %label_95]
call void @foo(i1 %t69)
%t73 = call i1 @f2()
br i1 %t73, label %label_97, label %label_99
label_97:
%t74 = call i1 @f2()
br i1 %t74, label %label_98, label %label_99
label_98:
br label %label_100
label_99:
br label %label_100
label_100:
%t72 = phi i1 [ 1, %label_98 ], [ 0, %label_99]
%t75 = xor i1 1, %t72
call void @foo(i1 %t75)
%t77 = call i1 @f1()
br i1 %t77, label %label_102, label %label_101
label_101:
%t78 = call i1 @f1()
%t79 = xor i1 1, %t78
br i1 %t79, label %label_102, label %label_103
label_102:
br label %label_104
label_103:
br label %label_104
label_104:
%t76 = phi i1 [ 1, %label_102 ], [ 0, %label_103]
call void @foo(i1 %t76)
%t82 = call i1 @f1()
br i1 %t82, label %label_109, label %label_111
label_109:
%t83 = call i1 @f2()
%t84 = xor i1 1, %t83
br i1 %t84, label %label_110, label %label_111
label_110:
br label %label_112
label_111:
br label %label_112
label_112:
%t81 = phi i1 [ 1, %label_110 ], [ 0, %label_111]
br i1 %t81, label %label_106, label %label_105
label_105:
%t85 = call i1 @f1()
br i1 %t85, label %label_106, label %label_107
label_106:
br label %label_108
label_107:
br label %label_108
label_108:
%t80 = phi i1 [ 1, %label_106 ], [ 0, %label_107]
call void @foo(i1 %t80)
%t87 = call i1 @f1()
br i1 %t87, label %label_114, label %label_113
label_113:
%t88 = call i1 @f2()
br i1 %t88, label %label_114, label %label_115
label_114:
br label %label_116
label_115:
br label %label_116
label_116:
%t86 = phi i1 [ 1, %label_114 ], [ 0, %label_115]
%t89 = zext i1 %t86 to i32
%t90 = alloca i32 
store i32 %t89, i32* %t90
%t92 = call i1 @f2()
br i1 %t92, label %label_118, label %label_117
label_117:
%t93 = call i1 @f1()
%t94 = xor i1 1, %t93
br i1 %t94, label %label_118, label %label_119
label_118:
br label %label_120
label_119:
br label %label_120
label_120:
%t91 = phi i1 [ 1, %label_118 ], [ 0, %label_119]
%t95 = zext i1 %t91 to i32
%t96 = alloca i32 
store i32 %t95, i32* %t96
%t98 = call i1 @f1()
br i1 %t98, label %label_121, label %label_123
label_121:
%t99 = call i1 @f1()
br i1 %t99, label %label_122, label %label_123
label_122:
br label %label_124
label_123:
br label %label_124
label_124:
%t97 = phi i1 [ 1, %label_122 ], [ 0, %label_123]
%t100 = zext i1 %t97 to i32
%t101 = alloca i32 
store i32 %t100, i32* %t101
%t102 = load i32, i32* %t90
%t103 = trunc i32 %t102 to i1
call void @foo(i1 %t103)
%t104 = load i32, i32* %t96
%t105 = trunc i32 %t104 to i1
call void @foo(i1 %t105)
%t106 = load i32, i32* %t101
%t107 = trunc i32 %t106 to i1
call void @foo(i1 %t107)
%t109 = call i1 @f2()
br i1 %t109, label %label_125, label %label_127
label_125:
%t110 = call i1 @f2()
br i1 %t110, label %label_126, label %label_127
label_126:
br label %label_128
label_127:
br label %label_128
label_128:
%t108 = phi i1 [ 1, %label_126 ], [ 0, %label_127]
%t111 = xor i1 1, %t108
%t112 = zext i1 %t111 to i32
store i32 %t112, i32* %t90
%t114 = call i1 @f1()
br i1 %t114, label %label_130, label %label_129
label_129:
%t115 = call i1 @f1()
%t116 = xor i1 1, %t115
br i1 %t116, label %label_130, label %label_131
label_130:
br label %label_132
label_131:
br label %label_132
label_132:
%t113 = phi i1 [ 1, %label_130 ], [ 0, %label_131]
%t117 = zext i1 %t113 to i32
store i32 %t117, i32* %t96
%t120 = call i1 @f1()
br i1 %t120, label %label_137, label %label_139
label_137:
%t121 = call i1 @f2()
%t122 = xor i1 1, %t121
br i1 %t122, label %label_138, label %label_139
label_138:
br label %label_140
label_139:
br label %label_140
label_140:
%t119 = phi i1 [ 1, %label_138 ], [ 0, %label_139]
br i1 %t119, label %label_134, label %label_133
label_133:
%t123 = call i1 @f1()
br i1 %t123, label %label_134, label %label_135
label_134:
br label %label_136
label_135:
br label %label_136
label_136:
%t118 = phi i1 [ 1, %label_134 ], [ 0, %label_135]
%t124 = zext i1 %t118 to i32
store i32 %t124, i32* %t101
%t125 = load i32, i32* %t90
%t126 = trunc i32 %t125 to i1
call void @foo(i1 %t126)
%t127 = load i32, i32* %t96
%t128 = trunc i32 %t127 to i1
call void @foo(i1 %t128)
%t129 = load i32, i32* %t101
%t130 = trunc i32 %t129 to i1
call void @foo(i1 %t130)
ret void
}
