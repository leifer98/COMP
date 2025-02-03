@.str0 = constant [17 x i8] c"TIC TAC TOE GAME\00"@.str1 = constant [98 x i8] c"Ignore the leading 1, 0 represents an empty cell, 8 represents player 1 and 4 represents player 2\00"@.str2 = constant [48 x i8] c"Enter your play, board is numbered like a phone\00"@.str3 = constant [28 x i8] c"ERROR, SHOULD NEVER HAPPEN!\00"@.str4 = constant [78 x i8] c"Someone won!! congrats to the winner and suck it to the loser. the winner is:\00"@.str5 = constant [2 x i8] c" \00"@.str6 = constant [21 x i8] c"Again the winner is:\00"@.str7 = constant [13 x i8] c"Its a tie :<\00"
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
%t0 = getelementptr inbounds [17 x i8], [17 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
%t1 = add i1 0, 1
%t2 = zext i1 %t1 to i32
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = add i32 0, 0
%t5 = alloca i32 
store i32 %t4, i32* %t5
%t6 = add i32 0, 0
%t7 = alloca i32 
store i32 %t6, i32* %t7
%t8 = add i32 0, 0
%t9 = alloca i32 
store i32 %t8, i32* %t9
%t10 = add i32 0, 0
%t11 = alloca i32 
store i32 %t10, i32* %t11
%t12 = add i32 0, 0
%t13 = alloca i32 
store i32 %t12, i32* %t13
%t14 = add i32 0, 0
%t15 = alloca i32 
store i32 %t14, i32* %t15
%t16 = add i32 0, 0
%t17 = alloca i32 
store i32 %t16, i32* %t17
%t18 = add i32 0, 0
%t19 = alloca i32 
store i32 %t18, i32* %t19
%t20 = add i32 0, 0
%t21 = alloca i32 
store i32 %t20, i32* %t21
%t22 = add i32 0, 8
%t23 = alloca i32 
store i32 %t22, i32* %t23
%t24 = add i32 0, 0
%t25 = alloca i32 
store i32 %t24, i32* %t25
%t26 = add i32 0, 5
%t27 = alloca i32 
store i32 %t26, i32* %t27
br label %label_0
label_0:
%t28 = load i32, i32* %t3
%t29 = trunc i32 %t28 to i1
br i1 %t29, label %label_1, label %label_2
label_1:
%t30 = getelementptr inbounds [98 x i8], [98 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t30)
%t34 = add i32 0, 1000
%t36 = add i32 0, 100
%t37 = load i32, i32* %t5
%t35 = mul i32 %t36, %t37
%t33 = add i32 %t34, %t35
%t39 = add i32 0, 10
%t40 = load i32, i32* %t7
%t38 = mul i32 %t39, %t40
%t32 = add i32 %t33, %t38
%t42 = add i32 0, 1
%t43 = load i32, i32* %t9
%t41 = mul i32 %t42, %t43
%t31 = add i32 %t32, %t41
call void @printi(i32 %t31)
%t47 = add i32 0, 1000
%t49 = add i32 0, 100
%t50 = load i32, i32* %t11
%t48 = mul i32 %t49, %t50
%t46 = add i32 %t47, %t48
%t52 = add i32 0, 10
%t53 = load i32, i32* %t13
%t51 = mul i32 %t52, %t53
%t45 = add i32 %t46, %t51
%t55 = add i32 0, 1
%t56 = load i32, i32* %t15
%t54 = mul i32 %t55, %t56
%t44 = add i32 %t45, %t54
call void @printi(i32 %t44)
%t60 = add i32 0, 1000
%t62 = add i32 0, 100
%t63 = load i32, i32* %t17
%t61 = mul i32 %t62, %t63
%t59 = add i32 %t60, %t61
%t65 = add i32 0, 10
%t66 = load i32, i32* %t19
%t64 = mul i32 %t65, %t66
%t58 = add i32 %t59, %t64
%t68 = add i32 0, 1
%t69 = load i32, i32* %t21
%t67 = mul i32 %t68, %t69
%t57 = add i32 %t58, %t67
call void @printi(i32 %t57)
%t70 = getelementptr inbounds [48 x i8], [48 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t70)
%t71 = add i32 0, 123
call void @printi(i32 %t71)
%t72 = add i32 0, 456
call void @printi(i32 %t72)
%t73 = add i32 0, 789
call void @printi(i32 %t73)
br label %label_3
label_3:
%t84 = load i32, i32* %t27
%t85 = add i32 0, 0
%t86 = icmp sle i32 %t84, %t85
br i1 %t86, label %label_43, label %label_42
label_42:
%t87 = load i32, i32* %t27
%t88 = add i32 0, 9
%t89 = icmp sgt i32 %t87, %t88
br i1 %t89, label %label_43, label %label_44
label_43:
br label %label_45
label_44:
br label %label_45
label_45:
%t83 = phi i1 [ 1, %label_43 ], [ 0, %label_44]
br i1 %t83, label %label_39, label %label_38
label_38:
%t91 = load i32, i32* %t27
%t92 = add i32 0, 1
%t93 = icmp eq i32 %t91, %t92
br i1 %t93, label %label_46, label %label_48
label_46:
%t94 = load i32, i32* %t5
%t95 = add i32 0, 0
%t96 = icmp ne i32 %t94, %t95
br i1 %t96, label %label_47, label %label_48
label_47:
br label %label_49
label_48:
br label %label_49
label_49:
%t90 = phi i1 [ 1, %label_47 ], [ 0, %label_48]
br i1 %t90, label %label_39, label %label_40
label_39:
br label %label_41
label_40:
br label %label_41
label_41:
%t82 = phi i1 [ 1, %label_39 ], [ 0, %label_40]
br i1 %t82, label %label_35, label %label_34
label_34:
%t98 = load i32, i32* %t27
%t99 = add i32 0, 2
%t100 = icmp eq i32 %t98, %t99
br i1 %t100, label %label_50, label %label_52
label_50:
%t101 = load i32, i32* %t7
%t102 = add i32 0, 0
%t103 = icmp ne i32 %t101, %t102
br i1 %t103, label %label_51, label %label_52
label_51:
br label %label_53
label_52:
br label %label_53
label_53:
%t97 = phi i1 [ 1, %label_51 ], [ 0, %label_52]
br i1 %t97, label %label_35, label %label_36
label_35:
br label %label_37
label_36:
br label %label_37
label_37:
%t81 = phi i1 [ 1, %label_35 ], [ 0, %label_36]
br i1 %t81, label %label_31, label %label_30
label_30:
%t105 = load i32, i32* %t27
%t106 = add i32 0, 3
%t107 = icmp eq i32 %t105, %t106
br i1 %t107, label %label_54, label %label_56
label_54:
%t108 = load i32, i32* %t9
%t109 = add i32 0, 0
%t110 = icmp ne i32 %t108, %t109
br i1 %t110, label %label_55, label %label_56
label_55:
br label %label_57
label_56:
br label %label_57
label_57:
%t104 = phi i1 [ 1, %label_55 ], [ 0, %label_56]
br i1 %t104, label %label_31, label %label_32
label_31:
br label %label_33
label_32:
br label %label_33
label_33:
%t80 = phi i1 [ 1, %label_31 ], [ 0, %label_32]
br i1 %t80, label %label_27, label %label_26
label_26:
%t112 = load i32, i32* %t27
%t113 = add i32 0, 4
%t114 = icmp eq i32 %t112, %t113
br i1 %t114, label %label_58, label %label_60
label_58:
%t115 = load i32, i32* %t11
%t116 = add i32 0, 0
%t117 = icmp ne i32 %t115, %t116
br i1 %t117, label %label_59, label %label_60
label_59:
br label %label_61
label_60:
br label %label_61
label_61:
%t111 = phi i1 [ 1, %label_59 ], [ 0, %label_60]
br i1 %t111, label %label_27, label %label_28
label_27:
br label %label_29
label_28:
br label %label_29
label_29:
%t79 = phi i1 [ 1, %label_27 ], [ 0, %label_28]
br i1 %t79, label %label_23, label %label_22
label_22:
%t119 = load i32, i32* %t27
%t120 = add i32 0, 5
%t121 = icmp eq i32 %t119, %t120
br i1 %t121, label %label_62, label %label_64
label_62:
%t122 = load i32, i32* %t13
%t123 = add i32 0, 0
%t124 = icmp ne i32 %t122, %t123
br i1 %t124, label %label_63, label %label_64
label_63:
br label %label_65
label_64:
br label %label_65
label_65:
%t118 = phi i1 [ 1, %label_63 ], [ 0, %label_64]
br i1 %t118, label %label_23, label %label_24
label_23:
br label %label_25
label_24:
br label %label_25
label_25:
%t78 = phi i1 [ 1, %label_23 ], [ 0, %label_24]
br i1 %t78, label %label_19, label %label_18
label_18:
%t126 = load i32, i32* %t27
%t127 = add i32 0, 6
%t128 = icmp eq i32 %t126, %t127
br i1 %t128, label %label_66, label %label_68
label_66:
%t129 = load i32, i32* %t15
%t130 = add i32 0, 0
%t131 = icmp ne i32 %t129, %t130
br i1 %t131, label %label_67, label %label_68
label_67:
br label %label_69
label_68:
br label %label_69
label_69:
%t125 = phi i1 [ 1, %label_67 ], [ 0, %label_68]
br i1 %t125, label %label_19, label %label_20
label_19:
br label %label_21
label_20:
br label %label_21
label_21:
%t77 = phi i1 [ 1, %label_19 ], [ 0, %label_20]
br i1 %t77, label %label_15, label %label_14
label_14:
%t133 = load i32, i32* %t27
%t134 = add i32 0, 7
%t135 = icmp eq i32 %t133, %t134
br i1 %t135, label %label_70, label %label_72
label_70:
%t136 = load i32, i32* %t17
%t137 = add i32 0, 0
%t138 = icmp ne i32 %t136, %t137
br i1 %t138, label %label_71, label %label_72
label_71:
br label %label_73
label_72:
br label %label_73
label_73:
%t132 = phi i1 [ 1, %label_71 ], [ 0, %label_72]
br i1 %t132, label %label_15, label %label_16
label_15:
br label %label_17
label_16:
br label %label_17
label_17:
%t76 = phi i1 [ 1, %label_15 ], [ 0, %label_16]
br i1 %t76, label %label_11, label %label_10
label_10:
%t140 = load i32, i32* %t27
%t141 = add i32 0, 8
%t142 = icmp eq i32 %t140, %t141
br i1 %t142, label %label_74, label %label_76
label_74:
%t143 = load i32, i32* %t19
%t144 = add i32 0, 0
%t145 = icmp ne i32 %t143, %t144
br i1 %t145, label %label_75, label %label_76
label_75:
br label %label_77
label_76:
br label %label_77
label_77:
%t139 = phi i1 [ 1, %label_75 ], [ 0, %label_76]
br i1 %t139, label %label_11, label %label_12
label_11:
br label %label_13
label_12:
br label %label_13
label_13:
%t75 = phi i1 [ 1, %label_11 ], [ 0, %label_12]
br i1 %t75, label %label_7, label %label_6
label_6:
%t147 = load i32, i32* %t27
%t148 = add i32 0, 9
%t149 = icmp eq i32 %t147, %t148
br i1 %t149, label %label_78, label %label_80
label_78:
%t150 = load i32, i32* %t21
%t151 = add i32 0, 0
%t152 = icmp ne i32 %t150, %t151
br i1 %t152, label %label_79, label %label_80
label_79:
br label %label_81
label_80:
br label %label_81
label_81:
%t146 = phi i1 [ 1, %label_79 ], [ 0, %label_80]
br i1 %t146, label %label_7, label %label_8
label_7:
br label %label_9
label_8:
br label %label_9
label_9:
%t74 = phi i1 [ 1, %label_7 ], [ 0, %label_8]
br i1 %t74, label %label_4, label %label_5
label_4:
%t154 = load i32, i32* %t25
%t155 = add i32 0, 1
%t153 = add i32 %t154, %t155
store i32 %t153, i32* %t25
%t156 = load i32, i32* %t25
%t157 = add i32 0, 1
%t158 = icmp eq i32 %t156, %t157
br i1 %t158, label %label_82, label %label_84
label_82:
%t159 = add i32 0, 5
store i32 %t159, i32* %t27
br label %label_83
label_84:
%t160 = load i32, i32* %t25
%t161 = add i32 0, 2
%t162 = icmp eq i32 %t160, %t161
br i1 %t162, label %label_85, label %label_87
label_85:
%t163 = add i32 0, 5
store i32 %t163, i32* %t27
br label %label_86
label_87:
%t164 = load i32, i32* %t25
%t165 = add i32 0, 3
%t166 = icmp eq i32 %t164, %t165
br i1 %t166, label %label_88, label %label_90
label_88:
%t167 = add i32 0, 1
store i32 %t167, i32* %t27
br label %label_89
label_90:
%t168 = load i32, i32* %t25
%t169 = add i32 0, 4
%t170 = icmp eq i32 %t168, %t169
br i1 %t170, label %label_91, label %label_93
label_91:
%t171 = add i32 0, 1
store i32 %t171, i32* %t27
br label %label_92
label_93:
%t172 = load i32, i32* %t25
%t173 = add i32 0, 5
%t174 = icmp eq i32 %t172, %t173
br i1 %t174, label %label_94, label %label_96
label_94:
%t175 = add i32 0, 5
store i32 %t175, i32* %t27
br label %label_95
label_96:
%t176 = load i32, i32* %t25
%t177 = add i32 0, 6
%t178 = icmp eq i32 %t176, %t177
br i1 %t178, label %label_97, label %label_99
label_97:
%t179 = add i32 0, 3
store i32 %t179, i32* %t27
br label %label_98
label_99:
%t180 = load i32, i32* %t25
%t181 = add i32 0, 7
%t182 = icmp eq i32 %t180, %t181
br i1 %t182, label %label_100, label %label_102
label_100:
%t183 = add i32 0, 1
store i32 %t183, i32* %t27
br label %label_101
label_102:
%t184 = load i32, i32* %t25
%t185 = add i32 0, 8
%t186 = icmp eq i32 %t184, %t185
br i1 %t186, label %label_103, label %label_105
label_103:
%t187 = add i32 0, 3
store i32 %t187, i32* %t27
br label %label_104
label_105:
%t188 = load i32, i32* %t25
%t189 = add i32 0, 9
%t190 = icmp eq i32 %t188, %t189
br i1 %t190, label %label_106, label %label_108
label_106:
%t191 = add i32 0, 5
store i32 %t191, i32* %t27
br label %label_107
label_108:
%t192 = load i32, i32* %t25
%t193 = add i32 0, 10
%t194 = icmp eq i32 %t192, %t193
br i1 %t194, label %label_109, label %label_111
label_109:
%t195 = add i32 0, 7
store i32 %t195, i32* %t27
br label %label_110
label_111:
%t196 = load i32, i32* %t25
%t197 = add i32 0, 11
%t198 = icmp eq i32 %t196, %t197
br i1 %t198, label %label_112, label %label_114
label_112:
%t199 = add i32 0, 1
store i32 %t199, i32* %t27
br label %label_113
label_114:
%t200 = load i32, i32* %t25
%t201 = add i32 0, 12
%t202 = icmp eq i32 %t200, %t201
br i1 %t202, label %label_115, label %label_117
label_115:
%t203 = add i32 0, 3
store i32 %t203, i32* %t27
br label %label_116
label_117:
%t204 = load i32, i32* %t25
%t205 = add i32 0, 13
%t206 = icmp eq i32 %t204, %t205
br i1 %t206, label %label_118, label %label_120
label_118:
%t207 = add i32 0, 5
store i32 %t207, i32* %t27
br label %label_119
label_120:
%t208 = load i32, i32* %t25
%t209 = add i32 0, 14
%t210 = icmp eq i32 %t208, %t209
br i1 %t210, label %label_121, label %label_123
label_121:
%t211 = add i32 0, 7
store i32 %t211, i32* %t27
br label %label_122
label_123:
%t212 = load i32, i32* %t25
%t213 = add i32 0, 15
%t214 = icmp eq i32 %t212, %t213
br i1 %t214, label %label_124, label %label_126
label_124:
%t215 = add i32 0, 4
store i32 %t215, i32* %t27
br label %label_125
label_126:
%t216 = load i32, i32* %t25
%t217 = add i32 0, 16
%t218 = icmp eq i32 %t216, %t217
br i1 %t218, label %label_127, label %label_129
label_127:
%t219 = add i32 0, 6
store i32 %t219, i32* %t27
br label %label_128
label_129:
%t220 = load i32, i32* %t25
%t221 = add i32 0, 17
%t222 = icmp eq i32 %t220, %t221
br i1 %t222, label %label_130, label %label_132
label_130:
%t223 = add i32 0, 1
store i32 %t223, i32* %t27
br label %label_131
label_132:
%t224 = load i32, i32* %t25
%t225 = add i32 0, 18
%t226 = icmp eq i32 %t224, %t225
br i1 %t226, label %label_133, label %label_135
label_133:
%t227 = add i32 0, 2
store i32 %t227, i32* %t27
br label %label_134
label_135:
%t228 = load i32, i32* %t25
%t229 = add i32 0, 19
%t230 = icmp eq i32 %t228, %t229
br i1 %t230, label %label_136, label %label_138
label_136:
%t231 = add i32 0, 3
store i32 %t231, i32* %t27
br label %label_137
label_138:
%t232 = load i32, i32* %t25
%t233 = add i32 0, 20
%t234 = icmp eq i32 %t232, %t233
br i1 %t234, label %label_139, label %label_141
label_139:
%t235 = add i32 0, 4
store i32 %t235, i32* %t27
br label %label_140
label_141:
%t236 = load i32, i32* %t25
%t237 = add i32 0, 21
%t238 = icmp eq i32 %t236, %t237
br i1 %t238, label %label_142, label %label_144
label_142:
%t239 = add i32 0, 5
store i32 %t239, i32* %t27
br label %label_143
label_144:
%t240 = load i32, i32* %t25
%t241 = add i32 0, 22
%t242 = icmp eq i32 %t240, %t241
br i1 %t242, label %label_145, label %label_147
label_145:
%t243 = add i32 0, 6
store i32 %t243, i32* %t27
br label %label_146
label_147:
%t244 = load i32, i32* %t25
%t245 = add i32 0, 23
%t246 = icmp eq i32 %t244, %t245
br i1 %t246, label %label_148, label %label_150
label_148:
%t247 = add i32 0, 7
store i32 %t247, i32* %t27
br label %label_149
label_150:
%t248 = load i32, i32* %t25
%t249 = add i32 0, 24
%t250 = icmp eq i32 %t248, %t249
br i1 %t250, label %label_151, label %label_153
label_151:
%t251 = add i32 0, 8
store i32 %t251, i32* %t27
br label %label_152
label_153:
%t252 = load i32, i32* %t25
%t253 = add i32 0, 25
%t254 = icmp eq i32 %t252, %t253
br i1 %t254, label %label_154, label %label_155
label_154:
%t255 = add i32 0, 9
store i32 %t255, i32* %t27
br label %label_155
label_155:
br label %label_152
label_152:
br label %label_149
label_149:
br label %label_146
label_146:
br label %label_143
label_143:
br label %label_140
label_140:
br label %label_137
label_137:
br label %label_134
label_134:
br label %label_131
label_131:
br label %label_128
label_128:
br label %label_125
label_125:
br label %label_122
label_122:
br label %label_119
label_119:
br label %label_116
label_116:
br label %label_113
label_113:
br label %label_110
label_110:
br label %label_107
label_107:
br label %label_104
label_104:
br label %label_101
label_101:
br label %label_98
label_98:
br label %label_95
label_95:
br label %label_92
label_92:
br label %label_89
label_89:
br label %label_86
label_86:
br label %label_83
label_83:
br label %label_3
label_5:
%t256 = load i32, i32* %t27
%t257 = add i32 0, 1
%t258 = icmp eq i32 %t256, %t257
br i1 %t258, label %label_156, label %label_158
label_156:
%t259 = load i32, i32* %t23
store i32 %t259, i32* %t5
br label %label_157
label_158:
%t260 = load i32, i32* %t27
%t261 = add i32 0, 2
%t262 = icmp eq i32 %t260, %t261
br i1 %t262, label %label_159, label %label_161
label_159:
%t263 = load i32, i32* %t23
store i32 %t263, i32* %t7
br label %label_160
label_161:
%t264 = load i32, i32* %t27
%t265 = add i32 0, 3
%t266 = icmp eq i32 %t264, %t265
br i1 %t266, label %label_162, label %label_164
label_162:
%t267 = load i32, i32* %t23
store i32 %t267, i32* %t9
br label %label_163
label_164:
%t268 = load i32, i32* %t27
%t269 = add i32 0, 4
%t270 = icmp eq i32 %t268, %t269
br i1 %t270, label %label_165, label %label_167
label_165:
%t271 = load i32, i32* %t23
store i32 %t271, i32* %t11
br label %label_166
label_167:
%t272 = load i32, i32* %t27
%t273 = add i32 0, 5
%t274 = icmp eq i32 %t272, %t273
br i1 %t274, label %label_168, label %label_170
label_168:
%t275 = load i32, i32* %t23
store i32 %t275, i32* %t13
br label %label_169
label_170:
%t276 = load i32, i32* %t27
%t277 = add i32 0, 6
%t278 = icmp eq i32 %t276, %t277
br i1 %t278, label %label_171, label %label_173
label_171:
%t279 = load i32, i32* %t23
store i32 %t279, i32* %t15
br label %label_172
label_173:
%t280 = load i32, i32* %t27
%t281 = add i32 0, 7
%t282 = icmp eq i32 %t280, %t281
br i1 %t282, label %label_174, label %label_176
label_174:
%t283 = load i32, i32* %t23
store i32 %t283, i32* %t17
br label %label_175
label_176:
%t284 = load i32, i32* %t27
%t285 = add i32 0, 8
%t286 = icmp eq i32 %t284, %t285
br i1 %t286, label %label_177, label %label_179
label_177:
%t287 = load i32, i32* %t23
store i32 %t287, i32* %t19
br label %label_178
label_179:
%t288 = load i32, i32* %t27
%t289 = add i32 0, 9
%t290 = icmp eq i32 %t288, %t289
br i1 %t290, label %label_180, label %label_182
label_180:
%t291 = load i32, i32* %t23
store i32 %t291, i32* %t21
br label %label_181
label_182:
%t292 = getelementptr inbounds [28 x i8], [28 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t292)
br label %label_181
label_181:
br label %label_178
label_178:
br label %label_175
label_175:
br label %label_172
label_172:
br label %label_169
label_169:
br label %label_166
label_166:
br label %label_163
label_163:
br label %label_160
label_160:
br label %label_157
label_157:
%t293 = load i32, i32* %t23
%t294 = add i32 0, 8
%t295 = icmp eq i32 %t293, %t294
br i1 %t295, label %label_183, label %label_185
label_183:
%t296 = add i32 0, 4
store i32 %t296, i32* %t23
br label %label_184
label_185:
%t297 = add i32 0, 8
store i32 %t297, i32* %t23
br label %label_184
label_184:
%t298 = add i32 0, 0
%t299 = alloca i32 
store i32 %t298, i32* %t299
%t309 = load i32, i32* %t5
%t310 = load i32, i32* %t7
%t311 = icmp eq i32 %t309, %t310
br i1 %t311, label %label_220, label %label_222
label_220:
%t312 = load i32, i32* %t5
%t313 = load i32, i32* %t9
%t314 = icmp eq i32 %t312, %t313
br i1 %t314, label %label_221, label %label_222
label_221:
br label %label_223
label_222:
br label %label_223
label_223:
%t308 = phi i1 [ 1, %label_221 ], [ 0, %label_222]
br i1 %t308, label %label_216, label %label_218
label_216:
%t315 = load i32, i32* %t5
%t316 = add i32 0, 0
%t317 = icmp ne i32 %t315, %t316
br i1 %t317, label %label_217, label %label_218
label_217:
br label %label_219
label_218:
br label %label_219
label_219:
%t307 = phi i1 [ 1, %label_217 ], [ 0, %label_218]
br i1 %t307, label %label_213, label %label_212
label_212:
%t320 = load i32, i32* %t11
%t321 = load i32, i32* %t13
%t322 = icmp eq i32 %t320, %t321
br i1 %t322, label %label_228, label %label_230
label_228:
%t323 = load i32, i32* %t11
%t324 = load i32, i32* %t15
%t325 = icmp eq i32 %t323, %t324
br i1 %t325, label %label_229, label %label_230
label_229:
br label %label_231
label_230:
br label %label_231
label_231:
%t319 = phi i1 [ 1, %label_229 ], [ 0, %label_230]
br i1 %t319, label %label_224, label %label_226
label_224:
%t326 = load i32, i32* %t11
%t327 = add i32 0, 0
%t328 = icmp ne i32 %t326, %t327
br i1 %t328, label %label_225, label %label_226
label_225:
br label %label_227
label_226:
br label %label_227
label_227:
%t318 = phi i1 [ 1, %label_225 ], [ 0, %label_226]
br i1 %t318, label %label_213, label %label_214
label_213:
br label %label_215
label_214:
br label %label_215
label_215:
%t306 = phi i1 [ 1, %label_213 ], [ 0, %label_214]
br i1 %t306, label %label_209, label %label_208
label_208:
%t331 = load i32, i32* %t17
%t332 = load i32, i32* %t19
%t333 = icmp eq i32 %t331, %t332
br i1 %t333, label %label_236, label %label_238
label_236:
%t334 = load i32, i32* %t17
%t335 = load i32, i32* %t21
%t336 = icmp eq i32 %t334, %t335
br i1 %t336, label %label_237, label %label_238
label_237:
br label %label_239
label_238:
br label %label_239
label_239:
%t330 = phi i1 [ 1, %label_237 ], [ 0, %label_238]
br i1 %t330, label %label_232, label %label_234
label_232:
%t337 = load i32, i32* %t17
%t338 = add i32 0, 0
%t339 = icmp ne i32 %t337, %t338
br i1 %t339, label %label_233, label %label_234
label_233:
br label %label_235
label_234:
br label %label_235
label_235:
%t329 = phi i1 [ 1, %label_233 ], [ 0, %label_234]
br i1 %t329, label %label_209, label %label_210
label_209:
br label %label_211
label_210:
br label %label_211
label_211:
%t305 = phi i1 [ 1, %label_209 ], [ 0, %label_210]
br i1 %t305, label %label_205, label %label_204
label_204:
%t342 = load i32, i32* %t5
%t343 = load i32, i32* %t11
%t344 = icmp eq i32 %t342, %t343
br i1 %t344, label %label_244, label %label_246
label_244:
%t345 = load i32, i32* %t5
%t346 = load i32, i32* %t17
%t347 = icmp eq i32 %t345, %t346
br i1 %t347, label %label_245, label %label_246
label_245:
br label %label_247
label_246:
br label %label_247
label_247:
%t341 = phi i1 [ 1, %label_245 ], [ 0, %label_246]
br i1 %t341, label %label_240, label %label_242
label_240:
%t348 = load i32, i32* %t5
%t349 = add i32 0, 0
%t350 = icmp ne i32 %t348, %t349
br i1 %t350, label %label_241, label %label_242
label_241:
br label %label_243
label_242:
br label %label_243
label_243:
%t340 = phi i1 [ 1, %label_241 ], [ 0, %label_242]
br i1 %t340, label %label_205, label %label_206
label_205:
br label %label_207
label_206:
br label %label_207
label_207:
%t304 = phi i1 [ 1, %label_205 ], [ 0, %label_206]
br i1 %t304, label %label_201, label %label_200
label_200:
%t353 = load i32, i32* %t7
%t354 = load i32, i32* %t13
%t355 = icmp eq i32 %t353, %t354
br i1 %t355, label %label_252, label %label_254
label_252:
%t356 = load i32, i32* %t7
%t357 = load i32, i32* %t19
%t358 = icmp eq i32 %t356, %t357
br i1 %t358, label %label_253, label %label_254
label_253:
br label %label_255
label_254:
br label %label_255
label_255:
%t352 = phi i1 [ 1, %label_253 ], [ 0, %label_254]
br i1 %t352, label %label_248, label %label_250
label_248:
%t359 = load i32, i32* %t7
%t360 = add i32 0, 0
%t361 = icmp ne i32 %t359, %t360
br i1 %t361, label %label_249, label %label_250
label_249:
br label %label_251
label_250:
br label %label_251
label_251:
%t351 = phi i1 [ 1, %label_249 ], [ 0, %label_250]
br i1 %t351, label %label_201, label %label_202
label_201:
br label %label_203
label_202:
br label %label_203
label_203:
%t303 = phi i1 [ 1, %label_201 ], [ 0, %label_202]
br i1 %t303, label %label_197, label %label_196
label_196:
%t364 = load i32, i32* %t9
%t365 = load i32, i32* %t15
%t366 = icmp eq i32 %t364, %t365
br i1 %t366, label %label_260, label %label_262
label_260:
%t367 = load i32, i32* %t9
%t368 = load i32, i32* %t21
%t369 = icmp eq i32 %t367, %t368
br i1 %t369, label %label_261, label %label_262
label_261:
br label %label_263
label_262:
br label %label_263
label_263:
%t363 = phi i1 [ 1, %label_261 ], [ 0, %label_262]
br i1 %t363, label %label_256, label %label_258
label_256:
%t370 = load i32, i32* %t9
%t371 = add i32 0, 0
%t372 = icmp ne i32 %t370, %t371
br i1 %t372, label %label_257, label %label_258
label_257:
br label %label_259
label_258:
br label %label_259
label_259:
%t362 = phi i1 [ 1, %label_257 ], [ 0, %label_258]
br i1 %t362, label %label_197, label %label_198
label_197:
br label %label_199
label_198:
br label %label_199
label_199:
%t302 = phi i1 [ 1, %label_197 ], [ 0, %label_198]
br i1 %t302, label %label_193, label %label_192
label_192:
%t375 = load i32, i32* %t5
%t376 = load i32, i32* %t13
%t377 = icmp eq i32 %t375, %t376
br i1 %t377, label %label_268, label %label_270
label_268:
%t378 = load i32, i32* %t5
%t379 = load i32, i32* %t21
%t380 = icmp eq i32 %t378, %t379
br i1 %t380, label %label_269, label %label_270
label_269:
br label %label_271
label_270:
br label %label_271
label_271:
%t374 = phi i1 [ 1, %label_269 ], [ 0, %label_270]
br i1 %t374, label %label_264, label %label_266
label_264:
%t381 = load i32, i32* %t5
%t382 = add i32 0, 0
%t383 = icmp ne i32 %t381, %t382
br i1 %t383, label %label_265, label %label_266
label_265:
br label %label_267
label_266:
br label %label_267
label_267:
%t373 = phi i1 [ 1, %label_265 ], [ 0, %label_266]
br i1 %t373, label %label_193, label %label_194
label_193:
br label %label_195
label_194:
br label %label_195
label_195:
%t301 = phi i1 [ 1, %label_193 ], [ 0, %label_194]
br i1 %t301, label %label_189, label %label_188
label_188:
%t386 = load i32, i32* %t9
%t387 = load i32, i32* %t13
%t388 = icmp eq i32 %t386, %t387
br i1 %t388, label %label_276, label %label_278
label_276:
%t389 = load i32, i32* %t9
%t390 = load i32, i32* %t17
%t391 = icmp eq i32 %t389, %t390
br i1 %t391, label %label_277, label %label_278
label_277:
br label %label_279
label_278:
br label %label_279
label_279:
%t385 = phi i1 [ 1, %label_277 ], [ 0, %label_278]
br i1 %t385, label %label_272, label %label_274
label_272:
%t392 = load i32, i32* %t9
%t393 = add i32 0, 0
%t394 = icmp ne i32 %t392, %t393
br i1 %t394, label %label_273, label %label_274
label_273:
br label %label_275
label_274:
br label %label_275
label_275:
%t384 = phi i1 [ 1, %label_273 ], [ 0, %label_274]
br i1 %t384, label %label_189, label %label_190
label_189:
br label %label_191
label_190:
br label %label_191
label_191:
%t300 = phi i1 [ 1, %label_189 ], [ 0, %label_190]
br i1 %t300, label %label_186, label %label_187
label_186:
%t395 = load i32, i32* %t23
store i32 %t395, i32* %t299
br label %label_187
label_187:
%t396 = load i32, i32* %t299
%t397 = add i32 0, 0
%t398 = icmp sgt i32 %t396, %t397
br i1 %t398, label %label_280, label %label_282
label_280:
%t399 = getelementptr inbounds [78 x i8], [78 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t399)
%t401 = load i32, i32* %t299
%t402 = add i32 0, 1111
%t400 = mul i32 %t401, %t402
call void @printi(i32 %t400)
%t403 = getelementptr inbounds [2 x i8], [2 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t403)
%t407 = add i32 0, 1000
%t409 = add i32 0, 100
%t410 = load i32, i32* %t5
%t408 = mul i32 %t409, %t410
%t406 = add i32 %t407, %t408
%t412 = add i32 0, 10
%t413 = load i32, i32* %t7
%t411 = mul i32 %t412, %t413
%t405 = add i32 %t406, %t411
%t415 = add i32 0, 1
%t416 = load i32, i32* %t9
%t414 = mul i32 %t415, %t416
%t404 = add i32 %t405, %t414
call void @printi(i32 %t404)
%t420 = add i32 0, 1000
%t422 = add i32 0, 100
%t423 = load i32, i32* %t11
%t421 = mul i32 %t422, %t423
%t419 = add i32 %t420, %t421
%t425 = add i32 0, 10
%t426 = load i32, i32* %t13
%t424 = mul i32 %t425, %t426
%t418 = add i32 %t419, %t424
%t428 = add i32 0, 1
%t429 = load i32, i32* %t15
%t427 = mul i32 %t428, %t429
%t417 = add i32 %t418, %t427
call void @printi(i32 %t417)
%t433 = add i32 0, 1000
%t435 = add i32 0, 100
%t436 = load i32, i32* %t17
%t434 = mul i32 %t435, %t436
%t432 = add i32 %t433, %t434
%t438 = add i32 0, 10
%t439 = load i32, i32* %t19
%t437 = mul i32 %t438, %t439
%t431 = add i32 %t432, %t437
%t441 = add i32 0, 1
%t442 = load i32, i32* %t21
%t440 = mul i32 %t441, %t442
%t430 = add i32 %t431, %t440
call void @printi(i32 %t430)
%t443 = getelementptr inbounds [21 x i8], [21 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t443)
%t445 = load i32, i32* %t299
%t446 = add i32 0, 1111
%t444 = mul i32 %t445, %t446
call void @printi(i32 %t444)
%t447 = add i1 0, 0
%t448 = zext i1 %t447 to i32
store i32 %t448, i32* %t3
br label %label_281
label_282:
%t457 = load i32, i32* %t5
%t458 = add i32 0, 0
%t459 = icmp ne i32 %t457, %t458
br i1 %t459, label %label_313, label %label_315
label_313:
%t460 = load i32, i32* %t7
%t461 = add i32 0, 0
%t462 = icmp ne i32 %t460, %t461
br i1 %t462, label %label_314, label %label_315
label_314:
br label %label_316
label_315:
br label %label_316
label_316:
%t456 = phi i1 [ 1, %label_314 ], [ 0, %label_315]
br i1 %t456, label %label_309, label %label_311
label_309:
%t463 = load i32, i32* %t9
%t464 = add i32 0, 0
%t465 = icmp ne i32 %t463, %t464
br i1 %t465, label %label_310, label %label_311
label_310:
br label %label_312
label_311:
br label %label_312
label_312:
%t455 = phi i1 [ 1, %label_310 ], [ 0, %label_311]
br i1 %t455, label %label_305, label %label_307
label_305:
%t466 = load i32, i32* %t11
%t467 = add i32 0, 0
%t468 = icmp ne i32 %t466, %t467
br i1 %t468, label %label_306, label %label_307
label_306:
br label %label_308
label_307:
br label %label_308
label_308:
%t454 = phi i1 [ 1, %label_306 ], [ 0, %label_307]
br i1 %t454, label %label_301, label %label_303
label_301:
%t469 = load i32, i32* %t13
%t470 = add i32 0, 0
%t471 = icmp ne i32 %t469, %t470
br i1 %t471, label %label_302, label %label_303
label_302:
br label %label_304
label_303:
br label %label_304
label_304:
%t453 = phi i1 [ 1, %label_302 ], [ 0, %label_303]
br i1 %t453, label %label_297, label %label_299
label_297:
%t472 = load i32, i32* %t15
%t473 = add i32 0, 0
%t474 = icmp ne i32 %t472, %t473
br i1 %t474, label %label_298, label %label_299
label_298:
br label %label_300
label_299:
br label %label_300
label_300:
%t452 = phi i1 [ 1, %label_298 ], [ 0, %label_299]
br i1 %t452, label %label_293, label %label_295
label_293:
%t475 = load i32, i32* %t17
%t476 = add i32 0, 0
%t477 = icmp ne i32 %t475, %t476
br i1 %t477, label %label_294, label %label_295
label_294:
br label %label_296
label_295:
br label %label_296
label_296:
%t451 = phi i1 [ 1, %label_294 ], [ 0, %label_295]
br i1 %t451, label %label_289, label %label_291
label_289:
%t478 = load i32, i32* %t19
%t479 = add i32 0, 0
%t480 = icmp ne i32 %t478, %t479
br i1 %t480, label %label_290, label %label_291
label_290:
br label %label_292
label_291:
br label %label_292
label_292:
%t450 = phi i1 [ 1, %label_290 ], [ 0, %label_291]
br i1 %t450, label %label_285, label %label_287
label_285:
%t481 = load i32, i32* %t21
%t482 = add i32 0, 0
%t483 = icmp ne i32 %t481, %t482
br i1 %t483, label %label_286, label %label_287
label_286:
br label %label_288
label_287:
br label %label_288
label_288:
%t449 = phi i1 [ 1, %label_286 ], [ 0, %label_287]
br i1 %t449, label %label_283, label %label_284
label_283:
%t484 = getelementptr inbounds [13 x i8], [13 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t484)
%t488 = add i32 0, 1000
%t490 = add i32 0, 100
%t491 = load i32, i32* %t5
%t489 = mul i32 %t490, %t491
%t487 = add i32 %t488, %t489
%t493 = add i32 0, 10
%t494 = load i32, i32* %t7
%t492 = mul i32 %t493, %t494
%t486 = add i32 %t487, %t492
%t496 = add i32 0, 1
%t497 = load i32, i32* %t9
%t495 = mul i32 %t496, %t497
%t485 = add i32 %t486, %t495
call void @printi(i32 %t485)
%t501 = add i32 0, 1000
%t503 = add i32 0, 100
%t504 = load i32, i32* %t11
%t502 = mul i32 %t503, %t504
%t500 = add i32 %t501, %t502
%t506 = add i32 0, 10
%t507 = load i32, i32* %t13
%t505 = mul i32 %t506, %t507
%t499 = add i32 %t500, %t505
%t509 = add i32 0, 1
%t510 = load i32, i32* %t15
%t508 = mul i32 %t509, %t510
%t498 = add i32 %t499, %t508
call void @printi(i32 %t498)
%t514 = add i32 0, 1000
%t516 = add i32 0, 100
%t517 = load i32, i32* %t17
%t515 = mul i32 %t516, %t517
%t513 = add i32 %t514, %t515
%t519 = add i32 0, 10
%t520 = load i32, i32* %t19
%t518 = mul i32 %t519, %t520
%t512 = add i32 %t513, %t518
%t522 = add i32 0, 1
%t523 = load i32, i32* %t21
%t521 = mul i32 %t522, %t523
%t511 = add i32 %t512, %t521
call void @printi(i32 %t511)
%t524 = add i1 0, 0
%t525 = zext i1 %t524 to i32
store i32 %t525, i32* %t3
br label %label_284
label_284:
br label %label_281
label_281:
br label %label_0
label_2:
ret void
}
