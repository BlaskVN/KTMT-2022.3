#Laboratory Exercise 5, Assignment 5
.data
string: 	.space 21 	# Max 21 ki tu, 1 byte cho 1 ki tu, 1 byte cho '\0'
reverse: 	.space 21	
Mssg: 		.asciiz "Input string: "
Input: 		.asciiz "\nString was: "
Output: 	.asciiz "\nRevese string was: "
Error: 	.asciiz "String error!"

.text
	li	$v0, 4
	la	$a0, Mssg       #Print message
	syscall
	
	la	$a0, string     #get address of string
	la	$a1, reverse
	
	li	$s0, 0		# i = 0
	li	$s1, 0		# j = 0
	
CheckLength:		
	beq	$s0, 20, Sub    # If length >= 20 then exit
In:
	li $v0, 12
	syscall
	
CheckEnter:
	beq	$v0, 10, CheckEmpty     # If enter then stop loop
load:
	add	$t1, $s0, $a0	# $t1 = i + x[0]
	sb	$v0, 0($t1)	# x[i] = $v0 = ki tu vua nhap	
	nop
	addi	$s0, $s0, 1	# i += 1
	j	CheckLength
	nop

CheckEmpty:
	bgtz $s0, Sub		# If i > 0 then string is not empty
	li $v0, 55 		# Display dialog string error
	la $a0, Error 
	la $a1, 0 
	syscall	
	j	out
	
Sub:
	sub	$s0, $s0, 1	# i -= 1 get last char of string
makeReverse:
	sub 	$s2, $s0, $s1	# $s2 = t = i - j
	bltz 	$s2, out	# If $s2 = t < 0 then out
	add	$t1, $s2, $a0	# $t1 = t + x[0]
	lb 	$t2, 0($t1)	# $t2 = x[t], t hien tai dang co gia tri string.size() - 1
	add 	$t3, $s1, $a1 	# $t3 = j + y[0]	
	sb	$t2, 0($t3)	# y[j] = $t2 = x[t]
	nop
	addi 	$s1, $s1, 1 	# j += 1
	j 	makeReverse
	
out:	                        # print the reverse string
	li	$v0, 4
	la	$a0, Input
	syscall
	
	li	$v0, 4
	la	$a0, string
	syscall

	li	$v0, 4
	la	$a0, Output     
	syscall
	
	li	$v0, 4
	la	$a0, reverse    #Print reverse string
	syscall 
