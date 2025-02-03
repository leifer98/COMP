@.str0 = constant [19 x i8] c"called printAndRet\00"@.str1 = constant [4 x i8] c"a6=\00"@.str2 = constant [4 x i8] c"a9=\00"@.str3 = constant [23 x i8] c"Error division by zero\00"
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
define i32 @zero1() {
%t0 = add i32 0, 0
ret i32 %t0
}
define i8 @zeroB2() {
%t1 = add i8 0, 0
ret i8 %t1
}
define i32 @printAndRet() {
%t2 = getelementptr inbounds [19 x i8], [19 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t2)
%t3 = add i32 0, 1
ret i32 %t3
}
define i32 @foo(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) {
%t4 = getelementptr inbounds [4 x i8], [4 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t4)
call void @printi(i32 %6)
%t5 = getelementptr inbounds [4 x i8], [4 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t5)
call void @printi(i32 %9)
%t6 = add i32 0, 0
ret i32 %t6
}
define i32 @bar(i32, i32) {
%t7 = sub i32 %1, %0
ret i32 %t7
}
define i32 @fu(i32) {
%t9 = add i32 0, 10
%t8 = sub i32 %t9, %0
ret i32 %t8
}
define void @main() {
%t10 = call i32 @zero1()
call void @printi(i32 %t10)
%t11 = call i8 @zeroB2()
%t12 = zext i8 %t11 to i32
call void @printi(i32 %t12)
%t27 = call i32 @zero1()
%t28 = add i32 0, 1
%t26 = add i32 %t27, %t28
%t29 = add i32 0, 2
%t25 = add i32 %t26, %t29
%t30 = add i32 0, 3
%t24 = add i32 %t25, %t30
%t31 = add i32 0, 4
%t23 = add i32 %t24, %t31
%t32 = add i32 0, 5
%t22 = add i32 %t23, %t32
%t33 = add i32 0, 6
%t21 = add i32 %t22, %t33
%t34 = add i32 0, 7
%t20 = add i32 %t21, %t34
%t35 = add i32 0, 8
%t19 = add i32 %t20, %t35
%t36 = add i32 0, 10
%t18 = add i32 %t19, %t36
%t37 = add i32 0, 10
%t17 = add i32 %t18, %t37
%t38 = add i32 0, 11
%t16 = add i32 %t17, %t38
%t39 = add i32 0, 12
%t15 = add i32 %t16, %t39
%t40 = add i32 0, 13
%t14 = add i32 %t15, %t40
%t41 = call i8 @zeroB2()
%t42 = zext i8 %t41 to i32
%t13 = add i32 %t14, %t42
call void @printi(i32 %t13)
%t44 = call i32 @zero1()
%t46 = add i32 0, 1
%t48 = add i32 0, 2
%t50 = add i32 0, 3
%t52 = add i32 0, 4
%t54 = add i32 0, 5
%t56 = add i32 0, 6
%t58 = add i32 0, 7
%t60 = add i32 0, 11
%t62 = add i32 0, 9
%t64 = add i32 0, 10
%t66 = add i32 0, 11
%t68 = add i32 0, 12
%t70 = add i32 0, 13
%t71 = call i8 @zeroB2()
%t72 = zext i8 %t71 to i32
%t69 = add i32 %t70, %t72
%t67 = add i32 %t68, %t69
%t65 = add i32 %t66, %t67
%t63 = add i32 %t64, %t65
%t61 = add i32 %t62, %t63
%t59 = add i32 %t60, %t61
%t57 = add i32 %t58, %t59
%t55 = add i32 %t56, %t57
%t53 = add i32 %t54, %t55
%t51 = add i32 %t52, %t53
%t49 = add i32 %t50, %t51
%t47 = add i32 %t48, %t49
%t45 = add i32 %t46, %t47
%t43 = add i32 %t44, %t45
call void @printi(i32 %t43)
%t87 = call i32 @zero1()
%t88 = add i32 0, 1
%t86 = add i32 %t87, %t88
%t89 = add i32 0, 2
%t85 = add i32 %t86, %t89
%t90 = add i32 0, 3
%t84 = add i32 %t85, %t90
%t91 = add i32 0, 4
%t83 = add i32 %t84, %t91
%t92 = add i32 0, 5
%t82 = add i32 %t83, %t92
%t93 = add i32 0, 6
%t81 = add i32 %t82, %t93
%t94 = add i32 0, 7
%t80 = add i32 %t81, %t94
%t95 = add i32 0, 8
%t79 = add i32 %t80, %t95
%t96 = add i32 0, 9
%t78 = add i32 %t79, %t96
%t97 = add i32 0, 10
%t77 = add i32 %t78, %t97
%t98 = add i32 0, 11
%t76 = add i32 %t77, %t98
%t99 = add i32 0, 12
%t75 = add i32 %t76, %t99
%t100 = add i32 0, 78
%t74 = add i32 %t75, %t100
%t101 = call i8 @zeroB2()
%t102 = zext i8 %t101 to i32
%t73 = add i32 %t74, %t102
call void @printi(i32 %t73)
%t103 = call i32 @printAndRet()
%t106 = call i32 @zero1()
%t107 = call i32 @zero1()
%t105 = add i32 %t106, %t107
%t108 = call i8 @zeroB2()
%t109 = zext i8 %t108 to i32
%t104 = add i32 %t105, %t109
call void @printi(i32 %t104)
%t110 = call i32 @printAndRet()
call void @printi(i32 %t110)
%t111 = add i32 0, 0
%t112 = add i32 0, 1
%t113 = add i32 0, 2
%t114 = add i32 0, 3
%t115 = add i32 0, 4
%t116 = add i32 0, 5
%t117 = add i32 0, 6
%t118 = add i32 0, 7
%t119 = add i32 0, 8
%t120 = add i32 0, 9
%t121 = call i32 @foo(i32 %t111, i32 %t112, i32 %t113, i32 %t114, i32 %t115, i32 %t116, i32 %t117, i32 %t118, i32 %t119, i32 %t120)
%t122 = add i32 0, 0
%t124 = add i32 0, 1
%t125 = add i32 0, 4
%t126 = add i32 0, 19
%t127 = call i32 @bar(i32 %t125, i32 %t126)
%t123 = add i32 %t124, %t127
%t129 = add i32 0, 2
%t130 = add i32 0, 19
%t128 = mul i32 %t129, %t130
%t131 = add i32 0, 3
%t132 = add i32 0, 4
%t133 = add i32 0, 5
%t135 = add i32 0, 6
%t137 = add i32 0, 2
%t138 = add i32 0, 3
%t139 = call i32 @bar(i32 %t137, i32 %t138)
%t140 = add i32 0, 0
%t141 = call i32 @fu(i32 %t140)
%t142 = icmp eq i32 %t141, 0
br i1 %t142, label %label_0, label %label_1
label_0:
%t143 = getelementptr inbounds [23 x i8], [23 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t143)
call void @exit(i32 1)
br label %label_1
label_1:
%t136 = sdiv i32 %t139, %t141
%t134 = add i32 %t135, %t136
%t144 = add i32 0, 7
%t145 = add i32 0, 8
%t147 = add i32 0, 9
%t148 = add i32 0, 20
%t149 = call i32 @fu(i32 %t148)
%t146 = sub i32 %t147, %t149
%t150 = call i32 @foo(i32 %t122, i32 %t123, i32 %t128, i32 %t131, i32 %t132, i32 %t133, i32 %t134, i32 %t144, i32 %t145, i32 %t146)
ret void
}
