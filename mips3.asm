.data
input_msg: .asciiz "Enter three integers: "
avg_msg:   .asciiz "Integer average: "

.text
.globl main
main:
    # Read three integers
	li $v0, 4
	la $a0, input_msg
	syscall
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, input_msg
	syscall
	li $v0, 5
	syscall
	
	move $t1, $v0
	li $v0, 4
	la $a0, input_msg
	syscall
	li $v0, 5
	syscall
	
	move $t2, $v0
	
    # Compute their sum
	add $s0, $t0, $t1
	add $s0, $s0, $t2
	
    # Divide the sum by 3
    	li $s1, 3
	div $s0, $s1
	mflo $s2   # prende il quoziente (LO)
	mfhi $s3   # prende il resto (HI)
    # Print the integer average
	li $v0, 4
	la $a0, avg_msg
	syscall
	move $a0, $s2
	li $v0, 1
	syscall
    # Exit
	li $v0, 10
	syscall