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
%t24 = add i32 0, 1
%t25 = alloca i32 
store i32 %t24, i32* %t25
br label %label_0
label_0:
%t26 = load i32, i32* %t3
%t27 = trunc i32 %t26 to i1
br i1 %t27, label %label_1, label %label_2
label_1:
%t28 = getelementptr inbounds [98 x i8], [98 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t28)
%t32 = add i32 0, 1000
%t34 = add i32 0, 100
%t35 = load i32, i32* %t5
%t33 = mul i32 %t34, %t35
%t31 = add i32 %t32, %t33
%t37 = add i32 0, 10
%t38 = load i32, i32* %t7
%t36 = mul i32 %t37, %t38
%t30 = add i32 %t31, %t36
%t40 = add i32 0, 1
%t41 = load i32, i32* %t9
%t39 = mul i32 %t40, %t41
%t29 = add i32 %t30, %t39
call void @printi(i32 %t29)
%t45 = add i32 0, 1000
%t47 = add i32 0, 100
%t48 = load i32, i32* %t11
%t46 = mul i32 %t47, %t48
%t44 = add i32 %t45, %t46
%t50 = add i32 0, 10
%t51 = load i32, i32* %t13
%t49 = mul i32 %t50, %t51
%t43 = add i32 %t44, %t49
%t53 = add i32 0, 1
%t54 = load i32, i32* %t15
%t52 = mul i32 %t53, %t54
%t42 = add i32 %t43, %t52
call void @printi(i32 %t42)
%t58 = add i32 0, 1000
%t60 = add i32 0, 100
%t61 = load i32, i32* %t17
%t59 = mul i32 %t60, %t61
%t57 = add i32 %t58, %t59
%t63 = add i32 0, 10
%t64 = load i32, i32* %t19
%t62 = mul i32 %t63, %t64
%t56 = add i32 %t57, %t62
%t66 = add i32 0, 1
%t67 = load i32, i32* %t21
%t65 = mul i32 %t66, %t67
%t55 = add i32 %t56, %t65
call void @printi(i32 %t55)
%t68 = getelementptr inbounds [48 x i8], [48 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t68)
%t69 = add i32 0, 123
call void @printi(i32 %t69)
%t70 = add i32 0, 456
call void @printi(i32 %t70)
%t71 = add i32 0, 789
call void @printi(i32 %t71)
br label %label_3
label_3:
%t73 = load i32, i32* %t25
%t74 = add i32 0, 9
%t75 = icmp sle i32 %t73, %t74
br i1 %t75, label %label_6, label %label_8
label_6:
%t85 = load i32, i32* %t25
%t86 = add i32 0, 1
%t87 = icmp eq i32 %t85, %t86
br i1 %t87, label %label_42, label %label_44
label_42:
%t88 = load i32, i32* %t5
%t89 = add i32 0, 0
%t90 = icmp ne i32 %t88, %t89
br i1 %t90, label %label_43, label %label_44
label_43:
br label %label_45
label_44:
br label %label_45
label_45:
%t84 = phi i1 [ 1, %label_43 ], [ 0, %label_44]
br i1 %t84, label %label_39, label %label_38
label_38:
%t92 = load i32, i32* %t25
%t93 = add i32 0, 2
%t94 = icmp eq i32 %t92, %t93
br i1 %t94, label %label_46, label %label_48
label_46:
%t95 = load i32, i32* %t7
%t96 = add i32 0, 0
%t97 = icmp ne i32 %t95, %t96
br i1 %t97, label %label_47, label %label_48
label_47:
br label %label_49
label_48:
br label %label_49
label_49:
%t91 = phi i1 [ 1, %label_47 ], [ 0, %label_48]
br i1 %t91, label %label_39, label %label_40
label_39:
br label %label_41
label_40:
br label %label_41
label_41:
%t83 = phi i1 [ 1, %label_39 ], [ 0, %label_40]
br i1 %t83, label %label_35, label %label_34
label_34:
%t99 = load i32, i32* %t25
%t100 = add i32 0, 3
%t101 = icmp eq i32 %t99, %t100
br i1 %t101, label %label_50, label %label_52
label_50:
%t102 = load i32, i32* %t9
%t103 = add i32 0, 0
%t104 = icmp ne i32 %t102, %t103
br i1 %t104, label %label_51, label %label_52
label_51:
br label %label_53
label_52:
br label %label_53
label_53:
%t98 = phi i1 [ 1, %label_51 ], [ 0, %label_52]
br i1 %t98, label %label_35, label %label_36
label_35:
br label %label_37
label_36:
br label %label_37
label_37:
%t82 = phi i1 [ 1, %label_35 ], [ 0, %label_36]
br i1 %t82, label %label_31, label %label_30
label_30:
%t106 = load i32, i32* %t25
%t107 = add i32 0, 4
%t108 = icmp eq i32 %t106, %t107
br i1 %t108, label %label_54, label %label_56
label_54:
%t109 = load i32, i32* %t11
%t110 = add i32 0, 0
%t111 = icmp ne i32 %t109, %t110
br i1 %t111, label %label_55, label %label_56
label_55:
br label %label_57
label_56:
br label %label_57
label_57:
%t105 = phi i1 [ 1, %label_55 ], [ 0, %label_56]
br i1 %t105, label %label_31, label %label_32
label_31:
br label %label_33
label_32:
br label %label_33
label_33:
%t81 = phi i1 [ 1, %label_31 ], [ 0, %label_32]
br i1 %t81, label %label_27, label %label_26
label_26:
%t113 = load i32, i32* %t25
%t114 = add i32 0, 5
%t115 = icmp eq i32 %t113, %t114
br i1 %t115, label %label_58, label %label_60
label_58:
%t116 = load i32, i32* %t13
%t117 = add i32 0, 0
%t118 = icmp ne i32 %t116, %t117
br i1 %t118, label %label_59, label %label_60
label_59:
br label %label_61
label_60:
br label %label_61
label_61:
%t112 = phi i1 [ 1, %label_59 ], [ 0, %label_60]
br i1 %t112, label %label_27, label %label_28
label_27:
br label %label_29
label_28:
br label %label_29
label_29:
%t80 = phi i1 [ 1, %label_27 ], [ 0, %label_28]
br i1 %t80, label %label_23, label %label_22
label_22:
%t120 = load i32, i32* %t25
%t121 = add i32 0, 6
%t122 = icmp eq i32 %t120, %t121
br i1 %t122, label %label_62, label %label_64
label_62:
%t123 = load i32, i32* %t15
%t124 = add i32 0, 0
%t125 = icmp ne i32 %t123, %t124
br i1 %t125, label %label_63, label %label_64
label_63:
br label %label_65
label_64:
br label %label_65
label_65:
%t119 = phi i1 [ 1, %label_63 ], [ 0, %label_64]
br i1 %t119, label %label_23, label %label_24
label_23:
br label %label_25
label_24:
br label %label_25
label_25:
%t79 = phi i1 [ 1, %label_23 ], [ 0, %label_24]
br i1 %t79, label %label_19, label %label_18
label_18:
%t127 = load i32, i32* %t25
%t128 = add i32 0, 7
%t129 = icmp eq i32 %t127, %t128
br i1 %t129, label %label_66, label %label_68
label_66:
%t130 = load i32, i32* %t17
%t131 = add i32 0, 0
%t132 = icmp ne i32 %t130, %t131
br i1 %t132, label %label_67, label %label_68
label_67:
br label %label_69
label_68:
br label %label_69
label_69:
%t126 = phi i1 [ 1, %label_67 ], [ 0, %label_68]
br i1 %t126, label %label_19, label %label_20
label_19:
br label %label_21
label_20:
br label %label_21
label_21:
%t78 = phi i1 [ 1, %label_19 ], [ 0, %label_20]
br i1 %t78, label %label_15, label %label_14
label_14:
%t134 = load i32, i32* %t25
%t135 = add i32 0, 8
%t136 = icmp eq i32 %t134, %t135
br i1 %t136, label %label_70, label %label_72
label_70:
%t137 = load i32, i32* %t19
%t138 = add i32 0, 0
%t139 = icmp ne i32 %t137, %t138
br i1 %t139, label %label_71, label %label_72
label_71:
br label %label_73
label_72:
br label %label_73
label_73:
%t133 = phi i1 [ 1, %label_71 ], [ 0, %label_72]
br i1 %t133, label %label_15, label %label_16
label_15:
br label %label_17
label_16:
br label %label_17
label_17:
%t77 = phi i1 [ 1, %label_15 ], [ 0, %label_16]
br i1 %t77, label %label_11, label %label_10
label_10:
%t141 = load i32, i32* %t25
%t142 = add i32 0, 9
%t143 = icmp eq i32 %t141, %t142
br i1 %t143, label %label_74, label %label_76
label_74:
%t144 = load i32, i32* %t21
%t145 = add i32 0, 0
%t146 = icmp ne i32 %t144, %t145
br i1 %t146, label %label_75, label %label_76
label_75:
br label %label_77
label_76:
br label %label_77
label_77:
%t140 = phi i1 [ 1, %label_75 ], [ 0, %label_76]
br i1 %t140, label %label_11, label %label_12
label_11:
br label %label_13
label_12:
br label %label_13
label_13:
%t76 = phi i1 [ 1, %label_11 ], [ 0, %label_12]
br i1 %t76, label %label_7, label %label_8
label_7:
br label %label_9
label_8:
br label %label_9
label_9:
%t72 = phi i1 [ 1, %label_7 ], [ 0, %label_8]
br i1 %t72, label %label_4, label %label_5
label_4:
%t148 = load i32, i32* %t25
%t149 = add i32 0, 1
%t147 = add i32 %t148, %t149
store i32 %t147, i32* %t25
br label %label_3
label_5:
%t150 = load i32, i32* %t25
%t151 = add i32 0, 1
%t152 = icmp eq i32 %t150, %t151
br i1 %t152, label %label_78, label %label_80
label_78:
%t153 = load i32, i32* %t23
store i32 %t153, i32* %t5
br label %label_79
label_80:
%t154 = load i32, i32* %t25
%t155 = add i32 0, 2
%t156 = icmp eq i32 %t154, %t155
br i1 %t156, label %label_81, label %label_83
label_81:
%t157 = load i32, i32* %t23
store i32 %t157, i32* %t7
br label %label_82
label_83:
%t158 = load i32, i32* %t25
%t159 = add i32 0, 3
%t160 = icmp eq i32 %t158, %t159
br i1 %t160, label %label_84, label %label_86
label_84:
%t161 = load i32, i32* %t23
store i32 %t161, i32* %t9
br label %label_85
label_86:
%t162 = load i32, i32* %t25
%t163 = add i32 0, 4
%t164 = icmp eq i32 %t162, %t163
br i1 %t164, label %label_87, label %label_89
label_87:
%t165 = load i32, i32* %t23
store i32 %t165, i32* %t11
br label %label_88
label_89:
%t166 = load i32, i32* %t25
%t167 = add i32 0, 5
%t168 = icmp eq i32 %t166, %t167
br i1 %t168, label %label_90, label %label_92
label_90:
%t169 = load i32, i32* %t23
store i32 %t169, i32* %t13
br label %label_91
label_92:
%t170 = load i32, i32* %t25
%t171 = add i32 0, 6
%t172 = icmp eq i32 %t170, %t171
br i1 %t172, label %label_93, label %label_95
label_93:
%t173 = load i32, i32* %t23
store i32 %t173, i32* %t15
br label %label_94
label_95:
%t174 = load i32, i32* %t25
%t175 = add i32 0, 7
%t176 = icmp eq i32 %t174, %t175
br i1 %t176, label %label_96, label %label_98
label_96:
%t177 = load i32, i32* %t23
store i32 %t177, i32* %t17
br label %label_97
label_98:
%t178 = load i32, i32* %t25
%t179 = add i32 0, 8
%t180 = icmp eq i32 %t178, %t179
br i1 %t180, label %label_99, label %label_101
label_99:
%t181 = load i32, i32* %t23
store i32 %t181, i32* %t19
br label %label_100
label_101:
%t182 = load i32, i32* %t25
%t183 = add i32 0, 9
%t184 = icmp eq i32 %t182, %t183
br i1 %t184, label %label_102, label %label_104
label_102:
%t185 = load i32, i32* %t23
store i32 %t185, i32* %t21
br label %label_103
label_104:
%t186 = getelementptr inbounds [28 x i8], [28 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t186)
br label %label_103
label_103:
br label %label_100
label_100:
br label %label_97
label_97:
br label %label_94
label_94:
br label %label_91
label_91:
br label %label_88
label_88:
br label %label_85
label_85:
br label %label_82
label_82:
br label %label_79
label_79:
%t187 = load i32, i32* %t23
%t188 = add i32 0, 8
%t189 = icmp eq i32 %t187, %t188
br i1 %t189, label %label_105, label %label_107
label_105:
%t190 = add i32 0, 4
store i32 %t190, i32* %t23
br label %label_106
label_107:
%t191 = add i32 0, 8
store i32 %t191, i32* %t23
br label %label_106
label_106:
%t192 = add i32 0, 0
%t193 = alloca i32 
store i32 %t192, i32* %t193
%t203 = load i32, i32* %t5
%t204 = load i32, i32* %t7
%t205 = icmp eq i32 %t203, %t204
br i1 %t205, label %label_142, label %label_144
label_142:
%t206 = load i32, i32* %t5
%t207 = load i32, i32* %t9
%t208 = icmp eq i32 %t206, %t207
br i1 %t208, label %label_143, label %label_144
label_143:
br label %label_145
label_144:
br label %label_145
label_145:
%t202 = phi i1 [ 1, %label_143 ], [ 0, %label_144]
br i1 %t202, label %label_138, label %label_140
label_138:
%t209 = load i32, i32* %t5
%t210 = add i32 0, 0
%t211 = icmp ne i32 %t209, %t210
br i1 %t211, label %label_139, label %label_140
label_139:
br label %label_141
label_140:
br label %label_141
label_141:
%t201 = phi i1 [ 1, %label_139 ], [ 0, %label_140]
br i1 %t201, label %label_135, label %label_134
label_134:
%t214 = load i32, i32* %t11
%t215 = load i32, i32* %t13
%t216 = icmp eq i32 %t214, %t215
br i1 %t216, label %label_150, label %label_152
label_150:
%t217 = load i32, i32* %t11
%t218 = load i32, i32* %t15
%t219 = icmp eq i32 %t217, %t218
br i1 %t219, label %label_151, label %label_152
label_151:
br label %label_153
label_152:
br label %label_153
label_153:
%t213 = phi i1 [ 1, %label_151 ], [ 0, %label_152]
br i1 %t213, label %label_146, label %label_148
label_146:
%t220 = load i32, i32* %t11
%t221 = add i32 0, 0
%t222 = icmp ne i32 %t220, %t221
br i1 %t222, label %label_147, label %label_148
label_147:
br label %label_149
label_148:
br label %label_149
label_149:
%t212 = phi i1 [ 1, %label_147 ], [ 0, %label_148]
br i1 %t212, label %label_135, label %label_136
label_135:
br label %label_137
label_136:
br label %label_137
label_137:
%t200 = phi i1 [ 1, %label_135 ], [ 0, %label_136]
br i1 %t200, label %label_131, label %label_130
label_130:
%t225 = load i32, i32* %t17
%t226 = load i32, i32* %t19
%t227 = icmp eq i32 %t225, %t226
br i1 %t227, label %label_158, label %label_160
label_158:
%t228 = load i32, i32* %t17
%t229 = load i32, i32* %t21
%t230 = icmp eq i32 %t228, %t229
br i1 %t230, label %label_159, label %label_160
label_159:
br label %label_161
label_160:
br label %label_161
label_161:
%t224 = phi i1 [ 1, %label_159 ], [ 0, %label_160]
br i1 %t224, label %label_154, label %label_156
label_154:
%t231 = load i32, i32* %t17
%t232 = add i32 0, 0
%t233 = icmp ne i32 %t231, %t232
br i1 %t233, label %label_155, label %label_156
label_155:
br label %label_157
label_156:
br label %label_157
label_157:
%t223 = phi i1 [ 1, %label_155 ], [ 0, %label_156]
br i1 %t223, label %label_131, label %label_132
label_131:
br label %label_133
label_132:
br label %label_133
label_133:
%t199 = phi i1 [ 1, %label_131 ], [ 0, %label_132]
br i1 %t199, label %label_127, label %label_126
label_126:
%t236 = load i32, i32* %t5
%t237 = load i32, i32* %t11
%t238 = icmp eq i32 %t236, %t237
br i1 %t238, label %label_166, label %label_168
label_166:
%t239 = load i32, i32* %t5
%t240 = load i32, i32* %t17
%t241 = icmp eq i32 %t239, %t240
br i1 %t241, label %label_167, label %label_168
label_167:
br label %label_169
label_168:
br label %label_169
label_169:
%t235 = phi i1 [ 1, %label_167 ], [ 0, %label_168]
br i1 %t235, label %label_162, label %label_164
label_162:
%t242 = load i32, i32* %t5
%t243 = add i32 0, 0
%t244 = icmp ne i32 %t242, %t243
br i1 %t244, label %label_163, label %label_164
label_163:
br label %label_165
label_164:
br label %label_165
label_165:
%t234 = phi i1 [ 1, %label_163 ], [ 0, %label_164]
br i1 %t234, label %label_127, label %label_128
label_127:
br label %label_129
label_128:
br label %label_129
label_129:
%t198 = phi i1 [ 1, %label_127 ], [ 0, %label_128]
br i1 %t198, label %label_123, label %label_122
label_122:
%t247 = load i32, i32* %t7
%t248 = load i32, i32* %t13
%t249 = icmp eq i32 %t247, %t248
br i1 %t249, label %label_174, label %label_176
label_174:
%t250 = load i32, i32* %t7
%t251 = load i32, i32* %t19
%t252 = icmp eq i32 %t250, %t251
br i1 %t252, label %label_175, label %label_176
label_175:
br label %label_177
label_176:
br label %label_177
label_177:
%t246 = phi i1 [ 1, %label_175 ], [ 0, %label_176]
br i1 %t246, label %label_170, label %label_172
label_170:
%t253 = load i32, i32* %t7
%t254 = add i32 0, 0
%t255 = icmp ne i32 %t253, %t254
br i1 %t255, label %label_171, label %label_172
label_171:
br label %label_173
label_172:
br label %label_173
label_173:
%t245 = phi i1 [ 1, %label_171 ], [ 0, %label_172]
br i1 %t245, label %label_123, label %label_124
label_123:
br label %label_125
label_124:
br label %label_125
label_125:
%t197 = phi i1 [ 1, %label_123 ], [ 0, %label_124]
br i1 %t197, label %label_119, label %label_118
label_118:
%t258 = load i32, i32* %t9
%t259 = load i32, i32* %t15
%t260 = icmp eq i32 %t258, %t259
br i1 %t260, label %label_182, label %label_184
label_182:
%t261 = load i32, i32* %t9
%t262 = load i32, i32* %t21
%t263 = icmp eq i32 %t261, %t262
br i1 %t263, label %label_183, label %label_184
label_183:
br label %label_185
label_184:
br label %label_185
label_185:
%t257 = phi i1 [ 1, %label_183 ], [ 0, %label_184]
br i1 %t257, label %label_178, label %label_180
label_178:
%t264 = load i32, i32* %t9
%t265 = add i32 0, 0
%t266 = icmp ne i32 %t264, %t265
br i1 %t266, label %label_179, label %label_180
label_179:
br label %label_181
label_180:
br label %label_181
label_181:
%t256 = phi i1 [ 1, %label_179 ], [ 0, %label_180]
br i1 %t256, label %label_119, label %label_120
label_119:
br label %label_121
label_120:
br label %label_121
label_121:
%t196 = phi i1 [ 1, %label_119 ], [ 0, %label_120]
br i1 %t196, label %label_115, label %label_114
label_114:
%t269 = load i32, i32* %t5
%t270 = load i32, i32* %t13
%t271 = icmp eq i32 %t269, %t270
br i1 %t271, label %label_190, label %label_192
label_190:
%t272 = load i32, i32* %t5
%t273 = load i32, i32* %t21
%t274 = icmp eq i32 %t272, %t273
br i1 %t274, label %label_191, label %label_192
label_191:
br label %label_193
label_192:
br label %label_193
label_193:
%t268 = phi i1 [ 1, %label_191 ], [ 0, %label_192]
br i1 %t268, label %label_186, label %label_188
label_186:
%t275 = load i32, i32* %t5
%t276 = add i32 0, 0
%t277 = icmp ne i32 %t275, %t276
br i1 %t277, label %label_187, label %label_188
label_187:
br label %label_189
label_188:
br label %label_189
label_189:
%t267 = phi i1 [ 1, %label_187 ], [ 0, %label_188]
br i1 %t267, label %label_115, label %label_116
label_115:
br label %label_117
label_116:
br label %label_117
label_117:
%t195 = phi i1 [ 1, %label_115 ], [ 0, %label_116]
br i1 %t195, label %label_111, label %label_110
label_110:
%t280 = load i32, i32* %t9
%t281 = load i32, i32* %t13
%t282 = icmp eq i32 %t280, %t281
br i1 %t282, label %label_198, label %label_200
label_198:
%t283 = load i32, i32* %t9
%t284 = load i32, i32* %t17
%t285 = icmp eq i32 %t283, %t284
br i1 %t285, label %label_199, label %label_200
label_199:
br label %label_201
label_200:
br label %label_201
label_201:
%t279 = phi i1 [ 1, %label_199 ], [ 0, %label_200]
br i1 %t279, label %label_194, label %label_196
label_194:
%t286 = load i32, i32* %t9
%t287 = add i32 0, 0
%t288 = icmp ne i32 %t286, %t287
br i1 %t288, label %label_195, label %label_196
label_195:
br label %label_197
label_196:
br label %label_197
label_197:
%t278 = phi i1 [ 1, %label_195 ], [ 0, %label_196]
br i1 %t278, label %label_111, label %label_112
label_111:
br label %label_113
label_112:
br label %label_113
label_113:
%t194 = phi i1 [ 1, %label_111 ], [ 0, %label_112]
br i1 %t194, label %label_108, label %label_109
label_108:
%t289 = load i32, i32* %t23
store i32 %t289, i32* %t193
br label %label_109
label_109:
%t290 = load i32, i32* %t193
%t291 = add i32 0, 0
%t292 = icmp sgt i32 %t290, %t291
br i1 %t292, label %label_202, label %label_204
label_202:
%t293 = getelementptr inbounds [78 x i8], [78 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t293)
%t295 = load i32, i32* %t193
%t296 = add i32 0, 1111
%t294 = mul i32 %t295, %t296
call void @printi(i32 %t294)
%t297 = getelementptr inbounds [2 x i8], [2 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t297)
%t301 = add i32 0, 1000
%t303 = add i32 0, 100
%t304 = load i32, i32* %t5
%t302 = mul i32 %t303, %t304
%t300 = add i32 %t301, %t302
%t306 = add i32 0, 10
%t307 = load i32, i32* %t7
%t305 = mul i32 %t306, %t307
%t299 = add i32 %t300, %t305
%t309 = add i32 0, 1
%t310 = load i32, i32* %t9
%t308 = mul i32 %t309, %t310
%t298 = add i32 %t299, %t308
call void @printi(i32 %t298)
%t314 = add i32 0, 1000
%t316 = add i32 0, 100
%t317 = load i32, i32* %t11
%t315 = mul i32 %t316, %t317
%t313 = add i32 %t314, %t315
%t319 = add i32 0, 10
%t320 = load i32, i32* %t13
%t318 = mul i32 %t319, %t320
%t312 = add i32 %t313, %t318
%t322 = add i32 0, 1
%t323 = load i32, i32* %t15
%t321 = mul i32 %t322, %t323
%t311 = add i32 %t312, %t321
call void @printi(i32 %t311)
%t327 = add i32 0, 1000
%t329 = add i32 0, 100
%t330 = load i32, i32* %t17
%t328 = mul i32 %t329, %t330
%t326 = add i32 %t327, %t328
%t332 = add i32 0, 10
%t333 = load i32, i32* %t19
%t331 = mul i32 %t332, %t333
%t325 = add i32 %t326, %t331
%t335 = add i32 0, 1
%t336 = load i32, i32* %t21
%t334 = mul i32 %t335, %t336
%t324 = add i32 %t325, %t334
call void @printi(i32 %t324)
%t337 = getelementptr inbounds [21 x i8], [21 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t337)
%t339 = load i32, i32* %t193
%t340 = add i32 0, 1111
%t338 = mul i32 %t339, %t340
call void @printi(i32 %t338)
%t341 = add i1 0, 0
%t342 = zext i1 %t341 to i32
store i32 %t342, i32* %t3
br label %label_203
label_204:
%t351 = load i32, i32* %t5
%t352 = add i32 0, 0
%t353 = icmp ne i32 %t351, %t352
br i1 %t353, label %label_235, label %label_237
label_235:
%t354 = load i32, i32* %t7
%t355 = add i32 0, 0
%t356 = icmp ne i32 %t354, %t355
br i1 %t356, label %label_236, label %label_237
label_236:
br label %label_238
label_237:
br label %label_238
label_238:
%t350 = phi i1 [ 1, %label_236 ], [ 0, %label_237]
br i1 %t350, label %label_231, label %label_233
label_231:
%t357 = load i32, i32* %t9
%t358 = add i32 0, 0
%t359 = icmp ne i32 %t357, %t358
br i1 %t359, label %label_232, label %label_233
label_232:
br label %label_234
label_233:
br label %label_234
label_234:
%t349 = phi i1 [ 1, %label_232 ], [ 0, %label_233]
br i1 %t349, label %label_227, label %label_229
label_227:
%t360 = load i32, i32* %t11
%t361 = add i32 0, 0
%t362 = icmp ne i32 %t360, %t361
br i1 %t362, label %label_228, label %label_229
label_228:
br label %label_230
label_229:
br label %label_230
label_230:
%t348 = phi i1 [ 1, %label_228 ], [ 0, %label_229]
br i1 %t348, label %label_223, label %label_225
label_223:
%t363 = load i32, i32* %t13
%t364 = add i32 0, 0
%t365 = icmp ne i32 %t363, %t364
br i1 %t365, label %label_224, label %label_225
label_224:
br label %label_226
label_225:
br label %label_226
label_226:
%t347 = phi i1 [ 1, %label_224 ], [ 0, %label_225]
br i1 %t347, label %label_219, label %label_221
label_219:
%t366 = load i32, i32* %t15
%t367 = add i32 0, 0
%t368 = icmp ne i32 %t366, %t367
br i1 %t368, label %label_220, label %label_221
label_220:
br label %label_222
label_221:
br label %label_222
label_222:
%t346 = phi i1 [ 1, %label_220 ], [ 0, %label_221]
br i1 %t346, label %label_215, label %label_217
label_215:
%t369 = load i32, i32* %t17
%t370 = add i32 0, 0
%t371 = icmp ne i32 %t369, %t370
br i1 %t371, label %label_216, label %label_217
label_216:
br label %label_218
label_217:
br label %label_218
label_218:
%t345 = phi i1 [ 1, %label_216 ], [ 0, %label_217]
br i1 %t345, label %label_211, label %label_213
label_211:
%t372 = load i32, i32* %t19
%t373 = add i32 0, 0
%t374 = icmp ne i32 %t372, %t373
br i1 %t374, label %label_212, label %label_213
label_212:
br label %label_214
label_213:
br label %label_214
label_214:
%t344 = phi i1 [ 1, %label_212 ], [ 0, %label_213]
br i1 %t344, label %label_207, label %label_209
label_207:
%t375 = load i32, i32* %t21
%t376 = add i32 0, 0
%t377 = icmp ne i32 %t375, %t376
br i1 %t377, label %label_208, label %label_209
label_208:
br label %label_210
label_209:
br label %label_210
label_210:
%t343 = phi i1 [ 1, %label_208 ], [ 0, %label_209]
br i1 %t343, label %label_205, label %label_206
label_205:
%t378 = getelementptr inbounds [13 x i8], [13 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t378)
%t382 = add i32 0, 1000
%t384 = add i32 0, 100
%t385 = load i32, i32* %t5
%t383 = mul i32 %t384, %t385
%t381 = add i32 %t382, %t383
%t387 = add i32 0, 10
%t388 = load i32, i32* %t7
%t386 = mul i32 %t387, %t388
%t380 = add i32 %t381, %t386
%t390 = add i32 0, 1
%t391 = load i32, i32* %t9
%t389 = mul i32 %t390, %t391
%t379 = add i32 %t380, %t389
call void @printi(i32 %t379)
%t395 = add i32 0, 1000
%t397 = add i32 0, 100
%t398 = load i32, i32* %t11
%t396 = mul i32 %t397, %t398
%t394 = add i32 %t395, %t396
%t400 = add i32 0, 10
%t401 = load i32, i32* %t13
%t399 = mul i32 %t400, %t401
%t393 = add i32 %t394, %t399
%t403 = add i32 0, 1
%t404 = load i32, i32* %t15
%t402 = mul i32 %t403, %t404
%t392 = add i32 %t393, %t402
call void @printi(i32 %t392)
%t408 = add i32 0, 1000
%t410 = add i32 0, 100
%t411 = load i32, i32* %t17
%t409 = mul i32 %t410, %t411
%t407 = add i32 %t408, %t409
%t413 = add i32 0, 10
%t414 = load i32, i32* %t19
%t412 = mul i32 %t413, %t414
%t406 = add i32 %t407, %t412
%t416 = add i32 0, 1
%t417 = load i32, i32* %t21
%t415 = mul i32 %t416, %t417
%t405 = add i32 %t406, %t415
call void @printi(i32 %t405)
%t418 = add i1 0, 0
%t419 = zext i1 %t418 to i32
store i32 %t419, i32* %t3
br label %label_206
label_206:
br label %label_203
label_203:
%t421 = load i32, i32* %t25
%t422 = add i32 0, 1
%t420 = add i32 %t421, %t422
store i32 %t420, i32* %t25
br label %label_0
label_2:
ret void
}
