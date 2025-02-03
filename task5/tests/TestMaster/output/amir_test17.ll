@.str0 = constant [29 x i8] c"Player 1, enter any number: \00"@.str1 = constant [23 x i8] c"Error division by zero\00"@.str2 = constant [38 x i8] c"Player 2, enter a number larger than \00"@.str3 = constant [36 x i8] c" with the same number of divisors: \00"@.str4 = constant [23 x i8] c"Error division by zero\00"@.str5 = constant [16 x i8] c"Player 2 loses!\00"@.str6 = constant [38 x i8] c"Player 1, enter a number larger than \00"@.str7 = constant [36 x i8] c" with the same number of divisors: \00"@.str8 = constant [23 x i8] c"Error division by zero\00"@.str9 = constant [16 x i8] c"Player 1 loses!\00"@.str10 = constant [19 x i8] c"Player 1 divisors:\00"@.str11 = constant [19 x i8] c"Player 2 divisors:\00"
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
%t0 = alloca i32 
store i32 0, i32* %t0
%t1 = alloca i32 
store i32 0, i32* %t1
%t2 = add i32 0, 0
%t3 = alloca i32 
store i32 %t2, i32* %t3
%t4 = load i32, i32* %t3
%t5 = add i32 0, 0
%t6 = icmp eq i32 %t4, %t5
br i1 %t6, label %label_0, label %label_1
label_0:
%t7 = add i32 0, 97
store i32 %t7, i32* %t0
br label %label_1
label_1:
%t8 = getelementptr inbounds [29 x i8], [29 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t8)
%t9 = load i32, i32* %t0
call void @printi(i32 %t9)
%t10 = add i32 0, 0
%t11 = alloca i32 
store i32 %t10, i32* %t11
%t12 = add i32 0, 0
%t13 = alloca i32 
store i32 %t12, i32* %t13
%t14 = add i32 0, 2
%t15 = alloca i32 
store i32 %t14, i32* %t15
br label %label_2
label_2:
%t16 = add i1 0, 1
br i1 %t16, label %label_3, label %label_4
label_3:
%t17 = add i32 0, 1
%t18 = alloca i32 
store i32 %t17, i32* %t18
br label %label_5
label_5:
%t19 = load i32, i32* %t18
%t20 = load i32, i32* %t0
%t21 = icmp sle i32 %t19, %t20
br i1 %t21, label %label_6, label %label_7
label_6:
%t24 = load i32, i32* %t0
%t25 = load i32, i32* %t18
%t26 = icmp eq i32 %t25, 0
br i1 %t26, label %label_10, label %label_11
label_10:
%t27 = getelementptr inbounds [23 x i8], [23 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t27)
call void @exit(i32 1)
br label %label_11
label_11:
%t23 = sdiv i32 %t24, %t25
%t28 = load i32, i32* %t18
%t22 = mul i32 %t23, %t28
%t29 = load i32, i32* %t0
%t30 = icmp eq i32 %t22, %t29
br i1 %t30, label %label_8, label %label_9
label_8:
%t32 = load i32, i32* %t11
%t33 = add i32 0, 1
%t31 = add i32 %t32, %t33
store i32 %t31, i32* %t11
br label %label_9
label_9:
%t35 = load i32, i32* %t18
%t36 = add i32 0, 1
%t34 = add i32 %t35, %t36
store i32 %t34, i32* %t18
br label %label_5
label_7:
%t37 = load i32, i32* %t15
%t38 = add i32 0, 2
%t39 = icmp eq i32 %t37, %t38
br i1 %t39, label %label_12, label %label_14
label_12:
%t41 = load i32, i32* %t3
%t42 = add i32 0, 1
%t40 = add i32 %t41, %t42
store i32 %t40, i32* %t3
%t43 = load i32, i32* %t3
%t44 = add i32 0, 1
%t45 = icmp eq i32 %t43, %t44
br i1 %t45, label %label_15, label %label_16
label_15:
%t46 = add i32 0, 123
store i32 %t46, i32* %t1
br label %label_16
label_16:
%t47 = getelementptr inbounds [38 x i8], [38 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t47)
%t48 = load i32, i32* %t0
call void @printi(i32 %t48)
%t49 = getelementptr inbounds [36 x i8], [36 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t49)
%t50 = load i32, i32* %t1
call void @printi(i32 %t50)
%t51 = add i32 0, 0
store i32 %t51, i32* %t13
%t52 = add i32 0, 1
%t53 = alloca i32 
store i32 %t52, i32* %t53
br label %label_17
label_17:
%t54 = load i32, i32* %t53
%t55 = load i32, i32* %t1
%t56 = icmp sle i32 %t54, %t55
br i1 %t56, label %label_18, label %label_19
label_18:
%t59 = load i32, i32* %t1
%t60 = load i32, i32* %t53
%t61 = icmp eq i32 %t60, 0
br i1 %t61, label %label_22, label %label_23
label_22:
%t62 = getelementptr inbounds [23 x i8], [23 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t62)
call void @exit(i32 1)
br label %label_23
label_23:
%t58 = sdiv i32 %t59, %t60
%t63 = load i32, i32* %t53
%t57 = mul i32 %t58, %t63
%t64 = load i32, i32* %t1
%t65 = icmp eq i32 %t57, %t64
br i1 %t65, label %label_20, label %label_21
label_20:
%t67 = load i32, i32* %t13
%t68 = add i32 0, 1
%t66 = add i32 %t67, %t68
store i32 %t66, i32* %t13
br label %label_21
label_21:
%t70 = load i32, i32* %t53
%t71 = add i32 0, 1
%t69 = add i32 %t70, %t71
store i32 %t69, i32* %t53
br label %label_17
label_19:
%t73 = load i32, i32* %t1
%t74 = load i32, i32* %t0
%t75 = icmp sle i32 %t73, %t74
br i1 %t75, label %label_27, label %label_26
label_26:
%t76 = load i32, i32* %t11
%t77 = load i32, i32* %t13
%t78 = icmp ne i32 %t76, %t77
br i1 %t78, label %label_27, label %label_28
label_27:
br label %label_29
label_28:
br label %label_29
label_29:
%t72 = phi i1 [ 1, %label_27 ], [ 0, %label_28]
br i1 %t72, label %label_24, label %label_25
label_24:
%t79 = getelementptr inbounds [16 x i8], [16 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t79)
br label %label_4
br label %label_25
label_25:
br label %label_13
label_14:
%t80 = getelementptr inbounds [38 x i8], [38 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t80)
%t81 = load i32, i32* %t1
call void @printi(i32 %t81)
%t82 = getelementptr inbounds [36 x i8], [36 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t82)
%t83 = load i32, i32* %t0
call void @printi(i32 %t83)
%t84 = add i32 0, 0
store i32 %t84, i32* %t11
%t85 = add i32 0, 1
%t86 = alloca i32 
store i32 %t85, i32* %t86
br label %label_30
label_30:
%t87 = load i32, i32* %t86
%t88 = load i32, i32* %t0
%t89 = icmp sle i32 %t87, %t88
br i1 %t89, label %label_31, label %label_32
label_31:
%t92 = load i32, i32* %t0
%t93 = load i32, i32* %t86
%t94 = icmp eq i32 %t93, 0
br i1 %t94, label %label_35, label %label_36
label_35:
%t95 = getelementptr inbounds [23 x i8], [23 x i8]* @.str8, i32 0, i32 0
call void @print(i8* %t95)
call void @exit(i32 1)
br label %label_36
label_36:
%t91 = sdiv i32 %t92, %t93
%t96 = load i32, i32* %t86
%t90 = mul i32 %t91, %t96
%t97 = load i32, i32* %t0
%t98 = icmp eq i32 %t90, %t97
br i1 %t98, label %label_33, label %label_34
label_33:
%t100 = load i32, i32* %t11
%t101 = add i32 0, 1
%t99 = add i32 %t100, %t101
store i32 %t99, i32* %t11
br label %label_34
label_34:
%t103 = load i32, i32* %t86
%t104 = add i32 0, 1
%t102 = add i32 %t103, %t104
store i32 %t102, i32* %t86
br label %label_30
label_32:
%t106 = load i32, i32* %t0
%t107 = load i32, i32* %t1
%t108 = icmp sle i32 %t106, %t107
br i1 %t108, label %label_40, label %label_39
label_39:
%t109 = load i32, i32* %t11
%t110 = load i32, i32* %t13
%t111 = icmp ne i32 %t109, %t110
br i1 %t111, label %label_40, label %label_41
label_40:
br label %label_42
label_41:
br label %label_42
label_42:
%t105 = phi i1 [ 1, %label_40 ], [ 0, %label_41]
br i1 %t105, label %label_37, label %label_38
label_37:
%t112 = getelementptr inbounds [16 x i8], [16 x i8]* @.str9, i32 0, i32 0
call void @print(i8* %t112)
br label %label_4
br label %label_38
label_38:
br label %label_13
label_13:
%t114 = add i32 0, 3
%t115 = load i32, i32* %t15
%t113 = sub i32 %t114, %t115
store i32 %t113, i32* %t15
br label %label_2
label_4:
%t116 = getelementptr inbounds [19 x i8], [19 x i8]* @.str10, i32 0, i32 0
call void @print(i8* %t116)
%t117 = load i32, i32* %t11
call void @printi(i32 %t117)
%t118 = getelementptr inbounds [19 x i8], [19 x i8]* @.str11, i32 0, i32 0
call void @print(i8* %t118)
%t119 = load i32, i32* %t13
call void @printi(i32 %t119)
ret void
}
