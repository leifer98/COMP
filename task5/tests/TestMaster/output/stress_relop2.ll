@.str0 = constant [14 x i8] c"expr1 is true\00"@.str1 = constant [15 x i8] c"expr1 is false\00"@.str2 = constant [14 x i8] c"expr2 is true\00"@.str3 = constant [15 x i8] c"expr2 is false\00"@.str4 = constant [14 x i8] c"expr3 is true\00"@.str5 = constant [15 x i8] c"expr3 is false\00"@.str6 = constant [6 x i8] c"loopA\00"@.str7 = constant [14 x i8] c"expr4 is true\00"@.str8 = constant [15 x i8] c"expr4 is false\00"@.str9 = constant [14 x i8] c"expr5 is true\00"@.str10 = constant [15 x i8] c"expr5 is false\00"@.str11 = constant [6 x i8] c"loopB\00"@.str12 = constant [14 x i8] c"expr6 is true\00"@.str13 = constant [15 x i8] c"expr6 is false\00"@.str14 = constant [14 x i8] c"expr7 is true\00"@.str15 = constant [15 x i8] c"expr7 is false\00"@.str16 = constant [14 x i8] c"expr8 is true\00"@.str17 = constant [15 x i8] c"expr8 is false\00"@.str18 = constant [6 x i8] c"loopC\00"@.str19 = constant [14 x i8] c"expr9 is true\00"@.str20 = constant [15 x i8] c"expr9 is false\00"@.str21 = constant [15 x i8] c"expr10 is true\00"@.str22 = constant [16 x i8] c"expr10 is false\00"
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
define i32 @bigger(i32, i32) {
%t0 = icmp sgt i32 %0, %1
br i1 %t0, label %label_0, label %label_1
label_0:
%t1 = add i32 0, 1
ret i32 %t1
br label %label_1
label_1:
%t2 = add i32 0, 0
ret i32 %t2
}
define i32 @smaller(i32, i32) {
%t3 = icmp slt i32 %0, %1
br i1 %t3, label %label_2, label %label_3
label_2:
%t4 = add i32 0, 1
ret i32 %t4
br label %label_3
label_3:
%t5 = add i32 0, 0
ret i32 %t5
}
define i32 @equal(i32, i32) {
%t6 = icmp eq i32 %0, %1
br i1 %t6, label %label_4, label %label_5
label_4:
%t7 = add i32 0, 1
ret i32 %t7
br label %label_5
label_5:
%t8 = add i32 0, 0
ret i32 %t8
}
define void @main() {
%t9 = add i32 0, 5
%t10 = alloca i32 
store i32 %t9, i32* %t10
%t11 = add i32 0, 10
%t12 = alloca i32 
store i32 %t11, i32* %t12
%t13 = add i32 0, 8
%t14 = alloca i32 
store i32 %t13, i32* %t14
%t15 = add i32 0, 3
%t16 = alloca i32 
store i32 %t15, i32* %t16
%t17 = add i32 0, 7
%t18 = alloca i32 
store i32 %t17, i32* %t18
%t19 = add i32 0, 0
%t20 = alloca i32 
store i32 %t19, i32* %t20
%t21 = add i32 0, 1
%t22 = alloca i32 
store i32 %t21, i32* %t22
%t23 = add i32 0, 5
%t24 = alloca i32 
store i32 %t23, i32* %t24
%t25 = add i32 0, 5
%t26 = alloca i32 
store i32 %t25, i32* %t26
%t27 = add i32 0, 2
%t28 = alloca i32 
store i32 %t27, i32* %t28
%t29 = add i32 0, 9
%t30 = alloca i32 
store i32 %t29, i32* %t30
%t33 = load i32, i32* %t10
%t34 = load i32, i32* %t12
%t32 = add i32 %t33, %t34
%t36 = load i32, i32* %t14
%t37 = load i32, i32* %t16
%t35 = add i32 %t36, %t37
%t38 = icmp slt i32 %t32, %t35
br i1 %t38, label %label_6, label %label_8
label_6:
%t39 = load i32, i32* %t10
%t40 = load i32, i32* %t14
%t41 = call i32 @bigger(i32 %t39, i32 %t40)
%t42 = load i32, i32* %t16
%t43 = load i32, i32* %t18
%t44 = call i32 @smaller(i32 %t42, i32 %t43)
%t45 = icmp eq i32 %t41, %t44
br i1 %t45, label %label_7, label %label_8
label_7:
br label %label_9
label_8:
br label %label_9
label_9:
%t31 = phi i1 [ 1, %label_7 ], [ 0, %label_8]
%t46 = zext i1 %t31 to i32
%t47 = alloca i32 
store i32 %t46, i32* %t47
%t48 = load i32, i32* %t47
%t49 = trunc i32 %t48 to i1
br i1 %t49, label %label_10, label %label_12
label_10:
%t50 = getelementptr inbounds [14 x i8], [14 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t50)
br label %label_11
label_12:
%t51 = getelementptr inbounds [15 x i8], [15 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t51)
br label %label_11
label_11:
%t53 = load i32, i32* %t20
%t54 = load i32, i32* %t22
%t55 = icmp ne i32 %t53, %t54
br i1 %t55, label %label_14, label %label_13
label_13:
%t57 = load i32, i32* %t28
%t58 = load i32, i32* %t30
%t56 = add i32 %t57, %t58
%t60 = load i32, i32* %t10
%t61 = load i32, i32* %t14
%t59 = add i32 %t60, %t61
%t62 = icmp sgt i32 %t56, %t59
br i1 %t62, label %label_14, label %label_15
label_14:
br label %label_16
label_15:
br label %label_16
label_16:
%t52 = phi i1 [ 1, %label_14 ], [ 0, %label_15]
%t63 = zext i1 %t52 to i32
%t64 = alloca i32 
store i32 %t63, i32* %t64
%t65 = load i32, i32* %t64
%t66 = trunc i32 %t65 to i1
br i1 %t66, label %label_17, label %label_19
label_17:
%t67 = getelementptr inbounds [14 x i8], [14 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t67)
br label %label_18
label_19:
%t68 = getelementptr inbounds [15 x i8], [15 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t68)
br label %label_18
label_18:
%t70 = load i32, i32* %t10
%t71 = load i32, i32* %t12
%t72 = call i32 @smaller(i32 %t70, i32 %t71)
%t73 = add i32 0, 0
%t74 = icmp ne i32 %t72, %t73
br i1 %t74, label %label_20, label %label_22
label_20:
%t75 = load i32, i32* %t24
%t76 = load i32, i32* %t26
%t77 = call i32 @equal(i32 %t75, i32 %t76)
%t78 = add i32 0, 1
%t79 = icmp eq i32 %t77, %t78
br i1 %t79, label %label_21, label %label_22
label_21:
br label %label_23
label_22:
br label %label_23
label_23:
%t69 = phi i1 [ 1, %label_21 ], [ 0, %label_22]
%t80 = zext i1 %t69 to i32
%t81 = alloca i32 
store i32 %t80, i32* %t81
%t82 = load i32, i32* %t81
%t83 = trunc i32 %t82 to i1
br i1 %t83, label %label_24, label %label_26
label_24:
%t84 = getelementptr inbounds [14 x i8], [14 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t84)
br label %label_25
label_26:
%t85 = getelementptr inbounds [15 x i8], [15 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t85)
br label %label_25
label_25:
br label %label_27
label_27:
%t88 = load i32, i32* %t10
%t89 = load i32, i32* %t12
%t87 = add i32 %t88, %t89
%t91 = load i32, i32* %t14
%t92 = load i32, i32* %t16
%t90 = mul i32 %t91, %t92
%t93 = icmp sgt i32 %t87, %t90
br i1 %t93, label %label_31, label %label_30
label_30:
%t94 = load i32, i32* %t20
%t95 = load i32, i32* %t22
%t96 = icmp slt i32 %t94, %t95
br i1 %t96, label %label_31, label %label_32
label_31:
br label %label_33
label_32:
br label %label_33
label_33:
%t86 = phi i1 [ 1, %label_31 ], [ 0, %label_32]
br i1 %t86, label %label_28, label %label_29
label_28:
%t97 = getelementptr inbounds [6 x i8], [6 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t97)
%t99 = load i32, i32* %t20
%t100 = add i32 0, 1
%t98 = add i32 %t99, %t100
store i32 %t98, i32* %t20
%t101 = load i32, i32* %t20
%t102 = add i32 0, 3
%t103 = icmp sgt i32 %t101, %t102
br i1 %t103, label %label_34, label %label_35
label_34:
br label %label_29
br label %label_35
label_35:
br label %label_27
label_29:
%t104 = add i32 0, 0
store i32 %t104, i32* %t20
%t107 = load i32, i32* %t20
%t108 = load i32, i32* %t22
%t109 = call i32 @bigger(i32 %t107, i32 %t108)
%t110 = load i32, i32* %t10
%t111 = load i32, i32* %t16
%t112 = call i32 @smaller(i32 %t110, i32 %t111)
%t106 = add i32 %t109, %t112
%t113 = add i32 0, 1
%t114 = icmp sgt i32 %t106, %t113
br i1 %t114, label %label_36, label %label_38
label_36:
%t116 = load i32, i32* %t28
%t117 = load i32, i32* %t30
%t115 = add i32 %t116, %t117
%t118 = add i32 0, 15
%t119 = icmp slt i32 %t115, %t118
br i1 %t119, label %label_37, label %label_38
label_37:
br label %label_39
label_38:
br label %label_39
label_39:
%t105 = phi i1 [ 1, %label_37 ], [ 0, %label_38]
%t120 = zext i1 %t105 to i32
%t121 = alloca i32 
store i32 %t120, i32* %t121
%t122 = load i32, i32* %t121
%t123 = trunc i32 %t122 to i1
br i1 %t123, label %label_40, label %label_42
label_40:
%t124 = getelementptr inbounds [14 x i8], [14 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t124)
br label %label_41
label_42:
%t125 = getelementptr inbounds [15 x i8], [15 x i8]* @.str8, i32 0, i32 0
call void @print(i8* %t125)
br label %label_41
label_41:
%t127 = load i32, i32* %t24
%t128 = load i32, i32* %t26
%t129 = call i32 @equal(i32 %t127, i32 %t128)
%t130 = add i32 0, 1
%t131 = icmp eq i32 %t129, %t130
br i1 %t131, label %label_43, label %label_45
label_43:
%t133 = load i32, i32* %t12
%t134 = load i32, i32* %t16
%t132 = sub i32 %t133, %t134
%t136 = load i32, i32* %t18
%t137 = add i32 0, 2
%t135 = add i32 %t136, %t137
%t138 = icmp slt i32 %t132, %t135
br i1 %t138, label %label_44, label %label_45
label_44:
br label %label_46
label_45:
br label %label_46
label_46:
%t126 = phi i1 [ 1, %label_44 ], [ 0, %label_45]
%t139 = zext i1 %t126 to i32
%t140 = alloca i32 
store i32 %t139, i32* %t140
%t141 = load i32, i32* %t140
%t142 = trunc i32 %t141 to i1
br i1 %t142, label %label_47, label %label_49
label_47:
%t143 = getelementptr inbounds [14 x i8], [14 x i8]* @.str9, i32 0, i32 0
call void @print(i8* %t143)
br label %label_48
label_49:
%t144 = getelementptr inbounds [15 x i8], [15 x i8]* @.str10, i32 0, i32 0
call void @print(i8* %t144)
br label %label_48
label_48:
br label %label_50
label_50:
%t146 = load i32, i32* %t20
%t147 = load i32, i32* %t22
%t148 = call i32 @smaller(i32 %t146, i32 %t147)
%t149 = add i32 0, 1
%t150 = icmp eq i32 %t148, %t149
br i1 %t150, label %label_53, label %label_55
label_53:
%t152 = load i32, i32* %t12
%t153 = load i32, i32* %t14
%t151 = add i32 %t152, %t153
%t154 = add i32 0, 10
%t155 = icmp sgt i32 %t151, %t154
br i1 %t155, label %label_54, label %label_55
label_54:
br label %label_56
label_55:
br label %label_56
label_56:
%t145 = phi i1 [ 1, %label_54 ], [ 0, %label_55]
br i1 %t145, label %label_51, label %label_52
label_51:
%t156 = getelementptr inbounds [6 x i8], [6 x i8]* @.str11, i32 0, i32 0
call void @print(i8* %t156)
%t158 = load i32, i32* %t22
%t159 = add i32 0, 1
%t157 = add i32 %t158, %t159
store i32 %t157, i32* %t22
%t160 = load i32, i32* %t22
%t161 = add i32 0, 3
%t162 = icmp sgt i32 %t160, %t161
br i1 %t162, label %label_57, label %label_58
label_57:
br label %label_52
br label %label_58
label_58:
br label %label_50
label_52:
%t164 = load i32, i32* %t10
%t165 = load i32, i32* %t12
%t166 = call i32 @bigger(i32 %t164, i32 %t165)
%t167 = load i32, i32* %t14
%t168 = load i32, i32* %t16
%t169 = call i32 @bigger(i32 %t167, i32 %t168)
%t170 = icmp eq i32 %t166, %t169
br i1 %t170, label %label_60, label %label_59
label_59:
%t171 = load i32, i32* %t28
%t172 = load i32, i32* %t30
%t173 = call i32 @smaller(i32 %t171, i32 %t172)
%t174 = add i32 0, 0
%t175 = icmp eq i32 %t173, %t174
br i1 %t175, label %label_60, label %label_61
label_60:
br label %label_62
label_61:
br label %label_62
label_62:
%t163 = phi i1 [ 1, %label_60 ], [ 0, %label_61]
%t176 = zext i1 %t163 to i32
%t177 = alloca i32 
store i32 %t176, i32* %t177
%t178 = load i32, i32* %t177
%t179 = trunc i32 %t178 to i1
br i1 %t179, label %label_63, label %label_65
label_63:
%t180 = getelementptr inbounds [14 x i8], [14 x i8]* @.str12, i32 0, i32 0
call void @print(i8* %t180)
br label %label_64
label_65:
%t181 = getelementptr inbounds [15 x i8], [15 x i8]* @.str13, i32 0, i32 0
call void @print(i8* %t181)
br label %label_64
label_64:
%t184 = load i32, i32* %t10
%t185 = load i32, i32* %t18
%t186 = call i32 @bigger(i32 %t184, i32 %t185)
%t187 = load i32, i32* %t24
%t188 = load i32, i32* %t26
%t189 = call i32 @smaller(i32 %t187, i32 %t188)
%t183 = add i32 %t186, %t189
%t190 = add i32 0, 2
%t191 = icmp slt i32 %t183, %t190
br i1 %t191, label %label_66, label %label_68
label_66:
%t193 = load i32, i32* %t28
%t194 = load i32, i32* %t30
%t195 = call i32 @equal(i32 %t193, i32 %t194)
%t196 = add i32 0, 0
%t197 = icmp eq i32 %t195, %t196
br i1 %t197, label %label_71, label %label_70
label_70:
%t198 = load i32, i32* %t20
%t199 = load i32, i32* %t22
%t200 = icmp sgt i32 %t198, %t199
br i1 %t200, label %label_71, label %label_72
label_71:
br label %label_73
label_72:
br label %label_73
label_73:
%t192 = phi i1 [ 1, %label_71 ], [ 0, %label_72]
br i1 %t192, label %label_67, label %label_68
label_67:
br label %label_69
label_68:
br label %label_69
label_69:
%t182 = phi i1 [ 1, %label_67 ], [ 0, %label_68]
%t201 = zext i1 %t182 to i32
%t202 = alloca i32 
store i32 %t201, i32* %t202
%t203 = load i32, i32* %t202
%t204 = trunc i32 %t203 to i1
br i1 %t204, label %label_74, label %label_76
label_74:
%t205 = getelementptr inbounds [14 x i8], [14 x i8]* @.str14, i32 0, i32 0
call void @print(i8* %t205)
br label %label_75
label_76:
%t206 = getelementptr inbounds [15 x i8], [15 x i8]* @.str15, i32 0, i32 0
call void @print(i8* %t206)
br label %label_75
label_75:
%t210 = load i32, i32* %t20
%t211 = load i32, i32* %t22
%t209 = add i32 %t210, %t211
%t213 = load i32, i32* %t24
%t214 = load i32, i32* %t26
%t212 = add i32 %t213, %t214
%t215 = icmp sle i32 %t209, %t212
br i1 %t215, label %label_81, label %label_83
label_81:
%t216 = load i32, i32* %t10
%t217 = load i32, i32* %t12
%t218 = call i32 @equal(i32 %t216, i32 %t217)
%t219 = add i32 0, 0
%t220 = icmp eq i32 %t218, %t219
br i1 %t220, label %label_82, label %label_83
label_82:
br label %label_84
label_83:
br label %label_84
label_84:
%t208 = phi i1 [ 1, %label_82 ], [ 0, %label_83]
br i1 %t208, label %label_77, label %label_79
label_77:
%t222 = load i32, i32* %t14
%t223 = load i32, i32* %t18
%t224 = call i32 @bigger(i32 %t222, i32 %t223)
%t225 = load i32, i32* %t10
%t226 = load i32, i32* %t16
%t227 = call i32 @smaller(i32 %t225, i32 %t226)
%t221 = add i32 %t224, %t227
%t228 = add i32 0, 1
%t229 = icmp eq i32 %t221, %t228
br i1 %t229, label %label_78, label %label_79
label_78:
br label %label_80
label_79:
br label %label_80
label_80:
%t207 = phi i1 [ 1, %label_78 ], [ 0, %label_79]
%t230 = zext i1 %t207 to i32
%t231 = alloca i32 
store i32 %t230, i32* %t231
%t232 = load i32, i32* %t231
%t233 = trunc i32 %t232 to i1
br i1 %t233, label %label_85, label %label_87
label_85:
%t234 = getelementptr inbounds [14 x i8], [14 x i8]* @.str16, i32 0, i32 0
call void @print(i8* %t234)
br label %label_86
label_87:
%t235 = getelementptr inbounds [15 x i8], [15 x i8]* @.str17, i32 0, i32 0
call void @print(i8* %t235)
br label %label_86
label_86:
br label %label_88
label_88:
%t238 = load i32, i32* %t10
%t239 = load i32, i32* %t12
%t237 = add i32 %t238, %t239
%t240 = add i32 0, 25
%t241 = icmp slt i32 %t237, %t240
br i1 %t241, label %label_91, label %label_93
label_91:
%t243 = load i32, i32* %t28
%t244 = load i32, i32* %t30
%t242 = add i32 %t243, %t244
%t245 = add i32 0, 20
%t246 = icmp slt i32 %t242, %t245
br i1 %t246, label %label_92, label %label_93
label_92:
br label %label_94
label_93:
br label %label_94
label_94:
%t236 = phi i1 [ 1, %label_92 ], [ 0, %label_93]
br i1 %t236, label %label_89, label %label_90
label_89:
%t247 = getelementptr inbounds [6 x i8], [6 x i8]* @.str18, i32 0, i32 0
call void @print(i8* %t247)
%t249 = load i32, i32* %t28
%t250 = add i32 0, 2
%t248 = add i32 %t249, %t250
store i32 %t248, i32* %t28
%t251 = load i32, i32* %t28
%t252 = add i32 0, 5
%t253 = icmp sgt i32 %t251, %t252
br i1 %t253, label %label_95, label %label_96
label_95:
br label %label_90
br label %label_96
label_96:
br label %label_88
label_90:
%t255 = load i32, i32* %t20
%t256 = load i32, i32* %t24
%t257 = call i32 @smaller(i32 %t255, i32 %t256)
%t258 = add i32 0, 1
%t259 = icmp eq i32 %t257, %t258
br i1 %t259, label %label_98, label %label_97
label_97:
%t260 = load i32, i32* %t16
%t261 = load i32, i32* %t18
%t262 = call i32 @bigger(i32 %t260, i32 %t261)
%t263 = add i32 0, 1
%t264 = icmp eq i32 %t262, %t263
br i1 %t264, label %label_98, label %label_99
label_98:
br label %label_100
label_99:
br label %label_100
label_100:
%t254 = phi i1 [ 1, %label_98 ], [ 0, %label_99]
%t265 = zext i1 %t254 to i32
%t266 = alloca i32 
store i32 %t265, i32* %t266
%t267 = load i32, i32* %t266
%t268 = trunc i32 %t267 to i1
br i1 %t268, label %label_101, label %label_103
label_101:
%t269 = getelementptr inbounds [14 x i8], [14 x i8]* @.str19, i32 0, i32 0
call void @print(i8* %t269)
br label %label_102
label_103:
%t270 = getelementptr inbounds [15 x i8], [15 x i8]* @.str20, i32 0, i32 0
call void @print(i8* %t270)
br label %label_102
label_102:
%t272 = load i32, i32* %t10
%t273 = load i32, i32* %t14
%t274 = call i32 @equal(i32 %t272, i32 %t273)
%t275 = add i32 0, 1
%t276 = icmp eq i32 %t274, %t275
br i1 %t276, label %label_105, label %label_104
label_104:
%t278 = load i32, i32* %t24
%t279 = load i32, i32* %t26
%t280 = call i32 @bigger(i32 %t278, i32 %t279)
%t281 = add i32 0, 1
%t282 = icmp eq i32 %t280, %t281
br i1 %t282, label %label_108, label %label_110
label_108:
%t284 = load i32, i32* %t28
%t285 = load i32, i32* %t30
%t283 = add i32 %t284, %t285
%t286 = add i32 0, 10
%t287 = icmp sgt i32 %t283, %t286
br i1 %t287, label %label_109, label %label_110
label_109:
br label %label_111
label_110:
br label %label_111
label_111:
%t277 = phi i1 [ 1, %label_109 ], [ 0, %label_110]
br i1 %t277, label %label_105, label %label_106
label_105:
br label %label_107
label_106:
br label %label_107
label_107:
%t271 = phi i1 [ 1, %label_105 ], [ 0, %label_106]
%t288 = zext i1 %t271 to i32
%t289 = alloca i32 
store i32 %t288, i32* %t289
%t290 = load i32, i32* %t289
%t291 = trunc i32 %t290 to i1
br i1 %t291, label %label_112, label %label_114
label_112:
%t292 = getelementptr inbounds [15 x i8], [15 x i8]* @.str21, i32 0, i32 0
call void @print(i8* %t292)
br label %label_113
label_114:
%t293 = getelementptr inbounds [16 x i8], [16 x i8]* @.str22, i32 0, i32 0
call void @print(i8* %t293)
br label %label_113
label_113:
ret void
}
