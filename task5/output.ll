@.str_true = constant [5 x i8] c"true\00"
@.format = constant [3 x i8] c"%s\00"

declare i32 @printf(i8*, ...)

define void @main() {
entry:
    %format_ptr = getelementptr [3 x i8], [3 x i8]* @.format, i32 0, i32 0
    %msg_ptr = getelementptr [5 x i8], [5 x i8]* @.str_true, i32 0, i32 0
    %cond = icmp eq i1 1, 1
    br i1 %cond, label %then, label %end

then:
    call i32 (i8*, ...) @printf(i8* %format_ptr, i8* %msg_ptr)
    br label %end

end:
    ret void
}
