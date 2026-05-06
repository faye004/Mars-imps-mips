.data
first_prompt:  .asciiz "Enter the first integer: "
second_prompt: .asciiz "Enter the second integer: "
sum_msg:       .asciiz "Sum: "
diff_msg:      .asciiz "Difference: "
prod_msg:      .asciiz "Product: "
newline_msg:   .asciiz "\n"

.text
.globl main
main:
    # Read two integers
    	li $v0, 4
	la $a0, first_prompt
	syscall
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, second_prompt
	syscall
	li $v0, 5
	syscall
	
	move $t1, $v0
	
    # Compute sum, difference, and product
	add $s0, $t0, $t1
	sub $s1, $t0, $t1
	mul $s2, $t0, $t1
	
    # Print all results
	li $v0, 4
	la $a0, sum_msg
	syscall
	move $a0, $s0
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, newline_msg
	syscall
	
	li $v0, 4
	la $a0, diff_msg
	syscall
	move $a0, $s1
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, newline_msg
	syscall
	
	li $v0, 4
	la $a0, prod_msg
	syscall
	move $a0, $s2
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, newline_msg
	syscall
    # Exit

	li $v0, 10
	syscall