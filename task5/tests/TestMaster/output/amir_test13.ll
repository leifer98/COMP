@.str0 = constant [19 x i8] c"Fibonachy numbers:\00"@.str1 = constant [21 x i8] c"Shouldn't be printed\00"@.str2 = constant [33 x i8] c"Fibonacci numbers (alternative):\00"
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
%t0 = getelementptr inbounds [19 x i8], [19 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t0)
%t1 = add i32 0, 20
%t2 = trunc i32 %t1 to i8
%t3 = zext i8 %t2 to i32
%t4 = alloca i32 
store i32 %t3, i32* %t4
%t5 = add i32 0, 1
%t6 = trunc i32 %t5 to i8
%t7 = zext i8 %t6 to i32
%t8 = alloca i32 
store i32 %t7, i32* %t8
br label %label_0
label_0:
%t9 = load i32, i32* %t8
%t10 = trunc i32 %t9 to i8
%t11 = load i32, i32* %t4
%t12 = trunc i32 %t11 to i8
%t14 = zext i8 %t10 to i32
%t15 = zext i8 %t12 to i32
%t13 = icmp slt i32 %t14, %t15
br i1 %t13, label %label_1, label %label_2
label_1:
%t16 = add i32 0, 1
%t17 = trunc i32 %t16 to i8
%t18 = zext i8 %t17 to i32
%t19 = alloca i32 
store i32 %t18, i32* %t19
%t20 = add i32 0, 0
%t21 = alloca i32 
store i32 %t20, i32* %t21
%t22 = add i32 0, 1
%t23 = alloca i32 
store i32 %t22, i32* %t23
%t24 = alloca i32 
store i32 0, i32* %t24
br label %label_3
label_3:
%t25 = add i1 0, 1
br i1 %t25, label %label_4, label %label_5
label_4:
%t26 = load i32, i32* %t19
%t27 = trunc i32 %t26 to i8
%t28 = load i32, i32* %t8
%t29 = trunc i32 %t28 to i8
%t31 = zext i8 %t27 to i32
%t32 = zext i8 %t29 to i32
%t30 = icmp eq i32 %t31, %t32
br i1 %t30, label %label_6, label %label_7
label_6:
%t33 = load i32, i32* %t23
call void @printi(i32 %t33)
br label %label_5
br label %label_7
label_7:
%t35 = load i32, i32* %t23
%t36 = load i32, i32* %t21
%t34 = add i32 %t35, %t36
store i32 %t34, i32* %t24
%t37 = load i32, i32* %t23
store i32 %t37, i32* %t21
%t38 = load i32, i32* %t24
store i32 %t38, i32* %t23
%t40 = load i32, i32* %t19
%t41 = trunc i32 %t40 to i8
%t42 = add i32 0, 1
%t43 = trunc i32 %t42 to i8
%t39 = add i8 %t41, %t43
%t44 = zext i8 %t39 to i32
store i32 %t44, i32* %t19
br label %label_3
%t45 = getelementptr inbounds [21 x i8], [21 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t45)
br label %label_3
label_5:
%t47 = load i32, i32* %t8
%t48 = trunc i32 %t47 to i8
%t49 = add i32 0, 1
%t50 = trunc i32 %t49 to i8
%t46 = add i8 %t48, %t50
%t51 = zext i8 %t46 to i32
store i32 %t51, i32* %t8
br label %label_0
label_2:
br label %label_8
label_8:
%t52 = add i32 0, 1
%t53 = add i32 0, 2
%t54 = icmp slt i32 %t52, %t53
br i1 %t54, label %label_9, label %label_10
label_9:
%t55 = getelementptr inbounds [33 x i8], [33 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t55)
%t56 = add i32 0, 20
%t57 = alloca i32 
store i32 %t56, i32* %t57
%t58 = add i32 0, 1
%t59 = alloca i32 
store i32 %t58, i32* %t59
%t60 = add i1 0, 0
%t61 = zext i1 %t60 to i32
%t62 = alloca i32 
store i32 %t61, i32* %t62
%t63 = add i1 0, 0
%t64 = zext i1 %t63 to i32
%t65 = alloca i32 
store i32 %t64, i32* %t65
br label %label_11
label_11:
%t68 = load i32, i32* %t62
%t69 = trunc i32 %t68 to i1
br i1 %t69, label %label_18, label %label_20
label_18:
%t70 = load i32, i32* %t65
%t71 = trunc i32 %t70 to i1
br i1 %t71, label %label_19, label %label_20
label_19:
br label %label_21
label_20:
br label %label_21
label_21:
%t67 = phi i1 [ 1, %label_19 ], [ 0, %label_20]
%t72 = xor i1 1, %t67
br i1 %t72, label %label_15, label %label_14
label_14:
%t75 = add i1 0, 0
br i1 %t75, label %label_26, label %label_28
label_26:
%t76 = add i1 0, 0
%t77 = xor i1 1, %t76
br i1 %t77, label %label_27, label %label_28
label_27:
br label %label_29
label_28:
br label %label_29
label_29:
%t74 = phi i1 [ 1, %label_27 ], [ 0, %label_28]
br i1 %t74, label %label_22, label %label_24
label_22:
%t78 = add i32 0, 3
%t79 = load i32, i32* %t59
%t80 = icmp slt i32 %t78, %t79
br i1 %t80, label %label_23, label %label_24
label_23:
br label %label_25
label_24:
br label %label_25
label_25:
%t73 = phi i1 [ 1, %label_23 ], [ 0, %label_24]
br i1 %t73, label %label_15, label %label_16
label_15:
br label %label_17
label_16:
br label %label_17
label_17:
%t66 = phi i1 [ 1, %label_15 ], [ 0, %label_16]
br i1 %t66, label %label_12, label %label_13
label_12:
%t82 = load i32, i32* %t59
%t83 = load i32, i32* %t57
%t84 = icmp eq i32 %t82, %t83
br i1 %t84, label %label_33, label %label_35
label_33:
%t85 = load i32, i32* %t62
%t86 = trunc i32 %t85 to i1
%t87 = xor i1 1, %t86
br i1 %t87, label %label_34, label %label_35
label_34:
br label %label_36
label_35:
br label %label_36
label_36:
%t81 = phi i1 [ 1, %label_34 ], [ 0, %label_35]
br i1 %t81, label %label_30, label %label_32
label_30:
%t88 = add i1 0, 1
%t89 = zext i1 %t88 to i32
store i32 %t89, i32* %t62
br label %label_11
br label %label_31
label_32:
%t90 = load i32, i32* %t62
%t91 = trunc i32 %t90 to i1
br i1 %t91, label %label_37, label %label_38
label_37:
%t92 = load i32, i32* %t59
%t93 = load i32, i32* %t57
%t94 = icmp eq i32 %t92, %t93
%t95 = zext i1 %t94 to i32
store i32 %t95, i32* %t65
br label %label_11
br label %label_38
label_38:
br label %label_31
label_31:
%t96 = add i32 0, 1
%t97 = alloca i32 
store i32 %t96, i32* %t97
%t98 = add i32 0, 0
%t99 = alloca i32 
store i32 %t98, i32* %t99
%t100 = add i32 0, 1
%t101 = alloca i32 
store i32 %t100, i32* %t101
%t102 = alloca i32 
store i32 0, i32* %t102
br label %label_39
label_39:
%t103 = load i32, i32* %t97
%t104 = load i32, i32* %t59
%t105 = icmp slt i32 %t103, %t104
br i1 %t105, label %label_40, label %label_41
label_40:
%t107 = load i32, i32* %t101
%t108 = load i32, i32* %t99
%t106 = add i32 %t107, %t108
store i32 %t106, i32* %t102
%t109 = load i32, i32* %t101
store i32 %t109, i32* %t99
%t110 = load i32, i32* %t102
store i32 %t110, i32* %t101
%t111 = load i32, i32* %t62
%t112 = trunc i32 %t111 to i1
br i1 %t112, label %label_42, label %label_44
label_42:
br label %label_41
br label %label_43
label_44:
%t113 = alloca i32 
store i32 0, i32* %t113
br label %label_43
label_43:
%t115 = load i32, i32* %t97
%t116 = add i32 0, 1
%t114 = add i32 %t115, %t116
store i32 %t114, i32* %t97
br label %label_39
label_41:
%t117 = load i32, i32* %t101
call void @printi(i32 %t117)
%t119 = load i32, i32* %t59
%t120 = add i32 0, 1
%t118 = add i32 %t119, %t120
store i32 %t118, i32* %t59
br label %label_11
label_13:
ret void
br label %label_8
label_10:
ret void
}
