	.text
	.global	main

main:	ldr	x10, =9999999
	mov	w0, 1		// val
	mov	w1, 3		// n1
	mov	w2, 3		// n2
	mov	w3, 3		// n3
	mov	w4, 3		// n4
	mov	w5, 3		// n5
	mov	w6, 3		// n6
	mov	w7, 3		// n7
	mov	w8, 3		// n8

loop:	subs	x10, x10, #1
	mul	w1, w1, w0
	mul	w2, w2, w0
	mul	w3, w3, w0
	mul	w4, w4, w0
	mul	w5, w5, w0
	mul	w6, w6, w0
	mul	w7, w7, w0
	mul	w8, w8, w0
	bne	loop

	mov	x0, #0
	ret
