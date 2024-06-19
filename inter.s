mv	a5, a2
sw	a5, -116(s0)
lw    a5, -116(s0)
srliw	a4, a5, 31
/*Operations that change the value of a5
sw	a5, -20(s0)
lw    a5, -116(s0)
sw	a5, -24(s0)
li	a5, 1
sw	a5, -28(s0)
