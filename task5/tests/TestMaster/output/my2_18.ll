
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
define void @maxParams(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32) {
%t47 = add i32 %0, %1
%t46 = add i32 %t47, %2
%t45 = add i32 %t46, %3
%t44 = add i32 %t45, %4
%t43 = add i32 %t44, %5
%t42 = add i32 %t43, %6
%t41 = add i32 %t42, %7
%t40 = add i32 %t41, %8
%t39 = add i32 %t40, %9
%t38 = add i32 %t39, %10
%t37 = add i32 %t38, %11
%t36 = add i32 %t37, %12
%t35 = add i32 %t36, %13
%t34 = add i32 %t35, %14
%t33 = add i32 %t34, %15
%t32 = add i32 %t33, %16
%t31 = add i32 %t32, %17
%t30 = add i32 %t31, %18
%t29 = add i32 %t30, %19
%t28 = add i32 %t29, %20
%t27 = add i32 %t28, %21
%t26 = add i32 %t27, %22
%t25 = add i32 %t26, %23
%t24 = add i32 %t25, %24
%t23 = add i32 %t24, %25
%t22 = add i32 %t23, %26
%t21 = add i32 %t22, %27
%t20 = add i32 %t21, %28
%t19 = add i32 %t20, %29
%t18 = add i32 %t19, %30
%t17 = add i32 %t18, %31
%t16 = add i32 %t17, %32
%t15 = add i32 %t16, %33
%t14 = add i32 %t15, %34
%t13 = add i32 %t14, %35
%t12 = add i32 %t13, %36
%t11 = add i32 %t12, %37
%t10 = add i32 %t11, %38
%t9 = add i32 %t10, %39
%t8 = add i32 %t9, %40
%t7 = add i32 %t8, %41
%t6 = add i32 %t7, %42
%t5 = add i32 %t6, %43
%t4 = add i32 %t5, %44
%t3 = add i32 %t4, %45
%t2 = add i32 %t3, %46
%t1 = add i32 %t2, %47
%t0 = add i32 %t1, %48
call void @printi(i32 %t0)
ret void
}
define void @main() {
%t48 = add i32 0, 1
%t49 = add i32 0, 2
%t50 = add i32 0, 3
%t51 = add i32 0, 4
%t52 = add i32 0, 5
%t53 = add i32 0, 6
%t54 = add i32 0, 7
%t55 = add i32 0, 8
%t56 = add i32 0, 9
%t57 = add i32 0, 10
%t58 = add i32 0, 11
%t59 = add i32 0, 12
%t60 = add i32 0, 13
%t61 = add i32 0, 14
%t62 = add i32 0, 15
%t63 = add i32 0, 16
%t64 = add i32 0, 17
%t65 = add i32 0, 18
%t66 = add i32 0, 19
%t67 = add i32 0, 20
%t68 = add i32 0, 21
%t69 = add i32 0, 22
%t70 = add i32 0, 23
%t71 = add i32 0, 24
%t72 = add i32 0, 25
%t73 = add i32 0, 26
%t74 = add i32 0, 27
%t75 = add i32 0, 28
%t76 = add i32 0, 29
%t77 = add i32 0, 30
%t78 = add i32 0, 31
%t79 = add i32 0, 32
%t80 = add i32 0, 33
%t81 = add i32 0, 34
%t82 = add i32 0, 35
%t83 = add i32 0, 36
%t84 = add i32 0, 37
%t85 = add i32 0, 38
%t86 = add i32 0, 39
%t87 = add i32 0, 40
%t88 = add i32 0, 41
%t89 = add i32 0, 42
%t90 = add i32 0, 43
%t91 = add i32 0, 44
%t92 = add i32 0, 45
%t93 = add i32 0, 46
%t94 = add i32 0, 47
%t95 = add i32 0, 48
%t96 = add i32 0, 49
call void @maxParams(i32 %t48, i32 %t49, i32 %t50, i32 %t51, i32 %t52, i32 %t53, i32 %t54, i32 %t55, i32 %t56, i32 %t57, i32 %t58, i32 %t59, i32 %t60, i32 %t61, i32 %t62, i32 %t63, i32 %t64, i32 %t65, i32 %t66, i32 %t67, i32 %t68, i32 %t69, i32 %t70, i32 %t71, i32 %t72, i32 %t73, i32 %t74, i32 %t75, i32 %t76, i32 %t77, i32 %t78, i32 %t79, i32 %t80, i32 %t81, i32 %t82, i32 %t83, i32 %t84, i32 %t85, i32 %t86, i32 %t87, i32 %t88, i32 %t89, i32 %t90, i32 %t91, i32 %t92, i32 %t93, i32 %t94, i32 %t95, i32 %t96)
ret void
}
