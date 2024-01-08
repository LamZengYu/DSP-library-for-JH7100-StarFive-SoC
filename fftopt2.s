	.file	"fftopt2.c"
	.option nopic
	.text
	.align	1
	.globl	dft
	.type	dft, @function
dft:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	fsd	fs0,56(sp)
	fsd	fs1,48(sp)
	addi	s0,sp,80
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	mv	a5,a3
	sw	a5,-76(s0)
	mv	a5,a4
	sw	a5,-80(s0)
	sw	zero,-36(s0)
	j	.L2
.L5:
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-64(s0)
	add	a5,a4,a5
	sw	zero,0(a5)
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-72(s0)
	add	a5,a4,a5
	sw	zero,0(a5)
	sw	zero,-40(s0)
	j	.L3
.L4:
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-64(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fcvt.d.s	fs0,fa5
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	fcvt.d.w	fs1,a5
	lw	a5,-36(s0)
	fcvt.d.w	fa4,a5
	lui	a5,%hi(.LC1)
	fld	fa5,%lo(.LC1)(a5)
	fmul.d	fa4,fa4,fa5
	lw	a5,-40(s0)
	fcvt.d.w	fa5,a5
	fmul.d	fa4,fa4,fa5
	lw	a5,-76(s0)
	fcvt.d.w	fa5,a5
	fdiv.d	fa5,fa4,fa5
	fmv.d	fa0,fa5
	call	cos
	fmv.d	fa5,fa0
	fmul.d	fa5,fs1,fa5
	fadd.d	fa5,fs0,fa5
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-64(s0)
	add	a5,a4,a5
	fcvt.s.d	fa5,fa5
	fsw	fa5,0(a5)
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-72(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fcvt.d.s	fs0,fa5
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	fcvt.d.w	fs1,a5
	lw	a5,-36(s0)
	fcvt.d.w	fa4,a5
	lui	a5,%hi(.LC1)
	fld	fa5,%lo(.LC1)(a5)
	fmul.d	fa4,fa4,fa5
	lw	a5,-40(s0)
	fcvt.d.w	fa5,a5
	fmul.d	fa4,fa4,fa5
	lw	a5,-76(s0)
	fcvt.d.w	fa5,a5
	fdiv.d	fa5,fa4,fa5
	fmv.d	fa0,fa5
	call	sin
	fmv.d	fa5,fa0
	fmul.d	fa5,fs1,fa5
	fsub.d	fa5,fs0,fa5
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-72(s0)
	add	a5,a4,a5
	fcvt.s.d	fa5,fa5
	fsw	fa5,0(a5)
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L3:
	lw	a4,-40(s0)
	lw	a5,-76(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L4
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L2:
	lw	a4,-36(s0)
	lw	a5,-80(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L5
	nop
	nop
	ld	ra,72(sp)
	ld	s0,64(sp)
	fld	fs0,56(sp)
	fld	fs1,48(sp)
	addi	sp,sp,80
	jr	ra
	.size	dft, .-dft
	.align	1
	.globl	idft
	.type	idft, @function
idft:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	fsd	fs0,56(sp)
	fsd	fs1,48(sp)
	addi	s0,sp,80
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	sd	a2,-72(s0)
	mv	a5,a3
	sw	a5,-76(s0)
	mv	a5,a4
	sw	a5,-80(s0)
	sw	zero,-40(s0)
	sw	zero,-40(s0)
	j	.L7
.L10:
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	sw	zero,0(a5)
	sw	zero,-36(s0)
	j	.L8
.L9:
	lw	a5,-36(s0)
	fcvt.d.w	fa4,a5
	lui	a5,%hi(.LC1)
	fld	fa5,%lo(.LC1)(a5)
	fmul.d	fa4,fa4,fa5
	lw	a5,-40(s0)
	fcvt.d.w	fa5,a5
	fmul.d	fa4,fa4,fa5
	lw	a5,-80(s0)
	fcvt.d.w	fa5,a5
	fdiv.d	fa5,fa4,fa5
	fcvt.w.d a5,fa5,rtz
	sw	a5,-44(s0)
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	fcvt.d.w	fs0,a5
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-64(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fcvt.d.s	fs1,fa5
	lw	a5,-44(s0)
	fcvt.d.w	fa5,a5
	fmv.d	fa0,fa5
	call	cos
	fmv.d	fa5,fa0
	fmul.d	fa5,fs1,fa5
	fadd.d	fs0,fs0,fa5
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-72(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fcvt.d.s	fs1,fa5
	lw	a5,-44(s0)
	fcvt.d.w	fa5,a5
	fmv.d	fa0,fa5
	call	sin
	fmv.d	fa5,fa0
	fmul.d	fa5,fs1,fa5
	fadd.d	fa5,fs0,fa5
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	fcvt.w.d a4,fa5,rtz
	sext.w	a4,a4
	sw	a4,0(a5)
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L8:
	lw	a4,-36(s0)
	lw	a5,-80(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L9
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a3,0(a5)
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a4,-76(s0)
	divw	a4,a3,a4
	sext.w	a4,a4
	sw	a4,0(a5)
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L7:
	lw	a4,-40(s0)
	lw	a5,-80(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L10
	nop
	nop
	ld	ra,72(sp)
	ld	s0,64(sp)
	fld	fs0,56(sp)
	fld	fs1,48(sp)
	addi	sp,sp,80
	jr	ra
	.size	idft, .-idft
	.align	1
	.globl	fft
	.type	fft, @function
fft:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	addi	s0,sp,128
	sd	a0,-104(s0)
	sd	a1,-112(s0)
	mv	a5,a2
	sw	a5,-116(s0)
	sw	zero,-20(s0)
	sw	zero,-28(s0)
	j	.L12
.L16:
	lw	a4,-20(s0)
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bleu	a4,a5,.L13
	lwu	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fsw	fa5,-80(s0)
	lwu	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fsw	fa5,-84(s0)
	lwu	a5,-28(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a4,a4,a5
	lwu	a5,-20(s0)
	slli	a5,a5,2
	ld	a3,-104(s0)
	add	a5,a3,a5
	flw	fa5,0(a4)
	fsw	fa5,0(a5)
	lwu	a5,-28(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a4,a4,a5
	lwu	a5,-20(s0)
	slli	a5,a5,2
	ld	a3,-112(s0)
	add	a5,a3,a5
	flw	fa5,0(a4)
	fsw	fa5,0(a5)
	lwu	a5,-28(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a5,a4,a5
	flw	fa5,-80(s0)
	fsw	fa5,0(a5)
	lwu	a5,-28(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa5,-84(s0)
	fsw	fa5,0(a5)
.L13:
	lw	a5,-116(s0)
	sw	a5,-24(s0)
	j	.L14
.L15:
	lw	a5,-24(s0)
	not	a5,a5
	sext.w	a4,a5
	lw	a5,-20(s0)
	and	a5,a5,a4
	sw	a5,-20(s0)
.L14:
	lw	a5,-24(s0)
	srliw	a5,a5,1
	sw	a5,-24(s0)
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	and	a5,a4,a5
	sext.w	a5,a5
	bne	a5,zero,.L15
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L12:
	lw	a4,-116(s0)
	lw	a5,-28(s0)
	sext.w	a5,a5
	bltu	a5,a4,.L16
	lui	a5,%hi(.LC2)
	flw	fa5,%lo(.LC2)(a5)
	fsw	fa5,-52(s0)
	li	a5,1
	sw	a5,-40(s0)
	j	.L17
.L24:
	lw	a5,-40(s0)
	slliw	a5,a5,1
	sw	a5,-56(s0)
	lw	a5,-40(s0)
	fcvt.s.wu	fa5,a5
	fsw	fa5,-60(s0)
	lui	a5,%hi(.LC3)
	flw	fa5,%lo(.LC3)(a5)
	fsw	fa5,-32(s0)
	sw	zero,-36(s0)
	sw	zero,-44(s0)
	j	.L18
.L23:
	lw	a5,-44(s0)
	fcvt.s.wu	fa4,a5
	lui	a5,%hi(.LC3)
	flw	fa5,%lo(.LC3)(a5)
	fadd.s	fa4,fa4,fa5
	flw	fa5,-52(s0)
	fmul.s	fa4,fa4,fa5
	flw	fa5,-60(s0)
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-64(s0)
	lw	a5,-44(s0)
	sw	a5,-48(s0)
	j	.L19
.L20:
	lw	a4,-48(s0)
	lw	a5,-40(s0)
	addw	a5,a4,a5
	sw	a5,-68(s0)
	lwu	a5,-68(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a5,a4,a5
	flw	fa4,0(a5)
	flw	fa5,-32(s0)
	fmul.s	fa4,fa4,fa5
	lwu	a5,-68(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa3,0(a5)
	flw	fa5,-36(s0)
	fmul.s	fa5,fa3,fa5
	fsub.s	fa5,fa4,fa5
	fsw	fa5,-72(s0)
	lwu	a5,-68(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a5,a4,a5
	flw	fa4,0(a5)
	flw	fa5,-36(s0)
	fmul.s	fa4,fa4,fa5
	lwu	a5,-68(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa3,0(a5)
	flw	fa5,-32(s0)
	fmul.s	fa5,fa3,fa5
	fadd.s	fa5,fa4,fa5
	fsw	fa5,-76(s0)
	lwu	a5,-48(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a5,a4,a5
	flw	fa4,0(a5)
	lwu	a5,-68(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a5,a4,a5
	flw	fa5,-72(s0)
	fsub.s	fa5,fa4,fa5
	fsw	fa5,0(a5)
	lwu	a5,-48(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa4,0(a5)
	lwu	a5,-68(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa5,-76(s0)
	fsub.s	fa5,fa4,fa5
	fsw	fa5,0(a5)
	lwu	a5,-48(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a5,a4,a5
	flw	fa4,0(a5)
	lwu	a5,-48(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a5,a4,a5
	flw	fa5,-72(s0)
	fadd.s	fa5,fa4,fa5
	fsw	fa5,0(a5)
	lwu	a5,-48(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa4,0(a5)
	lwu	a5,-48(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa5,-76(s0)
	fadd.s	fa5,fa4,fa5
	fsw	fa5,0(a5)
	lw	a4,-48(s0)
	lw	a5,-56(s0)
	addw	a5,a4,a5
	sw	a5,-48(s0)
.L19:
	lw	a4,-116(s0)
	lw	a5,-48(s0)
	sext.w	a5,a5
	bltu	a5,a4,.L20
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-40(s0)
	sext.w	a5,a5
	beq	a5,a4,.L25
	flw	fa5,-64(s0)
	fcvt.d.s	fa5,fa5
	fmv.d	fa0,fa5
	call	cos
	fmv.d	fa5,fa0
	fcvt.s.d	fa5,fa5
	fsw	fa5,-32(s0)
	flw	fa5,-64(s0)
	fcvt.d.s	fa5,fa5
	fmv.d	fa0,fa5
	call	sin
	fmv.d	fa5,fa0
	fcvt.s.d	fa5,fa5
	fsw	fa5,-36(s0)
	j	.L22
.L25:
	nop
.L22:
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L18:
	lw	a4,-44(s0)
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L23
	lw	a5,-40(s0)
	slliw	a5,a5,1
	sw	a5,-40(s0)
.L17:
	lw	a4,-116(s0)
	lw	a5,-40(s0)
	sext.w	a5,a5
	bltu	a5,a4,.L24
	nop
	nop
	ld	ra,120(sp)
	ld	s0,112(sp)
	addi	sp,sp,128
	jr	ra
	.size	fft, .-fft
	.section	.rodata
	.align	3
.LC6:
	.string	"Average time per fft %fms\n"
	.align	3
.LC0:
	.word	1065353216
	.word	1073741824
	.word	1077936128
	.word	1082130432
	.word	1084227584
	.word	1086324736
	.word	1088421888
	.word	1090519040
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-1152
	sd	ra,1144(sp)
	sd	s0,1136(sp)
	addi	s0,sp,1152
	mv	a5,a0
	sd	a1,-1152(s0)
	sw	a5,-1140(s0)
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	ld	a5,24(a5)
	sd	a2,-80(s0)
	sd	a3,-72(s0)
	sd	a4,-64(s0)
	sd	a5,-56(s0)
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	ld	a5,24(a5)
	sd	a2,-112(s0)
	sd	a3,-104(s0)
	sd	a4,-96(s0)
	sd	a5,-88(s0)
	addi	a4,s0,-112
	addi	a5,s0,-80
	li	a2,8
	mv	a1,a4
	mv	a0,a5
	call	fft
	call	clock
	sd	a0,-32(s0)
	sw	zero,-20(s0)
	j	.L27
.L28:
	addi	a4,s0,-1136
	addi	a5,s0,-624
	li	a2,128
	mv	a1,a4
	mv	a0,a5
	call	fft
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L27:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,98304
	addi	a5,a5,1695
	ble	a4,a5,.L28
	call	clock
	sd	a0,-40(s0)
	ld	a4,-40(s0)
	ld	a5,-32(s0)
	sub	a5,a4,a5
	fcvt.d.l	fa4,a5
	lui	a5,%hi(.LC4)
	fld	fa5,%lo(.LC4)(a5)
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-48(s0)
	fld	fa4,-48(s0)
	lui	a5,%hi(.LC5)
	fld	fa5,%lo(.LC5)(a5)
	fdiv.d	fa5,fa4,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,1144(sp)
	ld	s0,1136(sp)
	addi	sp,sp,1152
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
.LC1:
	.word	-57999238
	.word	1075388922
	.align	2
.LC2:
	.word	-1068953637
	.align	2
.LC3:
	.word	1065353216
	.align	3
.LC4:
	.word	0
	.word	1093567616
	.align	3
.LC5:
	.word	0
	.word	1083129856
	.ident	"GCC: (GNU) 10.3.1 20210422 (Red Hat 10.3.1-1)"
	.section	.note.GNU-stack,"",@progbits