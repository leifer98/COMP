
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
%t1 = add i1 0, 1
br i1 %t1, label %label_3, label %label_2
label_2:
%t2 = add i1 0, 0
br i1 %t2, label %label_3, label %label_4
label_3:
br label %label_5
label_4:
br label %label_5
label_5:
%t0 = phi i1 [ 1, %label_3 ], [ 0, %label_4]
br i1 %t0, label %label_0, label %label_1
label_0:
%t3 = alloca i32 
store i32 0, i32* %t3
br label %label_1
label_1:
%t5 = add i1 0, 0
br i1 %t5, label %label_9, label %label_8
label_8:
%t6 = add i1 0, 1
br i1 %t6, label %label_9, label %label_10
label_9:
br label %label_11
label_10:
br label %label_11
label_11:
%t4 = phi i1 [ 1, %label_9 ], [ 0, %label_10]
br i1 %t4, label %label_6, label %label_7
label_6:
%t7 = alloca i32 
store i32 0, i32* %t7
br label %label_7
label_7:
%t9 = add i1 0, 0
%t10 = xor i1 1, %t9
br i1 %t10, label %label_15, label %label_14
label_14:
%t11 = add i1 0, 1
br i1 %t11, label %label_15, label %label_16
label_15:
br label %label_17
label_16:
br label %label_17
label_17:
%t8 = phi i1 [ 1, %label_15 ], [ 0, %label_16]
br i1 %t8, label %label_12, label %label_13
label_12:
%t12 = alloca i32 
store i32 0, i32* %t12
br label %label_13
label_13:
%t14 = add i1 0, 1
br i1 %t14, label %label_20, label %label_22
label_20:
%t15 = add i1 0, 0
br i1 %t15, label %label_21, label %label_22
label_21:
br label %label_23
label_22:
br label %label_23
label_23:
%t13 = phi i1 [ 1, %label_21 ], [ 0, %label_22]
br i1 %t13, label %label_18, label %label_19
label_18:
%t16 = alloca i32 
store i32 0, i32* %t16
br label %label_19
label_19:
%t18 = add i1 0, 0
br i1 %t18, label %label_26, label %label_28
label_26:
%t19 = add i1 0, 1
br i1 %t19, label %label_27, label %label_28
label_27:
br label %label_29
label_28:
br label %label_29
label_29:
%t17 = phi i1 [ 1, %label_27 ], [ 0, %label_28]
br i1 %t17, label %label_24, label %label_25
label_24:
%t20 = alloca i32 
store i32 0, i32* %t20
br label %label_25
label_25:
%t22 = add i1 0, 0
%t23 = xor i1 1, %t22
br i1 %t23, label %label_32, label %label_34
label_32:
%t24 = add i1 0, 1
br i1 %t24, label %label_33, label %label_34
label_33:
br label %label_35
label_34:
br label %label_35
label_35:
%t21 = phi i1 [ 1, %label_33 ], [ 0, %label_34]
br i1 %t21, label %label_30, label %label_31
label_30:
%t25 = alloca i32 
store i32 0, i32* %t25
br label %label_31
label_31:
%t26 = add i32 0, 0
%t27 = alloca i32 
store i32 %t26, i32* %t27
br label %label_36
label_36:
%t29 = add i1 0, 1
br i1 %t29, label %label_39, label %label_41
label_39:
%t30 = load i32, i32* %t27
%t31 = add i32 0, 2
%t32 = icmp slt i32 %t30, %t31
br i1 %t32, label %label_40, label %label_41
label_40:
br label %label_42
label_41:
br label %label_42
label_42:
%t28 = phi i1 [ 1, %label_40 ], [ 0, %label_41]
br i1 %t28, label %label_37, label %label_38
label_37:
%t34 = load i32, i32* %t27
%t35 = add i32 0, 2
%t33 = add i32 %t34, %t35
store i32 %t33, i32* %t27
%t36 = load i32, i32* %t27
call void @printi(i32 %t36)
br label %label_36
label_38:
%t37 = add i32 0, 0
store i32 %t37, i32* %t27
br label %label_43
label_43:
%t39 = add i1 0, 0
br i1 %t39, label %label_47, label %label_46
label_46:
%t40 = load i32, i32* %t27
%t41 = add i32 0, 2
%t42 = icmp slt i32 %t40, %t41
br i1 %t42, label %label_47, label %label_48
label_47:
br label %label_49
label_48:
br label %label_49
label_49:
%t38 = phi i1 [ 1, %label_47 ], [ 0, %label_48]
br i1 %t38, label %label_44, label %label_45
label_44:
%t44 = load i32, i32* %t27
%t45 = add i32 0, 3
%t43 = add i32 %t44, %t45
store i32 %t43, i32* %t27
%t46 = load i32, i32* %t27
call void @printi(i32 %t46)
br label %label_43
label_45:
ret void
}
