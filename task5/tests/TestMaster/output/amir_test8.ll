@.str0 = constant [75 x i8] c"toruth tabel for ((a and b) or (c and d)) for (a,b,c,d) in {false, true}^4\00"@.str1 = constant [86 x i8] c"toruth tabel for ((a or not b) and not (not c or d)) for (a,b,c,d) in {false, true}^4\00"
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
%t0 = getelementptr inbounds [75 x i8], [75 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
%t3 = add i1 0, 0
br i1 %t3, label %label_7, label %label_9
label_7:
%t4 = add i1 0, 0
br i1 %t4, label %label_8, label %label_9
label_8:
br label %label_10
label_9:
br label %label_10
label_10:
%t2 = phi i1 [ 1, %label_8 ], [ 0, %label_9]
br i1 %t2, label %label_4, label %label_3
label_3:
%t6 = add i1 0, 0
br i1 %t6, label %label_11, label %label_13
label_11:
%t7 = add i1 0, 0
br i1 %t7, label %label_12, label %label_13
label_12:
br label %label_14
label_13:
br label %label_14
label_14:
%t5 = phi i1 [ 1, %label_12 ], [ 0, %label_13]
br i1 %t5, label %label_4, label %label_5
label_4:
br label %label_6
label_5:
br label %label_6
label_6:
%t1 = phi i1 [ 1, %label_4 ], [ 0, %label_5]
br i1 %t1, label %label_0, label %label_2
label_0:
%t8 = add i32 0, 1
call void @printi(i32 %t8)
br label %label_1
label_2:
%t9 = add i32 0, 0
call void @printi(i32 %t9)
br label %label_1
label_1:
%t12 = add i1 0, 0
br i1 %t12, label %label_22, label %label_24
label_22:
%t13 = add i1 0, 0
br i1 %t13, label %label_23, label %label_24
label_23:
br label %label_25
label_24:
br label %label_25
label_25:
%t11 = phi i1 [ 1, %label_23 ], [ 0, %label_24]
br i1 %t11, label %label_19, label %label_18
label_18:
%t15 = add i1 0, 0
br i1 %t15, label %label_26, label %label_28
label_26:
%t16 = add i1 0, 1
br i1 %t16, label %label_27, label %label_28
label_27:
br label %label_29
label_28:
br label %label_29
label_29:
%t14 = phi i1 [ 1, %label_27 ], [ 0, %label_28]
br i1 %t14, label %label_19, label %label_20
label_19:
br label %label_21
label_20:
br label %label_21
label_21:
%t10 = phi i1 [ 1, %label_19 ], [ 0, %label_20]
br i1 %t10, label %label_15, label %label_17
label_15:
%t17 = add i32 0, 1
call void @printi(i32 %t17)
br label %label_16
label_17:
%t18 = add i32 0, 0
call void @printi(i32 %t18)
br label %label_16
label_16:
%t21 = add i1 0, 0
br i1 %t21, label %label_37, label %label_39
label_37:
%t22 = add i1 0, 0
br i1 %t22, label %label_38, label %label_39
label_38:
br label %label_40
label_39:
br label %label_40
label_40:
%t20 = phi i1 [ 1, %label_38 ], [ 0, %label_39]
br i1 %t20, label %label_34, label %label_33
label_33:
%t24 = add i1 0, 1
br i1 %t24, label %label_41, label %label_43
label_41:
%t25 = add i1 0, 0
br i1 %t25, label %label_42, label %label_43
label_42:
br label %label_44
label_43:
br label %label_44
label_44:
%t23 = phi i1 [ 1, %label_42 ], [ 0, %label_43]
br i1 %t23, label %label_34, label %label_35
label_34:
br label %label_36
label_35:
br label %label_36
label_36:
%t19 = phi i1 [ 1, %label_34 ], [ 0, %label_35]
br i1 %t19, label %label_30, label %label_32
label_30:
%t26 = add i32 0, 1
call void @printi(i32 %t26)
br label %label_31
label_32:
%t27 = add i32 0, 0
call void @printi(i32 %t27)
br label %label_31
label_31:
%t30 = add i1 0, 0
br i1 %t30, label %label_52, label %label_54
label_52:
%t31 = add i1 0, 0
br i1 %t31, label %label_53, label %label_54
label_53:
br label %label_55
label_54:
br label %label_55
label_55:
%t29 = phi i1 [ 1, %label_53 ], [ 0, %label_54]
br i1 %t29, label %label_49, label %label_48
label_48:
%t33 = add i1 0, 1
br i1 %t33, label %label_56, label %label_58
label_56:
%t34 = add i1 0, 1
br i1 %t34, label %label_57, label %label_58
label_57:
br label %label_59
label_58:
br label %label_59
label_59:
%t32 = phi i1 [ 1, %label_57 ], [ 0, %label_58]
br i1 %t32, label %label_49, label %label_50
label_49:
br label %label_51
label_50:
br label %label_51
label_51:
%t28 = phi i1 [ 1, %label_49 ], [ 0, %label_50]
br i1 %t28, label %label_45, label %label_47
label_45:
%t35 = add i32 0, 1
call void @printi(i32 %t35)
br label %label_46
label_47:
%t36 = add i32 0, 0
call void @printi(i32 %t36)
br label %label_46
label_46:
%t39 = add i1 0, 0
br i1 %t39, label %label_67, label %label_69
label_67:
%t40 = add i1 0, 1
br i1 %t40, label %label_68, label %label_69
label_68:
br label %label_70
label_69:
br label %label_70
label_70:
%t38 = phi i1 [ 1, %label_68 ], [ 0, %label_69]
br i1 %t38, label %label_64, label %label_63
label_63:
%t42 = add i1 0, 0
br i1 %t42, label %label_71, label %label_73
label_71:
%t43 = add i1 0, 0
br i1 %t43, label %label_72, label %label_73
label_72:
br label %label_74
label_73:
br label %label_74
label_74:
%t41 = phi i1 [ 1, %label_72 ], [ 0, %label_73]
br i1 %t41, label %label_64, label %label_65
label_64:
br label %label_66
label_65:
br label %label_66
label_66:
%t37 = phi i1 [ 1, %label_64 ], [ 0, %label_65]
br i1 %t37, label %label_60, label %label_62
label_60:
%t44 = add i32 0, 1
call void @printi(i32 %t44)
br label %label_61
label_62:
%t45 = add i32 0, 0
call void @printi(i32 %t45)
br label %label_61
label_61:
%t48 = add i1 0, 0
br i1 %t48, label %label_82, label %label_84
label_82:
%t49 = add i1 0, 1
br i1 %t49, label %label_83, label %label_84
label_83:
br label %label_85
label_84:
br label %label_85
label_85:
%t47 = phi i1 [ 1, %label_83 ], [ 0, %label_84]
br i1 %t47, label %label_79, label %label_78
label_78:
%t51 = add i1 0, 0
br i1 %t51, label %label_86, label %label_88
label_86:
%t52 = add i1 0, 1
br i1 %t52, label %label_87, label %label_88
label_87:
br label %label_89
label_88:
br label %label_89
label_89:
%t50 = phi i1 [ 1, %label_87 ], [ 0, %label_88]
br i1 %t50, label %label_79, label %label_80
label_79:
br label %label_81
label_80:
br label %label_81
label_81:
%t46 = phi i1 [ 1, %label_79 ], [ 0, %label_80]
br i1 %t46, label %label_75, label %label_77
label_75:
%t53 = add i32 0, 1
call void @printi(i32 %t53)
br label %label_76
label_77:
%t54 = add i32 0, 0
call void @printi(i32 %t54)
br label %label_76
label_76:
%t57 = add i1 0, 0
br i1 %t57, label %label_97, label %label_99
label_97:
%t58 = add i1 0, 1
br i1 %t58, label %label_98, label %label_99
label_98:
br label %label_100
label_99:
br label %label_100
label_100:
%t56 = phi i1 [ 1, %label_98 ], [ 0, %label_99]
br i1 %t56, label %label_94, label %label_93
label_93:
%t60 = add i1 0, 1
br i1 %t60, label %label_101, label %label_103
label_101:
%t61 = add i1 0, 0
br i1 %t61, label %label_102, label %label_103
label_102:
br label %label_104
label_103:
br label %label_104
label_104:
%t59 = phi i1 [ 1, %label_102 ], [ 0, %label_103]
br i1 %t59, label %label_94, label %label_95
label_94:
br label %label_96
label_95:
br label %label_96
label_96:
%t55 = phi i1 [ 1, %label_94 ], [ 0, %label_95]
br i1 %t55, label %label_90, label %label_92
label_90:
%t62 = add i32 0, 1
call void @printi(i32 %t62)
br label %label_91
label_92:
%t63 = add i32 0, 0
call void @printi(i32 %t63)
br label %label_91
label_91:
%t66 = add i1 0, 0
br i1 %t66, label %label_112, label %label_114
label_112:
%t67 = add i1 0, 1
br i1 %t67, label %label_113, label %label_114
label_113:
br label %label_115
label_114:
br label %label_115
label_115:
%t65 = phi i1 [ 1, %label_113 ], [ 0, %label_114]
br i1 %t65, label %label_109, label %label_108
label_108:
%t69 = add i1 0, 1
br i1 %t69, label %label_116, label %label_118
label_116:
%t70 = add i1 0, 1
br i1 %t70, label %label_117, label %label_118
label_117:
br label %label_119
label_118:
br label %label_119
label_119:
%t68 = phi i1 [ 1, %label_117 ], [ 0, %label_118]
br i1 %t68, label %label_109, label %label_110
label_109:
br label %label_111
label_110:
br label %label_111
label_111:
%t64 = phi i1 [ 1, %label_109 ], [ 0, %label_110]
br i1 %t64, label %label_105, label %label_107
label_105:
%t71 = add i32 0, 1
call void @printi(i32 %t71)
br label %label_106
label_107:
%t72 = add i32 0, 0
call void @printi(i32 %t72)
br label %label_106
label_106:
%t75 = add i1 0, 1
br i1 %t75, label %label_127, label %label_129
label_127:
%t76 = add i1 0, 0
br i1 %t76, label %label_128, label %label_129
label_128:
br label %label_130
label_129:
br label %label_130
label_130:
%t74 = phi i1 [ 1, %label_128 ], [ 0, %label_129]
br i1 %t74, label %label_124, label %label_123
label_123:
%t78 = add i1 0, 0
br i1 %t78, label %label_131, label %label_133
label_131:
%t79 = add i1 0, 0
br i1 %t79, label %label_132, label %label_133
label_132:
br label %label_134
label_133:
br label %label_134
label_134:
%t77 = phi i1 [ 1, %label_132 ], [ 0, %label_133]
br i1 %t77, label %label_124, label %label_125
label_124:
br label %label_126
label_125:
br label %label_126
label_126:
%t73 = phi i1 [ 1, %label_124 ], [ 0, %label_125]
br i1 %t73, label %label_120, label %label_122
label_120:
%t80 = add i32 0, 1
call void @printi(i32 %t80)
br label %label_121
label_122:
%t81 = add i32 0, 0
call void @printi(i32 %t81)
br label %label_121
label_121:
%t84 = add i1 0, 1
br i1 %t84, label %label_142, label %label_144
label_142:
%t85 = add i1 0, 0
br i1 %t85, label %label_143, label %label_144
label_143:
br label %label_145
label_144:
br label %label_145
label_145:
%t83 = phi i1 [ 1, %label_143 ], [ 0, %label_144]
br i1 %t83, label %label_139, label %label_138
label_138:
%t87 = add i1 0, 0
br i1 %t87, label %label_146, label %label_148
label_146:
%t88 = add i1 0, 1
br i1 %t88, label %label_147, label %label_148
label_147:
br label %label_149
label_148:
br label %label_149
label_149:
%t86 = phi i1 [ 1, %label_147 ], [ 0, %label_148]
br i1 %t86, label %label_139, label %label_140
label_139:
br label %label_141
label_140:
br label %label_141
label_141:
%t82 = phi i1 [ 1, %label_139 ], [ 0, %label_140]
br i1 %t82, label %label_135, label %label_137
label_135:
%t89 = add i32 0, 1
call void @printi(i32 %t89)
br label %label_136
label_137:
%t90 = add i32 0, 0
call void @printi(i32 %t90)
br label %label_136
label_136:
%t93 = add i1 0, 1
br i1 %t93, label %label_157, label %label_159
label_157:
%t94 = add i1 0, 0
br i1 %t94, label %label_158, label %label_159
label_158:
br label %label_160
label_159:
br label %label_160
label_160:
%t92 = phi i1 [ 1, %label_158 ], [ 0, %label_159]
br i1 %t92, label %label_154, label %label_153
label_153:
%t96 = add i1 0, 1
br i1 %t96, label %label_161, label %label_163
label_161:
%t97 = add i1 0, 0
br i1 %t97, label %label_162, label %label_163
label_162:
br label %label_164
label_163:
br label %label_164
label_164:
%t95 = phi i1 [ 1, %label_162 ], [ 0, %label_163]
br i1 %t95, label %label_154, label %label_155
label_154:
br label %label_156
label_155:
br label %label_156
label_156:
%t91 = phi i1 [ 1, %label_154 ], [ 0, %label_155]
br i1 %t91, label %label_150, label %label_152
label_150:
%t98 = add i32 0, 1
call void @printi(i32 %t98)
br label %label_151
label_152:
%t99 = add i32 0, 0
call void @printi(i32 %t99)
br label %label_151
label_151:
%t102 = add i1 0, 1
br i1 %t102, label %label_172, label %label_174
label_172:
%t103 = add i1 0, 0
br i1 %t103, label %label_173, label %label_174
label_173:
br label %label_175
label_174:
br label %label_175
label_175:
%t101 = phi i1 [ 1, %label_173 ], [ 0, %label_174]
br i1 %t101, label %label_169, label %label_168
label_168:
%t105 = add i1 0, 1
br i1 %t105, label %label_176, label %label_178
label_176:
%t106 = add i1 0, 1
br i1 %t106, label %label_177, label %label_178
label_177:
br label %label_179
label_178:
br label %label_179
label_179:
%t104 = phi i1 [ 1, %label_177 ], [ 0, %label_178]
br i1 %t104, label %label_169, label %label_170
label_169:
br label %label_171
label_170:
br label %label_171
label_171:
%t100 = phi i1 [ 1, %label_169 ], [ 0, %label_170]
br i1 %t100, label %label_165, label %label_167
label_165:
%t107 = add i32 0, 1
call void @printi(i32 %t107)
br label %label_166
label_167:
%t108 = add i32 0, 0
call void @printi(i32 %t108)
br label %label_166
label_166:
%t111 = add i1 0, 1
br i1 %t111, label %label_187, label %label_189
label_187:
%t112 = add i1 0, 1
br i1 %t112, label %label_188, label %label_189
label_188:
br label %label_190
label_189:
br label %label_190
label_190:
%t110 = phi i1 [ 1, %label_188 ], [ 0, %label_189]
br i1 %t110, label %label_184, label %label_183
label_183:
%t114 = add i1 0, 0
br i1 %t114, label %label_191, label %label_193
label_191:
%t115 = add i1 0, 0
br i1 %t115, label %label_192, label %label_193
label_192:
br label %label_194
label_193:
br label %label_194
label_194:
%t113 = phi i1 [ 1, %label_192 ], [ 0, %label_193]
br i1 %t113, label %label_184, label %label_185
label_184:
br label %label_186
label_185:
br label %label_186
label_186:
%t109 = phi i1 [ 1, %label_184 ], [ 0, %label_185]
br i1 %t109, label %label_180, label %label_182
label_180:
%t116 = add i32 0, 1
call void @printi(i32 %t116)
br label %label_181
label_182:
%t117 = add i32 0, 0
call void @printi(i32 %t117)
br label %label_181
label_181:
%t120 = add i1 0, 1
br i1 %t120, label %label_202, label %label_204
label_202:
%t121 = add i1 0, 1
br i1 %t121, label %label_203, label %label_204
label_203:
br label %label_205
label_204:
br label %label_205
label_205:
%t119 = phi i1 [ 1, %label_203 ], [ 0, %label_204]
br i1 %t119, label %label_199, label %label_198
label_198:
%t123 = add i1 0, 0
br i1 %t123, label %label_206, label %label_208
label_206:
%t124 = add i1 0, 1
br i1 %t124, label %label_207, label %label_208
label_207:
br label %label_209
label_208:
br label %label_209
label_209:
%t122 = phi i1 [ 1, %label_207 ], [ 0, %label_208]
br i1 %t122, label %label_199, label %label_200
label_199:
br label %label_201
label_200:
br label %label_201
label_201:
%t118 = phi i1 [ 1, %label_199 ], [ 0, %label_200]
br i1 %t118, label %label_195, label %label_197
label_195:
%t125 = add i32 0, 1
call void @printi(i32 %t125)
br label %label_196
label_197:
%t126 = add i32 0, 0
call void @printi(i32 %t126)
br label %label_196
label_196:
%t129 = add i1 0, 1
br i1 %t129, label %label_217, label %label_219
label_217:
%t130 = add i1 0, 1
br i1 %t130, label %label_218, label %label_219
label_218:
br label %label_220
label_219:
br label %label_220
label_220:
%t128 = phi i1 [ 1, %label_218 ], [ 0, %label_219]
br i1 %t128, label %label_214, label %label_213
label_213:
%t132 = add i1 0, 1
br i1 %t132, label %label_221, label %label_223
label_221:
%t133 = add i1 0, 0
br i1 %t133, label %label_222, label %label_223
label_222:
br label %label_224
label_223:
br label %label_224
label_224:
%t131 = phi i1 [ 1, %label_222 ], [ 0, %label_223]
br i1 %t131, label %label_214, label %label_215
label_214:
br label %label_216
label_215:
br label %label_216
label_216:
%t127 = phi i1 [ 1, %label_214 ], [ 0, %label_215]
br i1 %t127, label %label_210, label %label_212
label_210:
%t134 = add i32 0, 1
call void @printi(i32 %t134)
br label %label_211
label_212:
%t135 = add i32 0, 0
call void @printi(i32 %t135)
br label %label_211
label_211:
%t138 = add i1 0, 1
br i1 %t138, label %label_232, label %label_234
label_232:
%t139 = add i1 0, 1
br i1 %t139, label %label_233, label %label_234
label_233:
br label %label_235
label_234:
br label %label_235
label_235:
%t137 = phi i1 [ 1, %label_233 ], [ 0, %label_234]
br i1 %t137, label %label_229, label %label_228
label_228:
%t141 = add i1 0, 1
br i1 %t141, label %label_236, label %label_238
label_236:
%t142 = add i1 0, 1
br i1 %t142, label %label_237, label %label_238
label_237:
br label %label_239
label_238:
br label %label_239
label_239:
%t140 = phi i1 [ 1, %label_237 ], [ 0, %label_238]
br i1 %t140, label %label_229, label %label_230
label_229:
br label %label_231
label_230:
br label %label_231
label_231:
%t136 = phi i1 [ 1, %label_229 ], [ 0, %label_230]
br i1 %t136, label %label_225, label %label_227
label_225:
%t143 = add i32 0, 1
call void @printi(i32 %t143)
br label %label_226
label_227:
%t144 = add i32 0, 0
call void @printi(i32 %t144)
br label %label_226
label_226:
%t145 = getelementptr inbounds [86 x i8], [86 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t145)
%t148 = add i1 0, 0
br i1 %t148, label %label_248, label %label_247
label_247:
%t149 = add i1 0, 0
%t150 = xor i1 1, %t149
br i1 %t150, label %label_248, label %label_249
label_248:
br label %label_250
label_249:
br label %label_250
label_250:
%t147 = phi i1 [ 1, %label_248 ], [ 0, %label_249]
br i1 %t147, label %label_243, label %label_245
label_243:
%t152 = add i1 0, 0
%t153 = xor i1 1, %t152
br i1 %t153, label %label_252, label %label_251
label_251:
%t154 = add i1 0, 0
br i1 %t154, label %label_252, label %label_253
label_252:
br label %label_254
label_253:
br label %label_254
label_254:
%t151 = phi i1 [ 1, %label_252 ], [ 0, %label_253]
%t155 = xor i1 1, %t151
br i1 %t155, label %label_244, label %label_245
label_244:
br label %label_246
label_245:
br label %label_246
label_246:
%t146 = phi i1 [ 1, %label_244 ], [ 0, %label_245]
br i1 %t146, label %label_240, label %label_242
label_240:
%t156 = add i32 0, 1
call void @printi(i32 %t156)
br label %label_241
label_242:
%t157 = add i32 0, 0
call void @printi(i32 %t157)
br label %label_241
label_241:
%t160 = add i1 0, 0
br i1 %t160, label %label_263, label %label_262
label_262:
%t161 = add i1 0, 0
%t162 = xor i1 1, %t161
br i1 %t162, label %label_263, label %label_264
label_263:
br label %label_265
label_264:
br label %label_265
label_265:
%t159 = phi i1 [ 1, %label_263 ], [ 0, %label_264]
br i1 %t159, label %label_258, label %label_260
label_258:
%t164 = add i1 0, 0
%t165 = xor i1 1, %t164
br i1 %t165, label %label_267, label %label_266
label_266:
%t166 = add i1 0, 1
br i1 %t166, label %label_267, label %label_268
label_267:
br label %label_269
label_268:
br label %label_269
label_269:
%t163 = phi i1 [ 1, %label_267 ], [ 0, %label_268]
%t167 = xor i1 1, %t163
br i1 %t167, label %label_259, label %label_260
label_259:
br label %label_261
label_260:
br label %label_261
label_261:
%t158 = phi i1 [ 1, %label_259 ], [ 0, %label_260]
br i1 %t158, label %label_255, label %label_257
label_255:
%t168 = add i32 0, 1
call void @printi(i32 %t168)
br label %label_256
label_257:
%t169 = add i32 0, 0
call void @printi(i32 %t169)
br label %label_256
label_256:
%t172 = add i1 0, 0
br i1 %t172, label %label_278, label %label_277
label_277:
%t173 = add i1 0, 0
%t174 = xor i1 1, %t173
br i1 %t174, label %label_278, label %label_279
label_278:
br label %label_280
label_279:
br label %label_280
label_280:
%t171 = phi i1 [ 1, %label_278 ], [ 0, %label_279]
br i1 %t171, label %label_273, label %label_275
label_273:
%t176 = add i1 0, 1
%t177 = xor i1 1, %t176
br i1 %t177, label %label_282, label %label_281
label_281:
%t178 = add i1 0, 0
br i1 %t178, label %label_282, label %label_283
label_282:
br label %label_284
label_283:
br label %label_284
label_284:
%t175 = phi i1 [ 1, %label_282 ], [ 0, %label_283]
%t179 = xor i1 1, %t175
br i1 %t179, label %label_274, label %label_275
label_274:
br label %label_276
label_275:
br label %label_276
label_276:
%t170 = phi i1 [ 1, %label_274 ], [ 0, %label_275]
br i1 %t170, label %label_270, label %label_272
label_270:
%t180 = add i32 0, 1
call void @printi(i32 %t180)
br label %label_271
label_272:
%t181 = add i32 0, 0
call void @printi(i32 %t181)
br label %label_271
label_271:
%t184 = add i1 0, 0
br i1 %t184, label %label_293, label %label_292
label_292:
%t185 = add i1 0, 0
%t186 = xor i1 1, %t185
br i1 %t186, label %label_293, label %label_294
label_293:
br label %label_295
label_294:
br label %label_295
label_295:
%t183 = phi i1 [ 1, %label_293 ], [ 0, %label_294]
br i1 %t183, label %label_288, label %label_290
label_288:
%t188 = add i1 0, 1
%t189 = xor i1 1, %t188
br i1 %t189, label %label_297, label %label_296
label_296:
%t190 = add i1 0, 1
br i1 %t190, label %label_297, label %label_298
label_297:
br label %label_299
label_298:
br label %label_299
label_299:
%t187 = phi i1 [ 1, %label_297 ], [ 0, %label_298]
%t191 = xor i1 1, %t187
br i1 %t191, label %label_289, label %label_290
label_289:
br label %label_291
label_290:
br label %label_291
label_291:
%t182 = phi i1 [ 1, %label_289 ], [ 0, %label_290]
br i1 %t182, label %label_285, label %label_287
label_285:
%t192 = add i32 0, 1
call void @printi(i32 %t192)
br label %label_286
label_287:
%t193 = add i32 0, 0
call void @printi(i32 %t193)
br label %label_286
label_286:
%t196 = add i1 0, 0
br i1 %t196, label %label_308, label %label_307
label_307:
%t197 = add i1 0, 1
%t198 = xor i1 1, %t197
br i1 %t198, label %label_308, label %label_309
label_308:
br label %label_310
label_309:
br label %label_310
label_310:
%t195 = phi i1 [ 1, %label_308 ], [ 0, %label_309]
br i1 %t195, label %label_303, label %label_305
label_303:
%t200 = add i1 0, 0
%t201 = xor i1 1, %t200
br i1 %t201, label %label_312, label %label_311
label_311:
%t202 = add i1 0, 0
br i1 %t202, label %label_312, label %label_313
label_312:
br label %label_314
label_313:
br label %label_314
label_314:
%t199 = phi i1 [ 1, %label_312 ], [ 0, %label_313]
%t203 = xor i1 1, %t199
br i1 %t203, label %label_304, label %label_305
label_304:
br label %label_306
label_305:
br label %label_306
label_306:
%t194 = phi i1 [ 1, %label_304 ], [ 0, %label_305]
br i1 %t194, label %label_300, label %label_302
label_300:
%t204 = add i32 0, 1
call void @printi(i32 %t204)
br label %label_301
label_302:
%t205 = add i32 0, 0
call void @printi(i32 %t205)
br label %label_301
label_301:
%t208 = add i1 0, 0
br i1 %t208, label %label_323, label %label_322
label_322:
%t209 = add i1 0, 1
%t210 = xor i1 1, %t209
br i1 %t210, label %label_323, label %label_324
label_323:
br label %label_325
label_324:
br label %label_325
label_325:
%t207 = phi i1 [ 1, %label_323 ], [ 0, %label_324]
br i1 %t207, label %label_318, label %label_320
label_318:
%t212 = add i1 0, 0
%t213 = xor i1 1, %t212
br i1 %t213, label %label_327, label %label_326
label_326:
%t214 = add i1 0, 1
br i1 %t214, label %label_327, label %label_328
label_327:
br label %label_329
label_328:
br label %label_329
label_329:
%t211 = phi i1 [ 1, %label_327 ], [ 0, %label_328]
%t215 = xor i1 1, %t211
br i1 %t215, label %label_319, label %label_320
label_319:
br label %label_321
label_320:
br label %label_321
label_321:
%t206 = phi i1 [ 1, %label_319 ], [ 0, %label_320]
br i1 %t206, label %label_315, label %label_317
label_315:
%t216 = add i32 0, 1
call void @printi(i32 %t216)
br label %label_316
label_317:
%t217 = add i32 0, 0
call void @printi(i32 %t217)
br label %label_316
label_316:
%t220 = add i1 0, 0
br i1 %t220, label %label_338, label %label_337
label_337:
%t221 = add i1 0, 1
%t222 = xor i1 1, %t221
br i1 %t222, label %label_338, label %label_339
label_338:
br label %label_340
label_339:
br label %label_340
label_340:
%t219 = phi i1 [ 1, %label_338 ], [ 0, %label_339]
br i1 %t219, label %label_333, label %label_335
label_333:
%t224 = add i1 0, 1
%t225 = xor i1 1, %t224
br i1 %t225, label %label_342, label %label_341
label_341:
%t226 = add i1 0, 0
br i1 %t226, label %label_342, label %label_343
label_342:
br label %label_344
label_343:
br label %label_344
label_344:
%t223 = phi i1 [ 1, %label_342 ], [ 0, %label_343]
%t227 = xor i1 1, %t223
br i1 %t227, label %label_334, label %label_335
label_334:
br label %label_336
label_335:
br label %label_336
label_336:
%t218 = phi i1 [ 1, %label_334 ], [ 0, %label_335]
br i1 %t218, label %label_330, label %label_332
label_330:
%t228 = add i32 0, 1
call void @printi(i32 %t228)
br label %label_331
label_332:
%t229 = add i32 0, 0
call void @printi(i32 %t229)
br label %label_331
label_331:
%t232 = add i1 0, 0
br i1 %t232, label %label_353, label %label_352
label_352:
%t233 = add i1 0, 1
%t234 = xor i1 1, %t233
br i1 %t234, label %label_353, label %label_354
label_353:
br label %label_355
label_354:
br label %label_355
label_355:
%t231 = phi i1 [ 1, %label_353 ], [ 0, %label_354]
br i1 %t231, label %label_348, label %label_350
label_348:
%t236 = add i1 0, 1
%t237 = xor i1 1, %t236
br i1 %t237, label %label_357, label %label_356
label_356:
%t238 = add i1 0, 1
br i1 %t238, label %label_357, label %label_358
label_357:
br label %label_359
label_358:
br label %label_359
label_359:
%t235 = phi i1 [ 1, %label_357 ], [ 0, %label_358]
%t239 = xor i1 1, %t235
br i1 %t239, label %label_349, label %label_350
label_349:
br label %label_351
label_350:
br label %label_351
label_351:
%t230 = phi i1 [ 1, %label_349 ], [ 0, %label_350]
br i1 %t230, label %label_345, label %label_347
label_345:
%t240 = add i32 0, 1
call void @printi(i32 %t240)
br label %label_346
label_347:
%t241 = add i32 0, 0
call void @printi(i32 %t241)
br label %label_346
label_346:
%t244 = add i1 0, 1
br i1 %t244, label %label_368, label %label_367
label_367:
%t245 = add i1 0, 0
%t246 = xor i1 1, %t245
br i1 %t246, label %label_368, label %label_369
label_368:
br label %label_370
label_369:
br label %label_370
label_370:
%t243 = phi i1 [ 1, %label_368 ], [ 0, %label_369]
br i1 %t243, label %label_363, label %label_365
label_363:
%t248 = add i1 0, 0
%t249 = xor i1 1, %t248
br i1 %t249, label %label_372, label %label_371
label_371:
%t250 = add i1 0, 0
br i1 %t250, label %label_372, label %label_373
label_372:
br label %label_374
label_373:
br label %label_374
label_374:
%t247 = phi i1 [ 1, %label_372 ], [ 0, %label_373]
%t251 = xor i1 1, %t247
br i1 %t251, label %label_364, label %label_365
label_364:
br label %label_366
label_365:
br label %label_366
label_366:
%t242 = phi i1 [ 1, %label_364 ], [ 0, %label_365]
br i1 %t242, label %label_360, label %label_362
label_360:
%t252 = add i32 0, 1
call void @printi(i32 %t252)
br label %label_361
label_362:
%t253 = add i32 0, 0
call void @printi(i32 %t253)
br label %label_361
label_361:
%t256 = add i1 0, 1
br i1 %t256, label %label_383, label %label_382
label_382:
%t257 = add i1 0, 0
%t258 = xor i1 1, %t257
br i1 %t258, label %label_383, label %label_384
label_383:
br label %label_385
label_384:
br label %label_385
label_385:
%t255 = phi i1 [ 1, %label_383 ], [ 0, %label_384]
br i1 %t255, label %label_378, label %label_380
label_378:
%t260 = add i1 0, 0
%t261 = xor i1 1, %t260
br i1 %t261, label %label_387, label %label_386
label_386:
%t262 = add i1 0, 1
br i1 %t262, label %label_387, label %label_388
label_387:
br label %label_389
label_388:
br label %label_389
label_389:
%t259 = phi i1 [ 1, %label_387 ], [ 0, %label_388]
%t263 = xor i1 1, %t259
br i1 %t263, label %label_379, label %label_380
label_379:
br label %label_381
label_380:
br label %label_381
label_381:
%t254 = phi i1 [ 1, %label_379 ], [ 0, %label_380]
br i1 %t254, label %label_375, label %label_377
label_375:
%t264 = add i32 0, 1
call void @printi(i32 %t264)
br label %label_376
label_377:
%t265 = add i32 0, 0
call void @printi(i32 %t265)
br label %label_376
label_376:
%t268 = add i1 0, 1
br i1 %t268, label %label_398, label %label_397
label_397:
%t269 = add i1 0, 0
%t270 = xor i1 1, %t269
br i1 %t270, label %label_398, label %label_399
label_398:
br label %label_400
label_399:
br label %label_400
label_400:
%t267 = phi i1 [ 1, %label_398 ], [ 0, %label_399]
br i1 %t267, label %label_393, label %label_395
label_393:
%t272 = add i1 0, 1
%t273 = xor i1 1, %t272
br i1 %t273, label %label_402, label %label_401
label_401:
%t274 = add i1 0, 0
br i1 %t274, label %label_402, label %label_403
label_402:
br label %label_404
label_403:
br label %label_404
label_404:
%t271 = phi i1 [ 1, %label_402 ], [ 0, %label_403]
%t275 = xor i1 1, %t271
br i1 %t275, label %label_394, label %label_395
label_394:
br label %label_396
label_395:
br label %label_396
label_396:
%t266 = phi i1 [ 1, %label_394 ], [ 0, %label_395]
br i1 %t266, label %label_390, label %label_392
label_390:
%t276 = add i32 0, 1
call void @printi(i32 %t276)
br label %label_391
label_392:
%t277 = add i32 0, 0
call void @printi(i32 %t277)
br label %label_391
label_391:
%t280 = add i1 0, 1
br i1 %t280, label %label_413, label %label_412
label_412:
%t281 = add i1 0, 0
%t282 = xor i1 1, %t281
br i1 %t282, label %label_413, label %label_414
label_413:
br label %label_415
label_414:
br label %label_415
label_415:
%t279 = phi i1 [ 1, %label_413 ], [ 0, %label_414]
br i1 %t279, label %label_408, label %label_410
label_408:
%t284 = add i1 0, 1
%t285 = xor i1 1, %t284
br i1 %t285, label %label_417, label %label_416
label_416:
%t286 = add i1 0, 1
br i1 %t286, label %label_417, label %label_418
label_417:
br label %label_419
label_418:
br label %label_419
label_419:
%t283 = phi i1 [ 1, %label_417 ], [ 0, %label_418]
%t287 = xor i1 1, %t283
br i1 %t287, label %label_409, label %label_410
label_409:
br label %label_411
label_410:
br label %label_411
label_411:
%t278 = phi i1 [ 1, %label_409 ], [ 0, %label_410]
br i1 %t278, label %label_405, label %label_407
label_405:
%t288 = add i32 0, 1
call void @printi(i32 %t288)
br label %label_406
label_407:
%t289 = add i32 0, 0
call void @printi(i32 %t289)
br label %label_406
label_406:
%t292 = add i1 0, 1
br i1 %t292, label %label_428, label %label_427
label_427:
%t293 = add i1 0, 1
%t294 = xor i1 1, %t293
br i1 %t294, label %label_428, label %label_429
label_428:
br label %label_430
label_429:
br label %label_430
label_430:
%t291 = phi i1 [ 1, %label_428 ], [ 0, %label_429]
br i1 %t291, label %label_423, label %label_425
label_423:
%t296 = add i1 0, 0
%t297 = xor i1 1, %t296
br i1 %t297, label %label_432, label %label_431
label_431:
%t298 = add i1 0, 0
br i1 %t298, label %label_432, label %label_433
label_432:
br label %label_434
label_433:
br label %label_434
label_434:
%t295 = phi i1 [ 1, %label_432 ], [ 0, %label_433]
%t299 = xor i1 1, %t295
br i1 %t299, label %label_424, label %label_425
label_424:
br label %label_426
label_425:
br label %label_426
label_426:
%t290 = phi i1 [ 1, %label_424 ], [ 0, %label_425]
br i1 %t290, label %label_420, label %label_422
label_420:
%t300 = add i32 0, 1
call void @printi(i32 %t300)
br label %label_421
label_422:
%t301 = add i32 0, 0
call void @printi(i32 %t301)
br label %label_421
label_421:
%t304 = add i1 0, 1
br i1 %t304, label %label_443, label %label_442
label_442:
%t305 = add i1 0, 1
%t306 = xor i1 1, %t305
br i1 %t306, label %label_443, label %label_444
label_443:
br label %label_445
label_444:
br label %label_445
label_445:
%t303 = phi i1 [ 1, %label_443 ], [ 0, %label_444]
br i1 %t303, label %label_438, label %label_440
label_438:
%t308 = add i1 0, 0
%t309 = xor i1 1, %t308
br i1 %t309, label %label_447, label %label_446
label_446:
%t310 = add i1 0, 1
br i1 %t310, label %label_447, label %label_448
label_447:
br label %label_449
label_448:
br label %label_449
label_449:
%t307 = phi i1 [ 1, %label_447 ], [ 0, %label_448]
%t311 = xor i1 1, %t307
br i1 %t311, label %label_439, label %label_440
label_439:
br label %label_441
label_440:
br label %label_441
label_441:
%t302 = phi i1 [ 1, %label_439 ], [ 0, %label_440]
br i1 %t302, label %label_435, label %label_437
label_435:
%t312 = add i32 0, 1
call void @printi(i32 %t312)
br label %label_436
label_437:
%t313 = add i32 0, 0
call void @printi(i32 %t313)
br label %label_436
label_436:
%t316 = add i1 0, 1
br i1 %t316, label %label_458, label %label_457
label_457:
%t317 = add i1 0, 1
%t318 = xor i1 1, %t317
br i1 %t318, label %label_458, label %label_459
label_458:
br label %label_460
label_459:
br label %label_460
label_460:
%t315 = phi i1 [ 1, %label_458 ], [ 0, %label_459]
br i1 %t315, label %label_453, label %label_455
label_453:
%t320 = add i1 0, 1
%t321 = xor i1 1, %t320
br i1 %t321, label %label_462, label %label_461
label_461:
%t322 = add i1 0, 0
br i1 %t322, label %label_462, label %label_463
label_462:
br label %label_464
label_463:
br label %label_464
label_464:
%t319 = phi i1 [ 1, %label_462 ], [ 0, %label_463]
%t323 = xor i1 1, %t319
br i1 %t323, label %label_454, label %label_455
label_454:
br label %label_456
label_455:
br label %label_456
label_456:
%t314 = phi i1 [ 1, %label_454 ], [ 0, %label_455]
br i1 %t314, label %label_450, label %label_452
label_450:
%t324 = add i32 0, 1
call void @printi(i32 %t324)
br label %label_451
label_452:
%t325 = add i32 0, 0
call void @printi(i32 %t325)
br label %label_451
label_451:
%t328 = add i1 0, 1
br i1 %t328, label %label_473, label %label_472
label_472:
%t329 = add i1 0, 1
%t330 = xor i1 1, %t329
br i1 %t330, label %label_473, label %label_474
label_473:
br label %label_475
label_474:
br label %label_475
label_475:
%t327 = phi i1 [ 1, %label_473 ], [ 0, %label_474]
br i1 %t327, label %label_468, label %label_470
label_468:
%t332 = add i1 0, 1
%t333 = xor i1 1, %t332
br i1 %t333, label %label_477, label %label_476
label_476:
%t334 = add i1 0, 1
br i1 %t334, label %label_477, label %label_478
label_477:
br label %label_479
label_478:
br label %label_479
label_479:
%t331 = phi i1 [ 1, %label_477 ], [ 0, %label_478]
%t335 = xor i1 1, %t331
br i1 %t335, label %label_469, label %label_470
label_469:
br label %label_471
label_470:
br label %label_471
label_471:
%t326 = phi i1 [ 1, %label_469 ], [ 0, %label_470]
br i1 %t326, label %label_465, label %label_467
label_465:
%t336 = add i32 0, 1
call void @printi(i32 %t336)
br label %label_466
label_467:
%t337 = add i32 0, 0
call void @printi(i32 %t337)
br label %label_466
label_466:
ret void
}
