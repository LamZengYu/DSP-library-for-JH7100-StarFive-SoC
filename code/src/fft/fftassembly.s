	.file	"fftfinal.c"
	.option nopic
	.text
	.align	1
	.globl	fft
	.type	fft, @function
fft:
	addi	sp,sp,-128
	sd	ra,120(sp)
	sd	s0,112(sp)
	addi	s0,sp,128
	sd	a0,-104(s0)
	mv	a5,a2
	sd	a1,-112(s0)
	sw	a5,-116(s0)
	srliw	a4,a5,31
	sw	a5,-24(s0)
	addw	a5,a4,a5
	sraiw	a5,a5,1
	sext.w	a5,a5
	sw	a5,-20(s0)
	li	a5,1
	sw	a5,-28(s0)
	j	.L2
.L9:
	lw	a4,-20(s0)
	lw	a5,-28(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bleu	a4,a5,.L4
	lwu	a5,-20(s0)
	ld	a4,-104(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	flw	fa5,0(a5)
	lwu	a5,-20(s0)
	fsw	fa5,-80(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	lwu	a5,-28(s0)	
	fsw	fa5,-84(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a4,a4,a5
	lwu	a5,-20(s0)
	ld	a3,-104(s0)
	slli	a5,a5,2
	flw	fa5,0(a4)
	add	a5,a3,a5
	fsw	fa5,0(a5)
	lwu	a5,-28(s0)
	ld	a4,-112(s0)
	slli	a5,a5,2
	add	a4,a4,a5
	lwu	a5,-20(s0)
	ld	a3,-112(s0)
	slli	a5,a5,2
	flw	fa5,0(a4)
	add	a5,a3,a5
	fsw	fa5,0(a5)
	lwu	a5,-28(s0)
	ld	a4,-104(s0)
	slli	a5,a5,2
	flw	fa5,-80(s0)
	add	a5,a4,a5
	fsw	fa5,0(a5)
	lwu	a5,-28(s0)
	ld	a4,-112(s0)
	slli	a5,a5,2
	flw	fa5,-84(s0)
	add	a5,a4,a5
	fsw	fa5,0(a5)
	j	.L4
.L5:
	lw	a5,-24(s0)
	not	a5,a5
	sext.w	a4,a5
	lw	a5,-20(s0)
	and	a5,a5,a4
	sw	a5,-20(s0)
.L4:
	lw	a5,-24(s0)
	srliw	a5,a5,1
	lw	a4,-24(s0)
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	and	a5,a4,a5
	sext.w	a5,a5
	bne	a5,zero,.L5
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-116(s0)
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-20(s0)
	sext.w	a5,a5
	bleu	a5,a4,.L7
	lwu	a5,-20(s0)
	ld	a4,-104(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	flw	fa5,0(a5)
	lwu	a5,-20(s0)
	fsw	fa5,-80(s0)
	slli	a5,a5,2
	ld	a4,-112(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	lw	a5,-28(s0)
	fsw	fa5,-84(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	slli	a5,a5,32
	ld	a4,-104(s0)
	srli	a5,a5,32
	slli	a5,a5,2
	add	a4,a4,a5
	lwu	a5,-20(s0)
	ld	a3,-104(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	flw	fa5,0(a4)
	fsw	fa5,0(a5)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	slli	a5,a5,32
	ld	a4,-112(s0)
	srli	a5,a5,32
	slli	a5,a5,2
	add	a4,a4,a5
	lwu	a5,-20(s0)
	ld	a3,-112(s0)
	slli	a5,a5,2
	flw	fa5,0(a4)
	add	a5,a3,a5
	fsw	fa5,0(a5)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	slli	a5,a5,32
	ld	a4,-104(s0)
	srli	a5,a5,32
	slli	a5,a5,2
	add	a5,a4,a5
	flw	fa5,-80(s0)
	fsw	fa5,0(a5)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	slli	a5,a5,32
	ld	a4,-112(s0)
	srli	a5,a5,32
	slli	a5,a5,2
	add	a5,a4,a5
	flw	fa5,-84(s0)
	fsw	fa5,0(a5)
	j	.L7
.L8:
	lw	a5,-24(s0)
	not	a5,a5
	sext.w	a4,a5
	lw	a5,-20(s0)
	and	a5,a5,a4
	sw	a5,-20(s0)
.L7:
	lw	a5,-24(s0)
	srliw	a5,a5,1
	sw	a5,-24(s0)
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	and	a5,a4,a5
	sext.w	a5,a5
	bne	a5,zero,.L8
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	or	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-116(s0)
	sw	a5,-24(s0)
	lw	a5,-28(s0)
	addiw	a5,a5,2
	sw	a5,-28(s0)
.L2:
	lw	a5,-116(s0)
	addiw	a5,a5,-2
	sext.w	a5,a5
	sext.w	a4,a5
	lw	a5,-28(s0)
	sext.w	a5,a5
	bltu	a5,a4,.L9
	lui	a5,%hi(.LC0)
	flw	fa5,%lo(.LC0)(a5)
	fsw	fa5,-52(s0)
	li	a5,1
	sw	a5,-40(s0)
	j	.L10
.L17:
	lw	a5,-40(s0)
	slliw	a5,a5,1
	sw	a5,-56(s0)
	lui	a5,%hi(.LC1)
	flw	fa5,%lo(.LC1)(a5)
	fsw	fa5,-32(s0)
	sw	zero,-36(s0)
	lw	a5,-40(s0)
	fcvt.s.wu	fa5,a5
	fsw	fa5,-60(s0)
	sw	zero,-44(s0)
	j	.L11
.L16:
	lw	a5,-44(s0)
	fcvt.s.wu	fa4,a5
	lui	a5,%hi(.LC1)
	flw	fa5,%lo(.LC1)(a5)
	fadd.s	fa4,fa4,fa5
	flw	fa5,-52(s0)
	fmul.s	fa4,fa4,fa5
	flw	fa5,-60(s0)
	fdiv.s	fa5,fa4,fa5
	fsw	fa5,-64(s0)
	lw	a5,-44(s0)
	sw	a5,-48(s0)
	j	.L12
.L13:
	lw	a4,-48(s0)
	lw	a5,-40(s0)
	addw	a5,a4,a5
	sw	a5,-68(s0)
	lwu	a5,-68(s0)
	ld	a4,-104(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	flw	fa4,0(a5)
	flw	fa5,-32(s0)
	fmul.s	fa4,fa4,fa5
	lwu	a5,-68(s0)
	ld	a4,-112(s0)
	slli	a5,a5,2
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
	ld	a4,-112(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	flw	fa3,0(a5)
	flw	fa5,-32(s0)
	fmadd.s fa5,fa3,fa5,fa4
	lwu	a5,-48(s0)
	fsw	fa5,-76(s0)
	slli	a5,a5,2
	ld	a4,-104(s0)
	add	a5,a4,a5
	flw	fa4,0(a5)
	lwu	a5,-68(s0)
	ld	a4,-104(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	flw	fa5,-72(s0)
	fsub.s	fa5,fa4,fa5
	fsw	fa5,0(a5)
	lwu	a5,-48(s0)
	ld	a4,-112(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	flw	fa4,0(a5)
	lwu	a5,-68(s0)
	ld	a4,-112(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	flw	fa5,-76(s0)
	fsub.s	fa5,fa4,fa5
	fsw	fa5,0(a5)
	lwu	a5,-48(s0)
	ld	a4,-104(s0)
	slli	a5,a5,2
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
.L12:
	lw	a5,-48(s0)
	sext.w	a5,a5
	lw	a4,-116(s0)
	bltu	a5,a4,.L13
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sext.w	a4,a5
	lw	a5,-40(s0)
	sext.w	a5,a5
	beq	a5,a4,.L18
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
	j	.L15
.L18:
	nop
.L15:
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L11:
	lw	a4,-44(s0)
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bltu	a4,a5,.L16
	lw	a5,-40(s0)
	slliw	a5,a5,1
	sw	a5,-40(s0)
.L10:
	lw	a4,-116(s0)
	lw	a5,-40(s0)
	sext.w	a5,a5
	bltu	a5,a4,.L17
	nop
	nop
	ld	ra,120(sp)
	ld	s0,112(sp)
	addi	sp,sp,128
	jr	ra
	.size	fft, .-fft
	.section	.rodata
	.align	3
.LC3:
	.string	"r"
	.align	3
.LC2:
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
	lui	a5,%hi(.LC2)
	addi	a5,a5,%lo(.LC2)
	ld	a4,0(a5)
	sd	a4,-72(s0)
	ld	a4,8(a5)
	sd	a4,-64(s0)
	lhu	a5,16(a5)
	sh	a5,-56(s0)
	addi	a4,s0,-72
	lui	a5,%hi(.LC3)
	addi	a1,a5,%lo(.LC3)
	mv	a0,a4
	call	fopen
	sd	a0,-32(s0)
	sw	zero,-20(s0)
	j	.L20
.L21:
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L20:
	addi	a5,s0,-104
	ld	a2,-32(s0)
	li	a1,30
	mv	a0,a5
	call	fgets
	mv	a5,a0
	bne	a5,zero,.L21
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
	lui	a5,%hi(.LC3)
	addi	a1,a5,%lo(.LC3)
	mv	a0,a4
	call	fopen
	sd	a0,-32(s0)
	j	.L22
.L24:
	addi	a5,s0,-136
	li	a1,10
	mv	a0,a5
	call	strchr
	sd	a0,-48(s0)
	ld	a5,-48(s0)
	beq	a5,zero,.L23
	ld	a5,-48(s0)
	sb	zero,0(a5)
.L23:
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
.L22:
	addi	a5,s0,-136
	ld	a2,-32(s0)
	li	a1,30
	mv	a0,a5
	call	fgets
	mv	a5,a0
	bne	a5,zero,.L24
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
.LC4:
	.string	"w"
	.align	3
.LC5:
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
	lui	a5,%hi(.LC4)
	addi	a1,a5,%lo(.LC4)
	ld	a0,-48(s0)
	call	fopen
	sd	a0,-32(s0)
	sw	zero,-20(s0)
	j	.L27
.L28:
	lw	a5,-20(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a2,fa5
	lui	a5,%hi(.LC5)
	addi	a1,a5,%lo(.LC5)
	ld	a0,-32(s0)
	call	fprintf
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L27:
	lw	a4,-20(s0)
	lw	a5,-52(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L28
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
.LC8:
	.string	"Average time: %fms\n"
	.text
	.align	1
	.globl	running_time
	.type	running_time, @function
running_time:
	addi	sp,sp,-80
	sd	ra,72(sp)
	sd	s0,64(sp)
	addi	s0,sp,80
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	mv	a5,a2
	sw	a5,-68(s0)
	call	clock
	sd	a0,-32(s0)
	sw	zero,-20(s0)
	j	.L30
.L31:
	lw	a5,-68(s0)
	mv	a2,a5
	ld	a1,-64(s0)
	ld	a0,-56(s0)
	call	fft
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L30:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,99
	ble	a4,a5,.L31
	call	clock
	sd	a0,-40(s0)
	ld	a4,-40(s0)
	ld	a5,-32(s0)
	sub	a5,a4,a5
	fcvt.d.l	fa4,a5
	lui	a5,%hi(.LC6)
	fld	fa5,%lo(.LC6)(a5)
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-48(s0)
	ld	a4,-40(s0)
	ld	a5,-32(s0)
	sub	a5,a4,a5
	fcvt.d.l	fa4,a5
	lui	a5,%hi(.LC6)
	fld	fa5,%lo(.LC6)(a5)
	fdiv.d	fa5,fa4,fa5
	fsd	fa5,-48(s0)
	fld	fa4,-48(s0)
	lui	a5,%hi(.LC7)
	fld	fa5,%lo(.LC7)(a5)
	fmul.d	fa5,fa4,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC8)
	addi	a0,a5,%lo(.LC8)
	call	printf
	nop
	ld	ra,72(sp)
	ld	s0,64(sp)
	addi	sp,sp,80
	jr	ra
	.size	running_time, .-running_time
	.section	.rodata
	.align	3
.LC9:
	.string	"fftcmagnitude.txt"
	.align	3
.LC10:
	.string	"fftcphase.txt"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	addi	s0,sp,96
	li	t0,-4096
	add	sp,sp,t0
	mv	t3,a0
	li	a0,-4096
	addi	s1,s0,-32
	add	a0,s1,a0
	sd	a1,-64(a0)
	li	a1,-4096
	addi	a0,s0,-32
	add	a1,a0,a1
	mv	a0,t3
	sw	a0,-52(a1)
	mv	a1,sp
	mv	s1,a1
	li	a1,1024
	sw	a1,-44(s0)
	lw	a1,-44(s0)
	addi	a1,a1,-1
	sd	a1,-56(s0)
	lw	a1,-44(s0)
	mv	t1,a1
	li	t2,0
	srli	a1,t1,59
	slli	a3,t2,5
	or	a3,a1,a3
	slli	a2,t1,5
	lw	a3,-44(s0)
	mv	a6,a3
	li	a7,0
	srli	a3,a6,59
	slli	a5,a7,5
	or	a5,a3,a5
	slli	a4,a6,5
	lw	a5,-44(s0)
	slli	a5,a5,2
	addi	a5,a5,15
	srli	a5,a5,4
	slli	a5,a5,4
	sub	sp,sp,a5
	mv	a5,sp
	addi	a5,a5,3
	srli	a5,a5,2
	slli	a5,a5,2
	sd	a5,-64(s0)
	li	a5,-4096
	addi	a4,s0,-32
	add	a5,a4,a5
	addi	a5,a5,-40
	li	a4,4096
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	call	read_input
	sd	a0,-72(s0)
	sw	zero,-40(s0)
	j	.L33
.L34:
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-72(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	ld	a4,-64(s0)
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	fsw	fa5,0(a5)
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L33:
	lw	a4,-40(s0)
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L34
	lw	a4,-44(s0)
	li	a5,-4096
	addi	a5,a5,-40
	addi	a3,s0,-32
	add	a5,a3,a5
	mv	a2,a4
	mv	a1,a5
	ld	a0,-64(s0)
	call	fft
	li	a2,1024
	lui	a5,%hi(.LC9)
	addi	a1,a5,%lo(.LC9)
	ld	a0,-64(s0)
	call	write_output
	li	a5,-4096
	addi	a5,a5,-40
	addi	a4,s0,-32
	add	a4,a4,a5
	li	a2,1024
	lui	a5,%hi(.LC10)
	addi	a1,a5,%lo(.LC10)
	mv	a0,a4
	call	write_output
	sw	zero,-36(s0)
	j	.L35
.L36:
	lw	a4,-44(s0)
	li	a5,-4096
	addi	a5,a5,-40
	addi	a3,s0,-32
	add	a5,a3,a5
	mv	a2,a4
	mv	a1,a5
	ld	a0,-64(s0)
	call	running_time
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L35:
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,4
	ble	a4,a5,.L36
	mv	sp,s1
	li	a5,0
	mv	a0,a5
	li	t0,-4096
	addi	t0,t0,-96
	add	sp,s0,t0
	li	t0,4096
	add	sp,sp,t0
	ld	ra,88(sp)
	ld	s0,80(sp)
	ld	s1,72(sp)
	addi	sp,sp,96
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	2
.LC0:
	.word	-1068953637
	.align	2
.LC1:
	.word	1065353216
	.align	3
.LC6:
	.word	0
	.word	1093567616
	.align	3
.LC7:
	.word	0
	.word	1076101120
	.ident	"GCC: (GNU) 10.3.1 20210422 (Red Hat 10.3.1-1)"
	.section	.note.GNU-stack,"",@progbits
