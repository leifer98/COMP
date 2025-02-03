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
%t4 = add i32 0, 60
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
br i1 %t39, label %label_13, label %label_15
label_13:
%t40 = add i32 0, 90
store i32 %t40, i32* %t1
br label %label_14
label_15:
%t41 = load i32, i32* %t3
%t42 = add i32 0, 2
%t43 = icmp eq i32 %t41, %t42
br i1 %t43, label %label_16, label %label_17
label_16:
%t44 = add i32 0, 1
store i32 %t44, i32* %t1
br label %label_17
label_17:
br label %label_14
label_14:
%t45 = getelementptr inbounds [75 x i8], [75 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t45)
%t46 = load i32, i32* %t1
call void @printi(i32 %t46)
%t47 = add i32 0, 0
store i32 %t47, i32* %t10
%t48 = add i32 0, 1
%t49 = alloca i32 
store i32 %t48, i32* %t49
br label %label_18
label_18:
%t50 = load i32, i32* %t49
%t51 = load i32, i32* %t1
%t52 = icmp sle i32 %t50, %t51
br i1 %t52, label %label_19, label %label_20
label_19:
%t55 = load i32, i32* %t1
%t56 = load i32, i32* %t49
%t57 = icmp eq i32 %t56, 0
br i1 %t57, label %label_23, label %label_24
label_23:
%t58 = getelementptr inbounds [23 x i8], [23 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t58)
call void @exit(i32 1)
br label %label_24
label_24:
%t54 = sdiv i32 %t55, %t56
%t59 = load i32, i32* %t49
%t53 = mul i32 %t54, %t59
%t60 = load i32, i32* %t1
%t61 = icmp eq i32 %t53, %t60
br i1 %t61, label %label_21, label %label_22
label_21:
%t63 = load i32, i32* %t10
%t64 = add i32 0, 1
%t62 = add i32 %t63, %t64
store i32 %t62, i32* %t10
br label %label_22
label_22:
%t66 = load i32, i32* %t49
%t67 = add i32 0, 1
%t65 = add i32 %t66, %t67
store i32 %t65, i32* %t49
br label %label_18
label_20:
%t69 = load i32, i32* %t1
%t70 = load i32, i32* %t0
%t71 = icmp sle i32 %t69, %t70
br i1 %t71, label %label_28, label %label_27
label_27:
%t72 = load i32, i32* %t8
%t73 = load i32, i32* %t10
%t74 = icmp ne i32 %t72, %t73
br i1 %t74, label %label_28, label %label_29
label_28:
br label %label_30
label_29:
br label %label_30
label_30:
%t68 = phi i1 [ 1, %label_28 ], [ 0, %label_29]
br i1 %t68, label %label_25, label %label_26
label_25:
%t75 = getelementptr inbounds [16 x i8], [16 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t75)
br label %label_2
br label %label_26
label_26:
%t77 = load i32, i32* %t3
%t78 = add i32 0, 1
%t76 = add i32 %t77, %t78
store i32 %t76, i32* %t3
br label %label_11
label_12:
%t79 = load i32, i32* %t3
%t80 = add i32 0, 1
%t81 = icmp eq i32 %t79, %t80
br i1 %t81, label %label_31, label %label_32
label_31:
%t82 = add i32 0, 150
store i32 %t82, i32* %t0
br label %label_32
label_32:
%t83 = getelementptr inbounds [75 x i8], [75 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t83)
%t84 = load i32, i32* %t0
call void @printi(i32 %t84)
%t85 = add i32 0, 0
store i32 %t85, i32* %t8
%t86 = add i32 0, 1
%t87 = alloca i32 
store i32 %t86, i32* %t87
br label %label_33
label_33:
%t88 = load i32, i32* %t87
%t89 = load i32, i32* %t0
%t90 = icmp sle i32 %t88, %t89
br i1 %t90, label %label_34, label %label_35
label_34:
%t93 = load i32, i32* %t0
%t94 = load i32, i32* %t87
%t95 = icmp eq i32 %t94, 0
br i1 %t95, label %label_38, label %label_39
label_38:
%t96 = getelementptr inbounds [23 x i8], [23 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t96)
call void @exit(i32 1)
br label %label_39
label_39:
%t92 = sdiv i32 %t93, %t94
%t97 = load i32, i32* %t87
%t91 = mul i32 %t92, %t97
%t98 = load i32, i32* %t0
%t99 = icmp eq i32 %t91, %t98
br i1 %t99, label %label_36, label %label_37
label_36:
%t101 = load i32, i32* %t8
%t102 = add i32 0, 1
%t100 = add i32 %t101, %t102
store i32 %t100, i32* %t8
br label %label_37
label_37:
%t104 = load i32, i32* %t87
%t105 = add i32 0, 1
%t103 = add i32 %t104, %t105
store i32 %t103, i32* %t87
br label %label_33
label_35:
%t107 = load i32, i32* %t0
%t108 = load i32, i32* %t1
%t109 = icmp sle i32 %t107, %t108
br i1 %t109, label %label_43, label %label_42
label_42:
%t110 = load i32, i32* %t8
%t111 = load i32, i32* %t10
%t112 = icmp ne i32 %t110, %t111
br i1 %t112, label %label_43, label %label_44
label_43:
br label %label_45
label_44:
br label %label_45
label_45:
%t106 = phi i1 [ 1, %label_43 ], [ 0, %label_44]
br i1 %t106, label %label_40, label %label_41
label_40:
%t113 = getelementptr inbounds [16 x i8], [16 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t113)
br label %label_2
br label %label_41
label_41:
%t115 = load i32, i32* %t3
%t116 = add i32 0, 1
%t114 = add i32 %t115, %t116
store i32 %t114, i32* %t3
br label %label_11
label_11:
%t118 = add i32 0, 3
%t119 = load i32, i32* %t12
%t117 = sub i32 %t118, %t119
store i32 %t117, i32* %t12
br label %label_0
label_2:
%t120 = getelementptr inbounds [19 x i8], [19 x i8]* @.str8, i32 0, i32 0
call void @print(i8* %t120)
%t121 = load i32, i32* %t8
call void @printi(i32 %t121)
%t122 = getelementptr inbounds [19 x i8], [19 x i8]* @.str9, i32 0, i32 0
call void @print(i8* %t122)
%t123 = load i32, i32* %t10
call void @printi(i32 %t123)
ret void
}
