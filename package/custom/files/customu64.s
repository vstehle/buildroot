	.text
	.global	main

main:	ldr	x10, =9999999
	mov	x0, 1		// val
	mov	x1, 3		// n1
	mov	x2, 3		// n2
	mov	x3, 3		// n3
	mov	x4, 3		// n4
	mov	x5, 3		// n5
	mov	x6, 3		// n6
	mov	x7, 3		// n7
	mov	x8, 3		// n8

loop:	subs	x10, x10, #1
	mul	x1, x1, x0
	mul	x2, x2, x0
	mul	x3, x3, x0
	mul	x4, x4, x0
	mul	x5, x5, x0
	mul	x6, x6, x0
	mul	x7, x7, x0
	mul	x8, x8, x0
	bne	loop

	mov	x0, #0
	ret
