.data
array_data:  .space 40
size_prompt: .asciiz "How many integers do you want to enter? (max 10): "
item_prompt: .asciiz "Enter an integer: "
output_msg:  .asciiz "Array: "
space_msg:   .asciiz " "

.text
.globl main
main:
    # Read N
	li $v0, 4
	la $a0, size_prompt
	syscall
	li $v0, 5
	syscall
	
	move $t0, $a0
	
	lw $t1, size_prompt
	li $t2, 0
    # Read N integers into the array
LETTURA:li $v0, 4
	la $a0, item_prompt
	syscall
	li $v0, 5
	syscall
	
	move $s0, $a0
	
	addi $s0, $s0, 4
	addi $t2, $t2, 1
	bne $t2, $t1, LETTURA

    # Print the array contents

    # Exit
li $v0, 10
syscall
