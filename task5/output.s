	.text
	.file	"output.ll"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	xorl	%eax, %eax
	testb	%al, %al
	jne	.LBB0_2
# %bb.1:                                # %then
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	.format@GOTPCREL(%rip), %rdi
	movq	.str_true@GOTPCREL(%rip), %rsi
	xorl	%eax, %eax
	callq	printf@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
.LBB0_2:                                # %end
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.str_true,@object               # @.str_true
	.section	.rodata,"a",@progbits
	.globl	.str_true
.str_true:
	.asciz	"true"
	.size	.str_true, 5

	.type	.format,@object                 # @.format
	.globl	.format
.format:
	.asciz	"%s"
	.size	.format, 3

	.section	".note.GNU-stack","",@progbits
