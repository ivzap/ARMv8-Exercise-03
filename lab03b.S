.section .text
.globl lab03b

lab03b:
	ADD X0, XZR, XZR // zero out
	
	ADRP X1, UIN // load page address
	ADD X1, X1, :lo12:UIN // load lower 12 bits of UIN address
	LDUR X2, [X1, 0x0] // load val of UIN in X2
	SUBS XZR, X0, #10 // not needed 
	B.LT loop

loop:
	SUBS XZR, X0, #10 // are we less than 10?
	B.GE end // checks cond
	SUB X2, X2, #1 // subtract 1 from the UIN
	ADD X0, X0, #1 // i + 1
	B loop // continue to loop
 

end:
	STUR X2, [X1, 0x0] // store X2 into UIN
	BR X30


.section .data

UIN: .quad 0x0000000000000021
