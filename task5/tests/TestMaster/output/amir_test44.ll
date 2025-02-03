
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
%t0 = add i32 0, 1
%t1 = alloca i32 
store i32 %t0, i32* %t1
%t2 = add i32 0, 2
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = add i32 0, 3
%t5 = alloca i32 
store i32 %t4, i32* %t5
%t6 = add i32 0, 4
%t7 = alloca i32 
store i32 %t6, i32* %t7
%t8 = add i32 0, 5
%t9 = alloca i32 
store i32 %t8, i32* %t9
%t10 = add i32 0, 6
%t11 = alloca i32 
store i32 %t10, i32* %t11
%t12 = add i32 0, 7
%t13 = alloca i32 
store i32 %t12, i32* %t13
%t14 = add i32 0, 8
%t15 = alloca i32 
store i32 %t14, i32* %t15
%t16 = add i32 0, 9
%t17 = alloca i32 
store i32 %t16, i32* %t17
%t18 = add i32 0, 10
%t19 = alloca i32 
store i32 %t18, i32* %t19
%t20 = add i32 0, 11
%t21 = alloca i32 
store i32 %t20, i32* %t21
%t22 = add i32 0, 12
%t23 = alloca i32 
store i32 %t22, i32* %t23
%t24 = add i32 0, 13
%t25 = alloca i32 
store i32 %t24, i32* %t25
%t26 = add i32 0, 14
%t27 = alloca i32 
store i32 %t26, i32* %t27
%t28 = add i32 0, 15
%t29 = alloca i32 
store i32 %t28, i32* %t29
%t30 = add i32 0, 16
%t31 = alloca i32 
store i32 %t30, i32* %t31
%t32 = add i32 0, 17
%t33 = alloca i32 
store i32 %t32, i32* %t33
%t34 = add i32 0, 18
%t35 = alloca i32 
store i32 %t34, i32* %t35
%t36 = add i32 0, 19
%t37 = alloca i32 
store i32 %t36, i32* %t37
%t38 = add i32 0, 20
%t39 = alloca i32 
store i32 %t38, i32* %t39
%t40 = add i32 0, 21
%t41 = alloca i32 
store i32 %t40, i32* %t41
%t42 = add i32 0, 22
%t43 = alloca i32 
store i32 %t42, i32* %t43
%t44 = add i32 0, 23
%t45 = alloca i32 
store i32 %t44, i32* %t45
%t46 = add i32 0, 24
%t47 = alloca i32 
store i32 %t46, i32* %t47
%t48 = add i32 0, 25
%t49 = alloca i32 
store i32 %t48, i32* %t49
%t50 = add i32 0, 26
%t51 = alloca i32 
store i32 %t50, i32* %t51
%t52 = add i32 0, 27
%t53 = alloca i32 
store i32 %t52, i32* %t53
%t54 = add i32 0, 28
%t55 = alloca i32 
store i32 %t54, i32* %t55
%t56 = add i32 0, 29
%t57 = alloca i32 
store i32 %t56, i32* %t57
%t58 = add i32 0, 30
%t59 = alloca i32 
store i32 %t58, i32* %t59
%t60 = add i32 0, 31
%t61 = alloca i32 
store i32 %t60, i32* %t61
%t62 = add i32 0, 32
%t63 = alloca i32 
store i32 %t62, i32* %t63
%t64 = add i32 0, 33
%t65 = alloca i32 
store i32 %t64, i32* %t65
%t66 = add i32 0, 34
%t67 = alloca i32 
store i32 %t66, i32* %t67
%t68 = add i32 0, 35
%t69 = alloca i32 
store i32 %t68, i32* %t69
%t70 = add i32 0, 36
%t71 = alloca i32 
store i32 %t70, i32* %t71
%t72 = add i32 0, 37
%t73 = alloca i32 
store i32 %t72, i32* %t73
%t74 = add i32 0, 38
%t75 = alloca i32 
store i32 %t74, i32* %t75
%t76 = add i32 0, 39
%t77 = alloca i32 
store i32 %t76, i32* %t77
%t78 = add i32 0, 40
%t79 = alloca i32 
store i32 %t78, i32* %t79
%t80 = add i32 0, 41
%t81 = alloca i32 
store i32 %t80, i32* %t81
%t82 = add i32 0, 42
%t83 = alloca i32 
store i32 %t82, i32* %t83
%t84 = add i32 0, 43
%t85 = alloca i32 
store i32 %t84, i32* %t85
%t86 = add i32 0, 44
%t87 = alloca i32 
store i32 %t86, i32* %t87
%t88 = add i32 0, 45
%t89 = alloca i32 
store i32 %t88, i32* %t89
%t90 = add i32 0, 46
%t91 = alloca i32 
store i32 %t90, i32* %t91
%t92 = add i32 0, 47
%t93 = alloca i32 
store i32 %t92, i32* %t93
%t94 = add i32 0, 48
%t95 = alloca i32 
store i32 %t94, i32* %t95
%t96 = add i32 0, 49
%t97 = alloca i32 
store i32 %t96, i32* %t97
%t98 = add i32 0, 50
%t99 = alloca i32 
store i32 %t98, i32* %t99
%t100 = load i32, i32* %t1
call void @printi(i32 %t100)
%t101 = load i32, i32* %t3
call void @printi(i32 %t101)
%t102 = load i32, i32* %t5
call void @printi(i32 %t102)
%t103 = load i32, i32* %t7
call void @printi(i32 %t103)
%t104 = load i32, i32* %t9
call void @printi(i32 %t104)
%t105 = load i32, i32* %t11
call void @printi(i32 %t105)
%t106 = load i32, i32* %t13
call void @printi(i32 %t106)
%t107 = load i32, i32* %t15
call void @printi(i32 %t107)
%t108 = load i32, i32* %t17
call void @printi(i32 %t108)
%t109 = load i32, i32* %t19
call void @printi(i32 %t109)
%t110 = load i32, i32* %t21
call void @printi(i32 %t110)
%t111 = load i32, i32* %t23
call void @printi(i32 %t111)
%t112 = load i32, i32* %t25
call void @printi(i32 %t112)
%t113 = load i32, i32* %t27
call void @printi(i32 %t113)
%t114 = load i32, i32* %t29
call void @printi(i32 %t114)
%t115 = load i32, i32* %t31
call void @printi(i32 %t115)
%t116 = load i32, i32* %t33
call void @printi(i32 %t116)
%t117 = load i32, i32* %t35
call void @printi(i32 %t117)
%t118 = load i32, i32* %t37
call void @printi(i32 %t118)
%t119 = load i32, i32* %t39
call void @printi(i32 %t119)
%t120 = load i32, i32* %t41
call void @printi(i32 %t120)
%t121 = load i32, i32* %t43
call void @printi(i32 %t121)
%t122 = load i32, i32* %t45
call void @printi(i32 %t122)
%t123 = load i32, i32* %t47
call void @printi(i32 %t123)
%t124 = load i32, i32* %t49
call void @printi(i32 %t124)
%t125 = load i32, i32* %t51
call void @printi(i32 %t125)
%t126 = load i32, i32* %t53
call void @printi(i32 %t126)
%t127 = load i32, i32* %t55
call void @printi(i32 %t127)
%t128 = load i32, i32* %t57
call void @printi(i32 %t128)
%t129 = load i32, i32* %t59
call void @printi(i32 %t129)
%t130 = load i32, i32* %t61
call void @printi(i32 %t130)
%t131 = load i32, i32* %t63
call void @printi(i32 %t131)
%t132 = load i32, i32* %t65
call void @printi(i32 %t132)
%t133 = load i32, i32* %t67
call void @printi(i32 %t133)
%t134 = load i32, i32* %t69
call void @printi(i32 %t134)
%t135 = load i32, i32* %t71
call void @printi(i32 %t135)
%t136 = load i32, i32* %t73
call void @printi(i32 %t136)
%t137 = load i32, i32* %t75
call void @printi(i32 %t137)
%t138 = load i32, i32* %t77
call void @printi(i32 %t138)
%t139 = load i32, i32* %t79
call void @printi(i32 %t139)
%t140 = load i32, i32* %t81
call void @printi(i32 %t140)
%t141 = load i32, i32* %t83
call void @printi(i32 %t141)
%t142 = load i32, i32* %t85
call void @printi(i32 %t142)
%t143 = load i32, i32* %t87
call void @printi(i32 %t143)
%t144 = load i32, i32* %t89
call void @printi(i32 %t144)
%t145 = load i32, i32* %t91
call void @printi(i32 %t145)
%t146 = load i32, i32* %t93
call void @printi(i32 %t146)
%t147 = load i32, i32* %t95
call void @printi(i32 %t147)
%t148 = load i32, i32* %t97
call void @printi(i32 %t148)
%t149 = load i32, i32* %t99
call void @printi(i32 %t149)
ret void
}
