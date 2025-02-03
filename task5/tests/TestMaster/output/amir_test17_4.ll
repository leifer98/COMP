@.str0 = constant [29 x i8] c"Player 1, enter any number: \00"@.str1 = constant [23 x i8] c"Error division by zero\00"@.str2 = constant [75 x i8] c"Player 2, enter a number larger than %d with the same number of divisors: \00"@.str3 = constant [23 x i8] c"Error division by zero\00"@.str4 = constant [16 x i8] c"Player 2 loses!\00"@.str5 = constant [75 x i8] c"Player 1, enter a number larger than %d with the same number of divisors: \00"@.str6 = constant [23 x i8] c"Error division by zero\00"@.str7 = constant [16 x i8] c"Player 1 loses!\00"@.str8 = constant [19 x i8] c"Player 1 divisors:\00"@.str9 = constant [19 x i8] c"Player 2 divisors:\00"
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
%t4 = add i32 0, 50
store i32 %t4, i32* %t0
%t5 = getelementptr inbounds [29 x i8], [29 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t5)
%t6 = load i32, i32* %t0
call void @printi(i32 %t6)
%t7 = add i32 0, 0
%t8 = alloca i32 
store i32 %t7, i32* %t8
%t9 = add i32 0, 0
%t10 = alloca i32 
store i32 %t9, i32* %t10
%t11 = add i32 0, 2
%t12 = alloca i32 
store i32 %t11, i32* %t12
br label %label_0
label_0:
%t13 = add i1 0, 1
br i1 %t13, label %label_1, label %label_2
label_1:
%t14 = add i32 0, 1
%t15 = alloca i32 
store i32 %t14, i32* %t15
br label %label_3
label_3:
%t16 = load i32, i32* %t15
%t17 = load i32, i32* %t0
%t18 = icmp sle i32 %t16, %t17
br i1 %t18, label %label_4, label %label_5
label_4:
%t21 = load i32, i32* %t0
%t22 = load i32, i32* %t15
%t23 = icmp eq i32 %t22, 0
br i1 %t23, label %label_8, label %label_9
label_8:
%t24 = getelementptr inbounds [23 x i8], [23 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t24)
call void @exit(i32 1)
br label %label_9
label_9:
%t20 = sdiv i32 %t21, %t22
%t25 = load i32, i32* %t15
%t19 = mul i32 %t20, %t25
%t26 = load i32, i32* %t0
%t27 = icmp eq i32 %t19, %t26
br i1 %t27, label %label_6, label %label_7
label_6:
%t29 = load i32, i32* %t8
%t30 = add i32 0, 1
%t28 = add i32 %t29, %t30
store i32 %t28, i32* %t8
br label %label_7
label_7:
%t32 = load i32, i32* %t15
%t33 = add i32 0, 1
%t31 = add i32 %t32, %t33
store i32 %t31, i32* %t15
br label %label_3
label_5:
%t34 = load i32, i32* %t12
%t35 = add i32 0, 2
%t36 = icmp eq i32 %t34, %t35
br i1 %t36, label %label_10, label %label_12
label_10:
%t37 = load i32, i32* %t3
%t38 = add i32 0, 0
%t39 = icmp eq i32 %t37, %t38
br i1 %t39, label %label_13, label %label_14
label_13:
%t40 = add i32 0, 98
store i32 %t40, i32* %t1
br label %label_14
label_14:
%t41 = getelementptr inbounds [75 x i8], [75 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t41)
%t42 = load i32, i32* %t1
call void @printi(i32 %t42)
%t43 = add i32 0, 0
store i32 %t43, i32* %t10
%t44 = add i32 0, 1
%t45 = alloca i32 
store i32 %t44, i32* %t45
br label %label_15
label_15:
%t46 = load i32, i32* %t45
%t47 = load i32, i32* %t1
%t48 = icmp sle i32 %t46, %t47
br i1 %t48, label %label_16, label %label_17
label_16:
%t51 = load i32, i32* %t1
%t52 = load i32, i32* %t45
%t53 = icmp eq i32 %t52, 0
br i1 %t53, label %label_20, label %label_21
label_20:
%t54 = getelementptr inbounds [23 x i8], [23 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t54)
call void @exit(i32 1)
br label %label_21
label_21:
%t50 = sdiv i32 %t51, %t52
%t55 = load i32, i32* %t45
%t49 = mul i32 %t50, %t55
%t56 = load i32, i32* %t1
%t57 = icmp eq i32 %t49, %t56
br i1 %t57, label %label_18, label %label_19
label_18:
%t59 = load i32, i32* %t10
%t60 = add i32 0, 1
%t58 = add i32 %t59, %t60
store i32 %t58, i32* %t10
br label %label_19
label_19:
%t62 = load i32, i32* %t45
%t63 = add i32 0, 1
%t61 = add i32 %t62, %t63
store i32 %t61, i32* %t45
br label %label_15
label_17:
%t65 = load i32, i32* %t1
%t66 = load i32, i32* %t0
%t67 = icmp sle i32 %t65, %t66
br i1 %t67, label %label_25, label %label_24
label_24:
%t68 = load i32, i32* %t8
%t69 = load i32, i32* %t10
%t70 = icmp ne i32 %t68, %t69
br i1 %t70, label %label_25, label %label_26
label_25:
br label %label_27
label_26:
br label %label_27
label_27:
%t64 = phi i1 [ 1, %label_25 ], [ 0, %label_26]
br i1 %t64, label %label_22, label %label_23
label_22:
%t71 = getelementptr inbounds [16 x i8], [16 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t71)
br label %label_2
br label %label_23
label_23:
%t73 = load i32, i32* %t3
%t74 = add i32 0, 1
%t72 = add i32 %t73, %t74
store i32 %t72, i32* %t3
br label %label_11
label_12:
%t75 = load i32, i32* %t3
%t76 = add i32 0, 1
%t77 = icmp eq i32 %t75, %t76
br i1 %t77, label %label_28, label %label_29
label_28:
%t78 = add i32 0, 196
store i32 %t78, i32* %t0
br label %label_29
label_29:
%t79 = getelementptr inbounds [75 x i8], [75 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t79)
%t80 = load i32, i32* %t0
call void @printi(i32 %t80)
%t81 = add i32 0, 0
store i32 %t81, i32* %t8
%t82 = add i32 0, 1
%t83 = alloca i32 
store i32 %t82, i32* %t83
br label %label_30
label_30:
%t84 = load i32, i32* %t83
%t85 = load i32, i32* %t0
%t86 = icmp sle i32 %t84, %t85
br i1 %t86, label %label_31, label %label_32
label_31:
%t89 = load i32, i32* %t0
%t90 = load i32, i32* %t83
%t91 = icmp eq i32 %t90, 0
br i1 %t91, label %label_35, label %label_36
label_35:
%t92 = getelementptr inbounds [23 x i8], [23 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t92)
call void @exit(i32 1)
br label %label_36
label_36:
%t88 = sdiv i32 %t89, %t90
%t93 = load i32, i32* %t83
%t87 = mul i32 %t88, %t93
%t94 = load i32, i32* %t0
%t95 = icmp eq i32 %t87, %t94
br i1 %t95, label %label_33, label %label_34
label_33:
%t97 = load i32, i32* %t8
%t98 = add i32 0, 1
%t96 = add i32 %t97, %t98
store i32 %t96, i32* %t8
br label %label_34
label_34:
%t100 = load i32, i32* %t83
%t101 = add i32 0, 1
%t99 = add i32 %t100, %t101
store i32 %t99, i32* %t83
br label %label_30
label_32:
%t103 = load i32, i32* %t0
%t104 = load i32, i32* %t1
%t105 = icmp sle i32 %t103, %t104
br i1 %t105, label %label_40, label %label_39
label_39:
%t106 = load i32, i32* %t8
%t107 = load i32, i32* %t10
%t108 = icmp ne i32 %t106, %t107
br i1 %t108, label %label_40, label %label_41
label_40:
br label %label_42
label_41:
br label %label_42
label_42:
%t102 = phi i1 [ 1, %label_40 ], [ 0, %label_41]
br i1 %t102, label %label_37, label %label_38
label_37:
%t109 = getelementptr inbounds [16 x i8], [16 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t109)
br label %label_2
br label %label_38
label_38:
%t111 = load i32, i32* %t3
%t112 = add i32 0, 1
%t110 = add i32 %t111, %t112
store i32 %t110, i32* %t3
br label %label_11
label_11:
%t114 = add i32 0, 3
%t115 = load i32, i32* %t12
%t113 = sub i32 %t114, %t115
store i32 %t113, i32* %t12
br label %label_0
label_2:
%t116 = getelementptr inbounds [19 x i8], [19 x i8]* @.str8, i32 0, i32 0
call void @print(i8* %t116)
%t117 = load i32, i32* %t8
call void @printi(i32 %t117)
%t118 = getelementptr inbounds [19 x i8], [19 x i8]* @.str9, i32 0, i32 0
call void @print(i8* %t118)
%t119 = load i32, i32* %t10
call void @printi(i32 %t119)
ret void
}
