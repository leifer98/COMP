
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
%t0 = add i32 0, 0
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = add i32 0, 1
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = add i32 0, 2
%t5 = alloca i32 
store i32 %t4, i32* %t5
%t6 = add i32 0, 3
%t7 = alloca i32 
store i32 %t6, i32* %t7
%t8 = add i32 0, 4
%t9 = alloca i32 
store i32 %t8, i32* %t9
%t10 = add i32 0, 5
%t11 = alloca i32 
store i32 %t10, i32* %t11
%t12 = add i32 0, 6
%t13 = alloca i32 
store i32 %t12, i32* %t13
%t14 = add i32 0, 7
%t15 = alloca i32 
store i32 %t14, i32* %t15
%t16 = add i32 0, 8
%t17 = alloca i32 
store i32 %t16, i32* %t17
%t18 = add i32 0, 9
%t19 = alloca i32 
store i32 %t18, i32* %t19
%t20 = add i32 0, 10
%t21 = alloca i32 
store i32 %t20, i32* %t21
%t22 = add i32 0, 11
%t23 = alloca i32 
store i32 %t22, i32* %t23
%t24 = add i32 0, 12
%t25 = alloca i32 
store i32 %t24, i32* %t25
%t26 = add i32 0, 13
%t27 = alloca i32 
store i32 %t26, i32* %t27
%t28 = add i32 0, 14
%t29 = alloca i32 
store i32 %t28, i32* %t29
%t30 = add i32 0, 15
%t31 = alloca i32 
store i32 %t30, i32* %t31
%t32 = add i32 0, 16
%t33 = alloca i32 
store i32 %t32, i32* %t33
%t34 = add i32 0, 17
%t35 = alloca i32 
store i32 %t34, i32* %t35
%t36 = add i32 0, 18
%t37 = alloca i32 
store i32 %t36, i32* %t37
%t38 = add i32 0, 19
%t39 = alloca i32 
store i32 %t38, i32* %t39
%t40 = add i32 0, 20
%t41 = alloca i32 
store i32 %t40, i32* %t41
%t42 = add i32 0, 21
%t43 = alloca i32 
store i32 %t42, i32* %t43
%t44 = add i32 0, 22
%t45 = alloca i32 
store i32 %t44, i32* %t45
%t46 = add i32 0, 23
%t47 = alloca i32 
store i32 %t46, i32* %t47
%t48 = add i32 0, 24
%t49 = alloca i32 
store i32 %t48, i32* %t49
%t50 = add i32 0, 25
%t51 = alloca i32 
store i32 %t50, i32* %t51
%t52 = add i32 0, 26
%t53 = alloca i32 
store i32 %t52, i32* %t53
%t54 = add i32 0, 27
%t55 = alloca i32 
store i32 %t54, i32* %t55
%t56 = add i32 0, 28
%t57 = alloca i32 
store i32 %t56, i32* %t57
%t58 = add i32 0, 29
%t59 = alloca i32 
store i32 %t58, i32* %t59
%t60 = add i32 0, 30
%t61 = alloca i32 
store i32 %t60, i32* %t61
%t62 = add i32 0, 31
%t63 = alloca i32 
store i32 %t62, i32* %t63
%t64 = add i32 0, 32
%t65 = alloca i32 
store i32 %t64, i32* %t65
%t66 = add i32 0, 33
%t67 = alloca i32 
store i32 %t66, i32* %t67
%t68 = add i32 0, 34
%t69 = alloca i32 
store i32 %t68, i32* %t69
%t70 = add i32 0, 35
%t71 = alloca i32 
store i32 %t70, i32* %t71
%t72 = add i32 0, 36
%t73 = alloca i32 
store i32 %t72, i32* %t73
%t74 = add i32 0, 37
%t75 = alloca i32 
store i32 %t74, i32* %t75
%t76 = add i32 0, 38
%t77 = alloca i32 
store i32 %t76, i32* %t77
%t78 = add i32 0, 39
%t79 = alloca i32 
store i32 %t78, i32* %t79
%t80 = add i32 0, 40
%t81 = alloca i32 
store i32 %t80, i32* %t81
%t82 = add i32 0, 41
%t83 = alloca i32 
store i32 %t82, i32* %t83
%t84 = add i32 0, 42
%t85 = alloca i32 
store i32 %t84, i32* %t85
%t86 = add i32 0, 43
%t87 = alloca i32 
store i32 %t86, i32* %t87
%t88 = add i32 0, 44
%t89 = alloca i32 
store i32 %t88, i32* %t89
%t90 = add i32 0, 45
%t91 = alloca i32 
store i32 %t90, i32* %t91
%t92 = add i32 0, 46
%t93 = alloca i32 
store i32 %t92, i32* %t93
%t94 = add i32 0, 47
%t95 = alloca i32 
store i32 %t94, i32* %t95
%t96 = add i32 0, 48
%t97 = alloca i32 
store i32 %t96, i32* %t97
%t146 = load i32, i32* %t1
%t147 = load i32, i32* %t3
%t145 = add i32 %t146, %t147
%t148 = load i32, i32* %t5
%t144 = add i32 %t145, %t148
%t149 = load i32, i32* %t7
%t143 = add i32 %t144, %t149
%t150 = load i32, i32* %t9
%t142 = add i32 %t143, %t150
%t151 = load i32, i32* %t11
%t141 = add i32 %t142, %t151
%t152 = load i32, i32* %t13
%t140 = add i32 %t141, %t152
%t153 = load i32, i32* %t15
%t139 = add i32 %t140, %t153
%t154 = load i32, i32* %t17
%t138 = add i32 %t139, %t154
%t155 = load i32, i32* %t19
%t137 = add i32 %t138, %t155
%t156 = load i32, i32* %t21
%t136 = add i32 %t137, %t156
%t157 = load i32, i32* %t23
%t135 = add i32 %t136, %t157
%t158 = load i32, i32* %t25
%t134 = add i32 %t135, %t158
%t159 = load i32, i32* %t27
%t133 = add i32 %t134, %t159
%t160 = load i32, i32* %t29
%t132 = add i32 %t133, %t160
%t161 = load i32, i32* %t31
%t131 = add i32 %t132, %t161
%t162 = load i32, i32* %t33
%t130 = add i32 %t131, %t162
%t163 = load i32, i32* %t35
%t129 = add i32 %t130, %t163
%t164 = load i32, i32* %t37
%t128 = add i32 %t129, %t164
%t165 = load i32, i32* %t39
%t127 = add i32 %t128, %t165
%t166 = load i32, i32* %t41
%t126 = add i32 %t127, %t166
%t167 = load i32, i32* %t43
%t125 = add i32 %t126, %t167
%t168 = load i32, i32* %t45
%t124 = add i32 %t125, %t168
%t169 = load i32, i32* %t47
%t123 = add i32 %t124, %t169
%t170 = load i32, i32* %t49
%t122 = add i32 %t123, %t170
%t171 = load i32, i32* %t51
%t121 = add i32 %t122, %t171
%t172 = load i32, i32* %t53
%t120 = add i32 %t121, %t172
%t173 = load i32, i32* %t55
%t119 = add i32 %t120, %t173
%t174 = load i32, i32* %t57
%t118 = add i32 %t119, %t174
%t175 = load i32, i32* %t59
%t117 = add i32 %t118, %t175
%t176 = load i32, i32* %t61
%t116 = add i32 %t117, %t176
%t177 = load i32, i32* %t63
%t115 = add i32 %t116, %t177
%t178 = load i32, i32* %t65
%t114 = add i32 %t115, %t178
%t179 = load i32, i32* %t67
%t113 = add i32 %t114, %t179
%t180 = load i32, i32* %t69
%t112 = add i32 %t113, %t180
%t181 = load i32, i32* %t71
%t111 = add i32 %t112, %t181
%t182 = load i32, i32* %t73
%t110 = add i32 %t111, %t182
%t183 = load i32, i32* %t75
%t109 = add i32 %t110, %t183
%t184 = load i32, i32* %t77
%t108 = add i32 %t109, %t184
%t185 = load i32, i32* %t79
%t107 = add i32 %t108, %t185
%t186 = load i32, i32* %t81
%t106 = add i32 %t107, %t186
%t187 = load i32, i32* %t83
%t105 = add i32 %t106, %t187
%t188 = load i32, i32* %t85
%t104 = add i32 %t105, %t188
%t189 = load i32, i32* %t87
%t103 = add i32 %t104, %t189
%t190 = load i32, i32* %t89
%t102 = add i32 %t103, %t190
%t191 = load i32, i32* %t91
%t101 = add i32 %t102, %t191
%t192 = load i32, i32* %t93
%t100 = add i32 %t101, %t192
%t193 = load i32, i32* %t95
%t99 = add i32 %t100, %t193
%t194 = load i32, i32* %t97
%t98 = add i32 %t99, %t194
%t195 = alloca i32 
store i32 %t98, i32* %t195
%t196 = load i32, i32* %t195
call void @printi(i32 %t196)
ret void
}
