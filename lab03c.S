.section .text
.globl lab03c

lab03c:
	ADD X1 , XZR, XZR
	ADRP X2, my_array // starting address of array
	ADD X2, X2, :lo12:my_array
	ADD X3, X2, #0
	B loop
loop:
	SUBS XZR, X1, #10 // are we less than 10?
	B.GE end // checks cond
	STUR X0, [X3, 0x0]//my_array[i] = j	
	ADD X3, X3, 0x8
	ADD X1, X1, #1 // i + 1
	ADD X0, X0, #1 // j + 1
	B loop // continue to loop
 

end:
	BR X30


.section .data

my_array: .space 0x50
