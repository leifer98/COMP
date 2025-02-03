@.str0 = constant [23 x i8] c"Error division by zero\00"@.str1 = constant [11 x i8] c"Somethings\00"@.str2 = constant [23 x i8] c"Error division by zero\00"@.str3 = constant [23 x i8] c"Error division by zero\00"@.str4 = constant [23 x i8] c"Error division by zero\00"@.str5 = constant [23 x i8] c"Error division by zero\00"@.str6 = constant [23 x i8] c"Error division by zero\00"@.str7 = constant [23 x i8] c"Error division by zero\00"@.str8 = constant [23 x i8] c"Error division by zero\00"
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
%t0 = add i8 0, 1
%t1 = zext i8 %t0 to i32
%t2 = alloca i32 
store i32 %t1, i32* %t2
%t3 = add i1 0, 0
%t4 = zext i1 %t3 to i32
%t5 = alloca i32 
store i32 %t4, i32* %t5
%t6 = add i1 0, 1
%t7 = zext i1 %t6 to i32
%t8 = alloca i32 
store i32 %t7, i32* %t8
%t9 = alloca i32 
store i32 0, i32* %t9
br label %label_0
label_0:
%t10 = load i32, i32* %t2
%t11 = add i32 0, 10
%t12 = icmp slt i32 %t10, %t11
br i1 %t12, label %label_1, label %label_2
label_1:
%t14 = load i32, i32* %t2
%t15 = add i32 0, 1
%t13 = add i32 %t14, %t15
store i32 %t13, i32* %t2
%t16 = add i32 0, 100
%t17 = alloca i32 
store i32 %t16, i32* %t17
br label %label_3
label_3:
%t18 = load i32, i32* %t17
%t19 = load i32, i32* %t2
%t20 = icmp sgt i32 %t18, %t19
br i1 %t20, label %label_4, label %label_5
label_4:
%t23 = load i32, i32* %t17
%t24 = load i32, i32* %t2
%t25 = icmp eq i32 %t24, 0
br i1 %t25, label %label_6, label %label_7
label_6:
%t26 = getelementptr inbounds [23 x i8], [23 x i8]* @.str0, i32 0, i32 0
call void @print(i8* %t26)
call void @exit(i32 1)
br label %label_7
label_7:
%t22 = sdiv i32 %t23, %t24
%t27 = load i32, i32* %t2
%t21 = mul i32 %t22, %t27
%t28 = load i32, i32* %t17
%t29 = icmp eq i32 %t21, %t28
%t30 = zext i1 %t29 to i32
store i32 %t30, i32* %t9
%t31 = add i32 0, 1
%t32 = alloca i32 
store i32 %t31, i32* %t32
br label %label_8
label_8:
%t33 = load i32, i32* %t32
%t34 = load i32, i32* %t2
%t35 = icmp slt i32 %t33, %t34
br i1 %t35, label %label_9, label %label_10
label_9:
%t37 = add i1 0, 0
br i1 %t37, label %label_15, label %label_14
label_14:
%t39 = add i1 0, 1
br i1 %t39, label %label_18, label %label_20
label_18:
%t41 = load i32, i32* %t5
%t42 = trunc i32 %t41 to i1
br i1 %t42, label %label_23, label %label_22
label_22:
%t44 = load i32, i32* %t8
%t45 = trunc i32 %t44 to i1
br i1 %t45, label %label_26, label %label_28
label_26:
%t46 = load i32, i32* %t9
%t47 = trunc i32 %t46 to i1
%t48 = xor i1 1, %t47
br i1 %t48, label %label_27, label %label_28
label_27:
br label %label_29
label_28:
br label %label_29
label_29:
%t43 = phi i1 [ 1, %label_27 ], [ 0, %label_28]
br i1 %t43, label %label_23, label %label_24
label_23:
br label %label_25
label_24:
br label %label_25
label_25:
%t40 = phi i1 [ 1, %label_23 ], [ 0, %label_24]
%t49 = xor i1 1, %t40
br i1 %t49, label %label_19, label %label_20
label_19:
br label %label_21
label_20:
br label %label_21
label_21:
%t38 = phi i1 [ 1, %label_19 ], [ 0, %label_20]
br i1 %t38, label %label_15, label %label_16
label_15:
br label %label_17
label_16:
br label %label_17
label_17:
%t36 = phi i1 [ 1, %label_15 ], [ 0, %label_16]
br i1 %t36, label %label_11, label %label_13
label_11:
%t51 = load i32, i32* %t17
%t52 = add i32 0, 1
%t50 = sub i32 %t51, %t52
store i32 %t50, i32* %t17
br label %label_12
label_13:
%t53 = getelementptr inbounds [11 x i8], [11 x i8]* @.str1, i32 0, i32 0
call void @print(i8* %t53)
br label %label_12
label_12:
%t55 = load i32, i32* %t32
%t56 = add i32 0, 1
%t54 = add i32 %t55, %t56
store i32 %t54, i32* %t32
br label %label_8
label_10:
%t57 = load i32, i32* %t8
%t58 = trunc i32 %t57 to i1
%t59 = xor i1 1, %t58
%t60 = zext i1 %t59 to i32
store i32 %t60, i32* %t5
%t62 = load i32, i32* %t5
%t63 = trunc i32 %t62 to i1
br i1 %t63, label %label_30, label %label_32
label_30:
%t64 = load i32, i32* %t9
%t65 = trunc i32 %t64 to i1
%t66 = xor i1 1, %t65
br i1 %t66, label %label_31, label %label_32
label_31:
br label %label_33
label_32:
br label %label_33
label_33:
%t61 = phi i1 [ 1, %label_31 ], [ 0, %label_32]
%t67 = zext i1 %t61 to i32
store i32 %t67, i32* %t8
%t68 = load i32, i32* %t5
%t69 = trunc i32 %t68 to i1
br i1 %t69, label %label_34, label %label_36
label_34:
%t72 = load i32, i32* %t17
%t73 = add i32 0, 2
%t74 = icmp eq i32 %t73, 0
br i1 %t74, label %label_37, label %label_38
label_37:
%t75 = getelementptr inbounds [23 x i8], [23 x i8]* @.str2, i32 0, i32 0
call void @print(i8* %t75)
call void @exit(i32 1)
br label %label_38
label_38:
%t71 = sdiv i32 %t72, %t73
%t76 = add i32 0, 1
%t70 = add i32 %t71, %t76
store i32 %t70, i32* %t17
br label %label_35
label_36:
%t77 = load i32, i32* %t8
%t78 = trunc i32 %t77 to i1
%t79 = xor i1 1, %t78
br i1 %t79, label %label_39, label %label_40
label_39:
%t84 = load i32, i32* %t2
%t85 = load i32, i32* %t17
%t86 = icmp eq i32 %t85, 0
br i1 %t86, label %label_41, label %label_42
label_41:
%t87 = getelementptr inbounds [23 x i8], [23 x i8]* @.str3, i32 0, i32 0
call void @print(i8* %t87)
call void @exit(i32 1)
br label %label_42
label_42:
%t83 = sdiv i32 %t84, %t85
%t88 = load i32, i32* %t17
%t82 = mul i32 %t83, %t88
%t89 = load i32, i32* %t2
%t81 = add i32 %t82, %t89
%t91 = add i32 0, 3
%t92 = add i32 0, 2
%t90 = mul i32 %t91, %t92
%t80 = add i32 %t81, %t90
call void @printi(i32 %t80)
br label %label_40
label_40:
br label %label_35
label_35:
%t98 = load i32, i32* %t17
%t99 = load i32, i32* %t17
%t97 = mul i32 %t98, %t99
%t100 = load i32, i32* %t2
%t101 = icmp eq i32 %t100, 0
br i1 %t101, label %label_43, label %label_44
label_43:
%t102 = getelementptr inbounds [23 x i8], [23 x i8]* @.str4, i32 0, i32 0
call void @print(i8* %t102)
call void @exit(i32 1)
br label %label_44
label_44:
%t96 = sdiv i32 %t97, %t100
%t103 = load i32, i32* %t2
%t104 = icmp eq i32 %t103, 0
br i1 %t104, label %label_45, label %label_46
label_45:
%t105 = getelementptr inbounds [23 x i8], [23 x i8]* @.str5, i32 0, i32 0
call void @print(i8* %t105)
call void @exit(i32 1)
br label %label_46
label_46:
%t95 = sdiv i32 %t96, %t103
%t109 = load i32, i32* %t2
%t110 = load i32, i32* %t17
%t111 = icmp eq i32 %t110, 0
br i1 %t111, label %label_47, label %label_48
label_47:
%t112 = getelementptr inbounds [23 x i8], [23 x i8]* @.str6, i32 0, i32 0
call void @print(i8* %t112)
call void @exit(i32 1)
br label %label_48
label_48:
%t108 = sdiv i32 %t109, %t110
%t113 = add i32 0, 2
%t107 = mul i32 %t108, %t113
%t114 = add i32 0, 3
%t115 = icmp eq i32 %t114, 0
br i1 %t115, label %label_49, label %label_50
label_49:
%t116 = getelementptr inbounds [23 x i8], [23 x i8]* @.str7, i32 0, i32 0
call void @print(i8* %t116)
call void @exit(i32 1)
br label %label_50
label_50:
%t106 = sdiv i32 %t107, %t114
%t94 = add i32 %t95, %t106
%t119 = add i32 0, 4
%t120 = load i32, i32* %t2
%t118 = mul i32 %t119, %t120
%t122 = load i32, i32* %t17
%t123 = add i32 0, 5
%t121 = add i32 %t122, %t123
%t124 = icmp eq i32 %t121, 0
br i1 %t124, label %label_51, label %label_52
label_51:
%t125 = getelementptr inbounds [23 x i8], [23 x i8]* @.str8, i32 0, i32 0
call void @print(i8* %t125)
call void @exit(i32 1)
br label %label_52
label_52:
%t117 = sdiv i32 %t118, %t121
%t93 = add i32 %t94, %t117
call void @printi(i32 %t93)
br label %label_3
label_5:
br label %label_0
label_2:
ret void
}
