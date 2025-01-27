	.text
	.file	"output.ll"
	.globl	readi                           # -- Begin function readi
	.p2align	4, 0x90
	.type	readi,@function
readi:                                  # @readi
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	.int_specifier_scan@GOTPCREL(%rip), %rdi
	leaq	4(%rsp), %rsi
	xorl	%eax, %eax
	callq	scanf@PLT
	movl	4(%rsp), %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	readi, .Lfunc_end0-readi
	.cfi_endproc
                                        # -- End function
	.globl	printi                          # -- Begin function printi
	.p2align	4, 0x90
	.type	printi,@function
printi:                                 # @printi
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, %esi
	movq	.int_specifier@GOTPCREL(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	printi, .Lfunc_end1-printi
	.cfi_endproc
                                        # -- End function
	.globl	print                           # -- Begin function print
	.p2align	4, 0x90
	.type	print,@function
print:                                  # @print
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, %rsi
	movq	.str_specifier@GOTPCREL(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	print, .Lfunc_end2-print
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	movl	$5, -8(%rsp)
	movl	$5, -12(%rsp)
	retq
.Lfunc_end3:
	.size	main, .Lfunc_end3-main
	.cfi_endproc
                                        # -- End function
	.type	.int_specifier_scan,@object     # @.int_specifier_scan
	.section	.rodata,"a",@progbits
	.globl	.int_specifier_scan
.int_specifier_scan:
	.asciz	"%d"
	.size	.int_specifier_scan, 3

	.type	.int_specifier,@object          # @.int_specifier
	.globl	.int_specifier
.int_specifier:
	.asciz	"%d\n"
	.size	.int_specifier, 4

	.type	.str_specifier,@object          # @.str_specifier
	.globl	.str_specifier
.str_specifier:
	.asciz	"%s\n"
	.size	.str_specifier, 4

	.section	".note.GNU-stack","",@progbits
