	.file	"corre.c"
	.option nopic
	.text
	.align	1
	.globl	correlation
	.type	correlation, @function
correlation:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	mv	a5,a2
	sd	a4,-80(s0)
	sw	a5,-68(s0)
	mv	a5,a3
	sw	a5,-72(s0)
	lw	a4,-68(s0)
	lw	a5,-72(s0)
	addw	a5,a4,a5
	sext.w	a5,a5
	addiw	a5,a5,-1
	sw	a5,-32(s0)
	ld	a5,-80(s0)
	lw	a4,-32(s0)
	sw	a4,0(a5)
	lw	a5,-32(s0)
	li	a1,4
	mv	a0,a5
	call	calloc
	mv	a5,a0
	sd	a5,-40(s0)
	sw	zero,-20(s0)
	j	.L2
.L8:
	lw	a4,-20(s0)
	lw	a5,-68(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	sext.w	a4,a5
	bge	a4,zero,.L3
	li	a5,-1
.L3:
	sext.w	a5,a5
	addiw	a5,a5,1
	sw	a5,-44(s0)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	mv	a2,a5
	lw	a5,-72(s0)
	sext.w	a3,a5
	sext.w	a4,a2
	ble	a3,a4,.L4
	mv	a5,a2
.L4:
	sw	a5,-48(s0)
	lw	a5,-68(s0)
	addiw	a5,a5,-1
	sext.w	a4,a5
	lw	a5,-20(s0)
	subw	a5,a4,a5
	sext.w	a5,a5
	sext.w	a4,a5
	bge	a4,zero,.L5
	li	a5,0
.L5:
	sw	a5,-24(s0)
	lw	a5,-44(s0)
	sw	a5,-28(s0)
	j	.L6
.L7:
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	flw	fa4,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	flw	fa3,0(a5)
	lw	a5,-28(s0)
	slli	a5,a5,2
	ld	a4,-64(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fmul.s	fa5,fa3,fa5
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	fadd.s	fa5,fa4,fa5
	fsw	fa5,0(a5)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L6:
	lw	a4,-28(s0)
	lw	a5,-48(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L7
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a4,-20(s0)
	lw	a5,-32(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L8
	ld	a5,-40(s0)
	mv	a0,a5
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	correlation, .-correlation
	.section	.rodata
	.align	3
.LC1:
	.string	"r"
	.align	3
.LC0:
	.string	"example_input.txt"
	.text
	.align	1
	.globl	read_input
	.type	read_input, @function
read_input:
	addi	sp,sp,-144
	sd	ra,136(sp)
	sd	s0,128(sp)
	addi	s0,sp,144
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	ld	a4,0(a5)
	sd	a4,-72(s0)
	ld	a4,8(a5)
	sd	a4,-64(s0)
	lhu	a5,16(a5)
	sh	a5,-56(s0)
	addi	a4,s0,-72
	lui	a5,%hi(.LC1)
	addi	a1,a5,%lo(.LC1)
	mv	a0,a4
	call	fopen
	sd	a0,-32(s0)
	sw	zero,-20(s0)
	j	.L11
.L12:
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L11:
	addi	a5,s0,-104
	ld	a2,-32(s0)
	li	a1,30
	mv	a0,a5
	call	fgets
	mv	a5,a0
	bne	a5,zero,.L12
	ld	a0,-32(s0)
	call	fclose
	lw	a5,-20(s0)
	slli	a5,a5,2
	mv	a0,a5
	call	malloc
	mv	a5,a0
	sd	a5,-40(s0)
	sw	zero,-24(s0)
	addi	a4,s0,-72
	lui	a5,%hi(.LC1)
	addi	a1,a5,%lo(.LC1)
	mv	a0,a4
	call	fopen
	sd	a0,-32(s0)
	j	.L13
.L15:
	addi	a5,s0,-136
	li	a1,10
	mv	a0,a5
	call	strchr
	sd	a0,-48(s0)
	ld	a5,-48(s0)
	beq	a5,zero,.L14
	ld	a5,-48(s0)
	sb	zero,0(a5)
.L14:
	addi	a5,s0,-136
	mv	a0,a5
	call	atof
	fmv.d	fa5,fa0
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	fcvt.s.d	fa5,fa5
	fsw	fa5,0(a5)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L13:
	addi	a5,s0,-136
	ld	a2,-32(s0)
	li	a1,30
	mv	a0,a5
	call	fgets
	mv	a5,a0
	bne	a5,zero,.L15
	ld	a0,-32(s0)
	call	fclose
	ld	a5,-40(s0)
	mv	a0,a5
	ld	ra,136(sp)
	ld	s0,128(sp)
	addi	sp,sp,144
	jr	ra
	.size	read_input, .-read_input
	.section	.rodata
	.align	3
.LC2:
	.string	"w"
	.align	3
.LC3:
	.string	"%f\n"
	.text
	.align	1
	.globl	write_output
	.type	write_output, @function
write_output:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	mv	a5,a2
	sw	a5,-52(s0)
	lui	a5,%hi(.LC2)
	addi	a1,a5,%lo(.LC2)
	ld	a0,-48(s0)
	call	fopen
	sd	a0,-32(s0)
	sw	zero,-20(s0)
	j	.L18
.L19:
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a2,fa5
	lui	a5,%hi(.LC3)
	addi	a1,a5,%lo(.LC3)
	ld	a0,-32(s0)
	call	fprintf
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L18:
	lw	a5,-52(s0)
	slliw	a5,a5,1
	sext.w	a5,a5
	addiw	a5,a5,-1
	sext.w	a4,a5
	lw	a5,-20(s0)
	sext.w	a5,a5
	blt	a5,a4,.L19
	ld	a0,-32(s0)
	call	fclose
	nop
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	write_output, .-write_output
	.section	.rodata
	.align	3
.LC6:
	.string	"Average time: %fms\n"
	.text
	.align	1
	.globl	running_time
	.type	running_time, @function
running_time:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	addi	s0,sp,96
	sd	a0,-72(s0)
	sd	a1,-80(s0)
	mv	a5,a2
	sw	a5,-84(s0)
	call	clock
	sd	a0,-32(s0)
	sw	zero,-20(s0)
	j	.L21
.L22:
	addi	a4,s0,-52
	lw	a3,-84(s0)
	lw	a5,-84(s0)
	mv	a2,a5
	ld	a1,-80(s0)
	ld	a0,-72(s0)
	call	correlation
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L21:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,19
	ble	a4,a5,.L22
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
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	nop
	ld	ra,88(sp)
	ld	s0,80(sp)
	addi	sp,sp,96
	jr	ra
	.size	running_time, .-running_time
	.section	.rodata
	.align	3
.LC7:
	.string	"correoutput.txt"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-160
	sd	ra,152(sp)
	sd	s0,144(sp)
	sd	s1,136(sp)
	sd	s2,128(sp)
	sd	s3,120(sp)
	sd	s4,112(sp)
	sd	s5,104(sp)
	addi	s0,sp,160
	sd	a1,-160(s0)
	mv	a1,a0
	sw	a1,-148(s0)
	mv	a1,sp
	mv	s1,a1
	li	a1,1024
	sw	a1,-76(s0)
	lw	a1,-76(s0)
	addi	a1,a1,-1
	sd	a1,-72(s0)
	lw	a1,-76(s0)
	mv	s4,a1
	li	s5,0
	srli	a1,s4,59
	slli	t2,s5,5
	or	t2,a1,t2
	slli	t1,s4,5
	lw	a1,-76(s0)
	mv	s2,a1
	li	s3,0
	srli	a1,s2,59
	slli	a7,s3,5
	or	a7,a1,a7
	slli	a6,s2,5
	lw	a1,-76(s0)
	slli	a1,a1,2
	addi	a1,a1,15
	srli	a1,a1,4
	slli	a1,a1,4
	sub	sp,sp,a1
	mv	a1,sp
	addi	a1,a1,3
	srli	a1,a1,2
	slli	a1,a1,2
	sd	a1,-96(s0)
	lw	a1,-76(s0)
	addi	a1,a1,-1
	sd	a1,-104(s0)
	lw	a1,-76(s0)
	mv	t5,a1
	li	t6,0
	srli	a1,t5,59
	slli	a3,t6,5
	or	a3,a1,a3
	slli	a2,t5,5
	lw	a3,-76(s0)
	mv	t3,a3
	li	t4,0
	srli	a3,t3,59
	slli	a5,t4,5
	or	a5,a3,a5
	slli	a4,t3,5
	lw	a5,-76(s0)
	slli	a5,a5,2
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	sub	sp,sp,a5
	mv	a5,sp
	addi	a5,a5,3
	srli	a5,a5,2
	slli	a5,a5,2
	sd	a5,-112(s0)
	call	read_input
	sd	a0,-120(s0)
	sw	zero,-84(s0)
	j	.L24
.L25:
	lw	a5,-84(s0)
	slli	a5,a5,2
	ld	a4,-120(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	ld	a4,-96(s0)
	lw	a5,-84(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	fsw	fa5,0(a5)
	lw	a5,-84(s0)
	slli	a5,a5,2
	ld	a4,-120(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	ld	a4,-112(s0)
	lw	a5,-84(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	fsw	fa5,0(a5)
	lw	a5,-84(s0)
	addiw	a5,a5,1
	sw	a5,-84(s0)
.L24:
	lw	a4,-84(s0)
	lw	a5,-76(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L25
	addi	a4,s0,-132
	lw	a3,-76(s0)
	lw	a5,-76(s0)
	mv	a2,a5
	ld	a1,-96(s0)
	ld	a0,-112(s0)
	call	correlation
	sd	a0,-128(s0)
	lw	a5,-76(s0)
	mv	a2,a5
	lui	a5,%hi(.LC7)
	addi	a1,a5,%lo(.LC7)
	ld	a0,-128(s0)
	call	write_output
	sw	zero,-80(s0)
	j	.L26
.L27:
	lw	a5,-76(s0)
	mv	a2,a5
	ld	a1,-96(s0)
	ld	a0,-112(s0)
	call	running_time
	lw	a5,-80(s0)
	addiw	a5,a5,1
	sw	a5,-80(s0)
.L26:
	lw	a5,-80(s0)
	sext.w	a4,a5
	li	a5,4
	ble	a4,a5,.L27
	ld	a0,-128(s0)
	call	free
	li	a5,0
	mv	sp,s1
	mv	a0,a5
	addi	sp,s0,-160
	ld	ra,152(sp)
	ld	s0,144(sp)
	ld	s1,136(sp)
	ld	s2,128(sp)
	ld	s3,120(sp)
	ld	s4,112(sp)
	ld	s5,104(sp)
	addi	sp,sp,160
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
.LC4:
	.word	0
	.word	1093567616
	.align	3
.LC5:
	.word	0
	.word	1078525952
	.ident	"GCC: (GNU) 10.3.1 20210422 (Red Hat 10.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
