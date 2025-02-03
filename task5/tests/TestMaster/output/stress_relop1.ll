
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
define i1 @complexFunc(i1, i1) {
br i1 %0, label %label_0, label %label_2
label_0:
br i1 %1, label %label_1, label %label_2
label_1:
br label %label_3
label_2:
br label %label_3
label_3:
%t0 = phi i1 [ 1, %label_1 ], [ 0, %label_2]
ret i1 %t0
}
define i1 @testFunc(i32, i32, i32, i32) {
%t4 = icmp slt i32 %0, %1
br i1 %t4, label %label_12, label %label_14
label_12:
%t5 = icmp sle i32 %1, %2
br i1 %t5, label %label_13, label %label_14
label_13:
br label %label_15
label_14:
br label %label_15
label_15:
%t3 = phi i1 [ 1, %label_13 ], [ 0, %label_14]
br i1 %t3, label %label_8, label %label_10
label_8:
%t7 = icmp sgt i32 %2, %3
br i1 %t7, label %label_17, label %label_16
label_16:
%t8 = icmp sge i32 %3, %0
br i1 %t8, label %label_17, label %label_18
label_17:
br label %label_19
label_18:
br label %label_19
label_19:
%t6 = phi i1 [ 1, %label_17 ], [ 0, %label_18]
br i1 %t6, label %label_9, label %label_10
label_9:
br label %label_11
label_10:
br label %label_11
label_11:
%t2 = phi i1 [ 1, %label_9 ], [ 0, %label_10]
br i1 %t2, label %label_4, label %label_6
label_4:
%t9 = icmp ne i32 %1, %2
br i1 %t9, label %label_5, label %label_6
label_5:
br label %label_7
label_6:
br label %label_7
label_7:
%t1 = phi i1 [ 1, %label_5 ], [ 0, %label_6]
%t10 = zext i1 %t1 to i32
%t11 = alloca i32 
store i32 %t10, i32* %t11
%t12 = load i32, i32* %t11
%t13 = trunc i32 %t12 to i1
ret i1 %t13
}
define void @main() {
%t14 = add i32 0, 5
%t15 = alloca i32 
store i32 %t14, i32* %t15
%t16 = add i32 0, 10
%t17 = alloca i32 
store i32 %t16, i32* %t17
%t18 = add i32 0, 15
%t19 = alloca i32 
store i32 %t18, i32* %t19
%t20 = add i32 0, 20
%t21 = alloca i32 
store i32 %t20, i32* %t21
%t22 = add i1 0, 1
%t23 = zext i1 %t22 to i32
%t24 = alloca i32 
store i32 %t23, i32* %t24
%t28 = load i32, i32* %t15
%t29 = load i32, i32* %t17
%t30 = icmp slt i32 %t28, %t29
br i1 %t30, label %label_31, label %label_33
label_31:
%t31 = load i32, i32* %t17
%t32 = load i32, i32* %t19
%t33 = icmp sle i32 %t31, %t32
br i1 %t33, label %label_32, label %label_33
label_32:
br label %label_34
label_33:
br label %label_34
label_34:
%t27 = phi i1 [ 1, %label_32 ], [ 0, %label_33]
br i1 %t27, label %label_27, label %label_29
label_27:
%t35 = load i32, i32* %t19
%t36 = load i32, i32* %t21
%t37 = icmp sgt i32 %t35, %t36
br i1 %t37, label %label_36, label %label_35
label_35:
%t38 = load i32, i32* %t21
%t39 = load i32, i32* %t15
%t40 = icmp sge i32 %t38, %t39
br i1 %t40, label %label_36, label %label_37
label_36:
br label %label_38
label_37:
br label %label_38
label_38:
%t34 = phi i1 [ 1, %label_36 ], [ 0, %label_37]
br i1 %t34, label %label_28, label %label_29
label_28:
br label %label_30
label_29:
br label %label_30
label_30:
%t26 = phi i1 [ 1, %label_28 ], [ 0, %label_29]
br i1 %t26, label %label_23, label %label_25
label_23:
%t44 = load i32, i32* %t15
%t45 = load i32, i32* %t21
%t46 = icmp slt i32 %t44, %t45
br i1 %t46, label %label_47, label %label_49
label_47:
%t47 = load i32, i32* %t21
%t48 = load i32, i32* %t17
%t49 = icmp ne i32 %t47, %t48
br i1 %t49, label %label_48, label %label_49
label_48:
br label %label_50
label_49:
br label %label_50
label_50:
%t43 = phi i1 [ 1, %label_48 ], [ 0, %label_49]
br i1 %t43, label %label_44, label %label_43
label_43:
%t51 = load i32, i32* %t17
%t52 = load i32, i32* %t19
%t53 = icmp sgt i32 %t51, %t52
br i1 %t53, label %label_51, label %label_53
label_51:
%t54 = load i32, i32* %t19
%t55 = load i32, i32* %t15
%t56 = icmp ne i32 %t54, %t55
br i1 %t56, label %label_52, label %label_53
label_52:
br label %label_54
label_53:
br label %label_54
label_54:
%t50 = phi i1 [ 1, %label_52 ], [ 0, %label_53]
br i1 %t50, label %label_44, label %label_45
label_44:
br label %label_46
label_45:
br label %label_46
label_46:
%t42 = phi i1 [ 1, %label_44 ], [ 0, %label_45]
br i1 %t42, label %label_39, label %label_41
label_39:
%t59 = load i32, i32* %t19
%t60 = load i32, i32* %t21
%t61 = icmp sle i32 %t59, %t60
br i1 %t61, label %label_59, label %label_61
label_59:
%t62 = load i32, i32* %t21
%t63 = load i32, i32* %t15
%t64 = icmp sgt i32 %t62, %t63
br i1 %t64, label %label_60, label %label_61
label_60:
br label %label_62
label_61:
br label %label_62
label_62:
%t58 = phi i1 [ 1, %label_60 ], [ 0, %label_61]
br i1 %t58, label %label_56, label %label_55
label_55:
%t66 = load i32, i32* %t15
%t67 = load i32, i32* %t17
%t68 = icmp sge i32 %t66, %t67
br i1 %t68, label %label_63, label %label_65
label_63:
%t69 = load i32, i32* %t17
%t70 = load i32, i32* %t19
%t71 = icmp slt i32 %t69, %t70
br i1 %t71, label %label_64, label %label_65
label_64:
br label %label_66
label_65:
br label %label_66
label_66:
%t65 = phi i1 [ 1, %label_64 ], [ 0, %label_65]
br i1 %t65, label %label_56, label %label_57
label_56:
br label %label_58
label_57:
br label %label_58
label_58:
%t57 = phi i1 [ 1, %label_56 ], [ 0, %label_57]
br i1 %t57, label %label_40, label %label_41
label_40:
br label %label_42
label_41:
br label %label_42
label_42:
%t41 = phi i1 [ 1, %label_40 ], [ 0, %label_41]
br i1 %t41, label %label_24, label %label_25
label_24:
br label %label_26
label_25:
br label %label_26
label_26:
%t25 = phi i1 [ 1, %label_24 ], [ 0, %label_25]
br i1 %t25, label %label_20, label %label_22
label_20:
%t73 = load i32, i32* %t15
%t74 = load i32, i32* %t17
%t75 = load i32, i32* %t19
%t76 = load i32, i32* %t21
%t77 = call i1 @testFunc(i32 %t73, i32 %t74, i32 %t75, i32 %t76)
br i1 %t77, label %label_70, label %label_72
label_70:
%t80 = load i32, i32* %t15
%t81 = load i32, i32* %t17
%t82 = icmp slt i32 %t80, %t81
br i1 %t82, label %label_78, label %label_80
label_78:
%t83 = load i32, i32* %t17
%t84 = load i32, i32* %t19
%t85 = icmp sgt i32 %t83, %t84
%t86 = load i32, i32* %t19
%t87 = load i32, i32* %t21
%t88 = icmp slt i32 %t86, %t87
%t89 = call i1 @complexFunc(i1 %t85, i1 %t88)
br i1 %t89, label %label_79, label %label_80
label_79:
br label %label_81
label_80:
br label %label_81
label_81:
%t79 = phi i1 [ 1, %label_79 ], [ 0, %label_80]
br i1 %t79, label %label_75, label %label_74
label_74:
%t91 = load i32, i32* %t19
%t92 = load i32, i32* %t21
%t93 = icmp sgt i32 %t91, %t92
br i1 %t93, label %label_82, label %label_84
label_82:
%t94 = load i32, i32* %t15
%t95 = load i32, i32* %t17
%t96 = icmp ne i32 %t94, %t95
%t97 = load i32, i32* %t17
%t98 = load i32, i32* %t19
%t99 = icmp sle i32 %t97, %t98
%t100 = call i1 @complexFunc(i1 %t96, i1 %t99)
br i1 %t100, label %label_83, label %label_84
label_83:
br label %label_85
label_84:
br label %label_85
label_85:
%t90 = phi i1 [ 1, %label_83 ], [ 0, %label_84]
br i1 %t90, label %label_75, label %label_76
label_75:
br label %label_77
label_76:
br label %label_77
label_77:
%t78 = phi i1 [ 1, %label_75 ], [ 0, %label_76]
br i1 %t78, label %label_71, label %label_72
label_71:
br label %label_73
label_72:
br label %label_73
label_73:
%t72 = phi i1 [ 1, %label_71 ], [ 0, %label_72]
br i1 %t72, label %label_67, label %label_69
label_67:
br label %label_86
label_86:
%t103 = load i32, i32* %t15
%t104 = load i32, i32* %t21
%t105 = icmp slt i32 %t103, %t104
br i1 %t105, label %label_93, label %label_95
label_93:
%t106 = load i32, i32* %t21
%t107 = load i32, i32* %t17
%t108 = icmp sgt i32 %t106, %t107
br i1 %t108, label %label_94, label %label_95
label_94:
br label %label_96
label_95:
br label %label_96
label_96:
%t102 = phi i1 [ 1, %label_94 ], [ 0, %label_95]
br i1 %t102, label %label_89, label %label_91
label_89:
%t110 = load i32, i32* %t17
%t111 = load i32, i32* %t19
%t112 = icmp slt i32 %t110, %t111
br i1 %t112, label %label_98, label %label_97
label_97:
%t113 = load i32, i32* %t19
%t114 = load i32, i32* %t15
%t115 = icmp sge i32 %t113, %t114
br i1 %t115, label %label_98, label %label_99
label_98:
br label %label_100
label_99:
br label %label_100
label_100:
%t109 = phi i1 [ 1, %label_98 ], [ 0, %label_99]
br i1 %t109, label %label_90, label %label_91
label_90:
br label %label_92
label_91:
br label %label_92
label_92:
%t101 = phi i1 [ 1, %label_90 ], [ 0, %label_91]
br i1 %t101, label %label_87, label %label_88
label_87:
%t117 = load i32, i32* %t15
%t118 = add i32 0, 0
%t119 = icmp sgt i32 %t117, %t118
br i1 %t119, label %label_104, label %label_106
label_104:
%t121 = load i32, i32* %t17
%t122 = load i32, i32* %t19
%t123 = icmp slt i32 %t121, %t122
br i1 %t123, label %label_109, label %label_108
label_108:
%t125 = load i32, i32* %t19
%t126 = load i32, i32* %t21
%t127 = icmp sle i32 %t125, %t126
br i1 %t127, label %label_112, label %label_114
label_112:
%t128 = load i32, i32* %t21
%t129 = load i32, i32* %t15
%t130 = icmp ne i32 %t128, %t129
br i1 %t130, label %label_113, label %label_114
label_113:
br label %label_115
label_114:
br label %label_115
label_115:
%t124 = phi i1 [ 1, %label_113 ], [ 0, %label_114]
br i1 %t124, label %label_109, label %label_110
label_109:
br label %label_111
label_110:
br label %label_111
label_111:
%t120 = phi i1 [ 1, %label_109 ], [ 0, %label_110]
br i1 %t120, label %label_105, label %label_106
label_105:
br label %label_107
label_106:
br label %label_107
label_107:
%t116 = phi i1 [ 1, %label_105 ], [ 0, %label_106]
br i1 %t116, label %label_101, label %label_103
label_101:
%t132 = load i32, i32* %t15
%t133 = add i32 0, 1
%t131 = add i32 %t132, %t133
store i32 %t131, i32* %t15
%t135 = load i32, i32* %t15
%t136 = load i32, i32* %t17
%t137 = icmp sge i32 %t135, %t136
br i1 %t137, label %label_119, label %label_118
label_118:
%t139 = load i32, i32* %t17
%t140 = load i32, i32* %t19
%t141 = icmp slt i32 %t139, %t140
br i1 %t141, label %label_122, label %label_124
label_122:
%t142 = load i32, i32* %t19
%t143 = load i32, i32* %t21
%t144 = icmp ne i32 %t142, %t143
br i1 %t144, label %label_123, label %label_124
label_123:
br label %label_125
label_124:
br label %label_125
label_125:
%t138 = phi i1 [ 1, %label_123 ], [ 0, %label_124]
br i1 %t138, label %label_119, label %label_120
label_119:
br label %label_121
label_120:
br label %label_121
label_121:
%t134 = phi i1 [ 1, %label_119 ], [ 0, %label_120]
br i1 %t134, label %label_116, label %label_117
label_116:
br label %label_86
br label %label_117
label_117:
br label %label_102
label_103:
%t147 = load i32, i32* %t15
%t148 = load i32, i32* %t17
%t149 = icmp slt i32 %t147, %t148
br i1 %t149, label %label_132, label %label_134
label_132:
%t150 = load i32, i32* %t17
%t151 = load i32, i32* %t19
%t152 = icmp ne i32 %t150, %t151
br i1 %t152, label %label_133, label %label_134
label_133:
br label %label_135
label_134:
br label %label_135
label_135:
%t146 = phi i1 [ 1, %label_133 ], [ 0, %label_134]
br i1 %t146, label %label_129, label %label_128
label_128:
%t154 = load i32, i32* %t19
%t155 = load i32, i32* %t21
%t156 = icmp sgt i32 %t154, %t155
br i1 %t156, label %label_136, label %label_138
label_136:
%t157 = load i32, i32* %t21
%t158 = load i32, i32* %t15
%t159 = icmp sle i32 %t157, %t158
br i1 %t159, label %label_137, label %label_138
label_137:
br label %label_139
label_138:
br label %label_139
label_139:
%t153 = phi i1 [ 1, %label_137 ], [ 0, %label_138]
br i1 %t153, label %label_129, label %label_130
label_129:
br label %label_131
label_130:
br label %label_131
label_131:
%t145 = phi i1 [ 1, %label_129 ], [ 0, %label_130]
br i1 %t145, label %label_126, label %label_127
label_126:
br label %label_88
br label %label_127
label_127:
br label %label_102
label_102:
%t160 = load i32, i32* %t15
%t161 = load i32, i32* %t17
%t162 = icmp slt i32 %t160, %t161
%t163 = load i32, i32* %t17
%t164 = load i32, i32* %t19
%t165 = icmp sle i32 %t163, %t164
%t166 = call i1 @complexFunc(i1 %t162, i1 %t165)
%t167 = zext i1 %t166 to i32
%t168 = alloca i32 
store i32 %t167, i32* %t168
%t169 = load i32, i32* %t19
%t170 = load i32, i32* %t21
%t171 = icmp sgt i32 %t169, %t170
%t172 = load i32, i32* %t21
%t173 = load i32, i32* %t15
%t174 = icmp sge i32 %t172, %t173
%t175 = call i1 @complexFunc(i1 %t171, i1 %t174)
%t176 = zext i1 %t175 to i32
%t177 = alloca i32 
store i32 %t176, i32* %t177
%t180 = load i32, i32* %t168
%t181 = trunc i32 %t180 to i1
br i1 %t181, label %label_144, label %label_146
label_144:
%t182 = load i32, i32* %t177
%t183 = trunc i32 %t182 to i1
br i1 %t183, label %label_145, label %label_146
label_145:
br label %label_147
label_146:
br label %label_147
label_147:
%t179 = phi i1 [ 1, %label_145 ], [ 0, %label_146]
br i1 %t179, label %label_140, label %label_142
label_140:
%t185 = load i32, i32* %t15
%t186 = load i32, i32* %t17
%t187 = icmp ne i32 %t185, %t186
br i1 %t187, label %label_149, label %label_148
label_148:
%t188 = load i32, i32* %t17
%t189 = load i32, i32* %t19
%t190 = icmp slt i32 %t188, %t189
br i1 %t190, label %label_149, label %label_150
label_149:
br label %label_151
label_150:
br label %label_151
label_151:
%t184 = phi i1 [ 1, %label_149 ], [ 0, %label_150]
br i1 %t184, label %label_141, label %label_142
label_141:
br label %label_143
label_142:
br label %label_143
label_143:
%t178 = phi i1 [ 1, %label_141 ], [ 0, %label_142]
%t191 = zext i1 %t178 to i32
%t192 = alloca i32 
store i32 %t191, i32* %t192
%t194 = load i32, i32* %t192
%t195 = trunc i32 %t194 to i1
br i1 %t195, label %label_154, label %label_156
label_154:
%t196 = load i32, i32* %t21
%t197 = load i32, i32* %t15
%t198 = load i32, i32* %t17
%t199 = load i32, i32* %t19
%t200 = call i1 @testFunc(i32 %t196, i32 %t197, i32 %t198, i32 %t199)
br i1 %t200, label %label_155, label %label_156
label_155:
br label %label_157
label_156:
br label %label_157
label_157:
%t193 = phi i1 [ 1, %label_155 ], [ 0, %label_156]
br i1 %t193, label %label_152, label %label_153
label_152:
%t203 = load i32, i32* %t21
%t204 = load i32, i32* %t15
%t205 = icmp sgt i32 %t203, %t204
br i1 %t205, label %label_164, label %label_166
label_164:
%t206 = load i32, i32* %t15
%t207 = load i32, i32* %t17
%t208 = icmp slt i32 %t206, %t207
br i1 %t208, label %label_165, label %label_166
label_165:
br label %label_167
label_166:
br label %label_167
label_167:
%t202 = phi i1 [ 1, %label_165 ], [ 0, %label_166]
br i1 %t202, label %label_161, label %label_160
label_160:
%t210 = load i32, i32* %t17
%t211 = load i32, i32* %t19
%t212 = icmp sge i32 %t210, %t211
br i1 %t212, label %label_168, label %label_170
label_168:
%t213 = load i32, i32* %t19
%t214 = load i32, i32* %t21
%t215 = icmp ne i32 %t213, %t214
br i1 %t215, label %label_169, label %label_170
label_169:
br label %label_171
label_170:
br label %label_171
label_171:
%t209 = phi i1 [ 1, %label_169 ], [ 0, %label_170]
br i1 %t209, label %label_161, label %label_162
label_161:
br label %label_163
label_162:
br label %label_163
label_163:
%t201 = phi i1 [ 1, %label_161 ], [ 0, %label_162]
br i1 %t201, label %label_158, label %label_159
label_158:
%t216 = load i32, i32* %t15
call void @printi(i32 %t216)
br label %label_159
label_159:
br label %label_153
label_153:
%t217 = load i32, i32* %t15
%t218 = add i32 0, 25
%t219 = icmp sgt i32 %t217, %t218
br i1 %t219, label %label_172, label %label_173
label_172:
br label %label_88
br label %label_173
label_173:
br label %label_86
label_88:
%t220 = add i32 0, 1
call void @printi(i32 %t220)
br label %label_68
label_69:
%t221 = add i32 0, 2
call void @printi(i32 %t221)
br label %label_68
label_68:
br label %label_21
label_22:
%t223 = load i32, i32* %t21
%t224 = load i32, i32* %t19
%t225 = load i32, i32* %t17
%t226 = load i32, i32* %t15
%t227 = call i1 @testFunc(i32 %t223, i32 %t224, i32 %t225, i32 %t226)
br i1 %t227, label %label_177, label %label_179
label_177:
%t230 = load i32, i32* %t21
%t231 = load i32, i32* %t15
%t232 = icmp slt i32 %t230, %t231
br i1 %t232, label %label_185, label %label_187
label_185:
%t233 = load i32, i32* %t17
%t234 = load i32, i32* %t19
%t235 = icmp sgt i32 %t233, %t234
br i1 %t235, label %label_186, label %label_187
label_186:
br label %label_188
label_187:
br label %label_188
label_188:
%t229 = phi i1 [ 1, %label_186 ], [ 0, %label_187]
br i1 %t229, label %label_182, label %label_181
label_181:
%t237 = load i32, i32* %t15
%t238 = load i32, i32* %t17
%t239 = icmp sle i32 %t237, %t238
br i1 %t239, label %label_189, label %label_191
label_189:
%t240 = load i32, i32* %t19
%t241 = load i32, i32* %t21
%t242 = icmp sge i32 %t240, %t241
br i1 %t242, label %label_190, label %label_191
label_190:
br label %label_192
label_191:
br label %label_192
label_192:
%t236 = phi i1 [ 1, %label_190 ], [ 0, %label_191]
br i1 %t236, label %label_182, label %label_183
label_182:
br label %label_184
label_183:
br label %label_184
label_184:
%t228 = phi i1 [ 1, %label_182 ], [ 0, %label_183]
br i1 %t228, label %label_178, label %label_179
label_178:
br label %label_180
label_179:
br label %label_180
label_180:
%t222 = phi i1 [ 1, %label_178 ], [ 0, %label_179]
br i1 %t222, label %label_174, label %label_176
label_174:
%t243 = add i32 0, 3
call void @printi(i32 %t243)
br label %label_175
label_176:
%t244 = add i32 0, 4
call void @printi(i32 %t244)
br label %label_175
label_175:
br label %label_21
label_21:
%t249 = load i32, i32* %t15
%t250 = load i32, i32* %t17
%t251 = icmp slt i32 %t249, %t250
br i1 %t251, label %label_205, label %label_207
label_205:
%t252 = load i32, i32* %t17
%t253 = load i32, i32* %t19
%t254 = icmp sle i32 %t252, %t253
br i1 %t254, label %label_206, label %label_207
label_206:
br label %label_208
label_207:
br label %label_208
label_208:
%t248 = phi i1 [ 1, %label_206 ], [ 0, %label_207]
br i1 %t248, label %label_201, label %label_203
label_201:
%t255 = load i32, i32* %t19
%t256 = load i32, i32* %t21
%t257 = icmp sgt i32 %t255, %t256
br i1 %t257, label %label_202, label %label_203
label_202:
br label %label_204
label_203:
br label %label_204
label_204:
%t247 = phi i1 [ 1, %label_202 ], [ 0, %label_203]
br i1 %t247, label %label_198, label %label_197
label_197:
%t260 = load i32, i32* %t21
%t261 = load i32, i32* %t15
%t262 = icmp sge i32 %t260, %t261
br i1 %t262, label %label_213, label %label_215
label_213:
%t263 = load i32, i32* %t15
%t264 = load i32, i32* %t17
%t265 = icmp ne i32 %t263, %t264
br i1 %t265, label %label_214, label %label_215
label_214:
br label %label_216
label_215:
br label %label_216
label_216:
%t259 = phi i1 [ 1, %label_214 ], [ 0, %label_215]
br i1 %t259, label %label_209, label %label_211
label_209:
%t266 = load i32, i32* %t17
%t267 = load i32, i32* %t19
%t268 = icmp slt i32 %t266, %t267
br i1 %t268, label %label_210, label %label_211
label_210:
br label %label_212
label_211:
br label %label_212
label_212:
%t258 = phi i1 [ 1, %label_210 ], [ 0, %label_211]
br i1 %t258, label %label_198, label %label_199
label_198:
br label %label_200
label_199:
br label %label_200
label_200:
%t246 = phi i1 [ 1, %label_198 ], [ 0, %label_199]
br i1 %t246, label %label_194, label %label_193
label_193:
%t271 = load i32, i32* %t19
%t272 = load i32, i32* %t21
%t273 = icmp sle i32 %t271, %t272
br i1 %t273, label %label_221, label %label_223
label_221:
%t274 = load i32, i32* %t21
%t275 = load i32, i32* %t15
%t276 = icmp sgt i32 %t274, %t275
br i1 %t276, label %label_222, label %label_223
label_222:
br label %label_224
label_223:
br label %label_224
label_224:
%t270 = phi i1 [ 1, %label_222 ], [ 0, %label_223]
br i1 %t270, label %label_217, label %label_219
label_217:
%t277 = load i32, i32* %t15
%t278 = load i32, i32* %t17
%t279 = icmp sge i32 %t277, %t278
br i1 %t279, label %label_218, label %label_219
label_218:
br label %label_220
label_219:
br label %label_220
label_220:
%t269 = phi i1 [ 1, %label_218 ], [ 0, %label_219]
br i1 %t269, label %label_194, label %label_195
label_194:
br label %label_196
label_195:
br label %label_196
label_196:
%t245 = phi i1 [ 1, %label_194 ], [ 0, %label_195]
%t280 = zext i1 %t245 to i32
%t281 = alloca i32 
store i32 %t280, i32* %t281
%t283 = load i32, i32* %t281
%t284 = trunc i32 %t283 to i1
br i1 %t284, label %label_228, label %label_230
label_228:
%t285 = load i32, i32* %t15
%t286 = load i32, i32* %t17
%t287 = load i32, i32* %t19
%t288 = load i32, i32* %t21
%t289 = call i1 @testFunc(i32 %t285, i32 %t286, i32 %t287, i32 %t288)
br i1 %t289, label %label_229, label %label_230
label_229:
br label %label_231
label_230:
br label %label_231
label_231:
%t282 = phi i1 [ 1, %label_229 ], [ 0, %label_230]
br i1 %t282, label %label_225, label %label_227
label_225:
%t290 = add i32 0, 5
call void @printi(i32 %t290)
br label %label_226
label_227:
%t291 = add i32 0, 6
call void @printi(i32 %t291)
br label %label_226
label_226:
ret void
}
