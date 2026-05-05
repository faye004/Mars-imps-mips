.data
array_data: .word 1, 2, 3, 4, 5
array_size: .word 5
result_msg: .asciiz "Sum: "

.text
.globl main
main:
    # Visit the array with a loop
    la $s0, array_data
    lw $t9, array_size
    li $t8, 0
    
    
LOOP1:	lw $t0, 0($s0)
	addi $s0, $s0, 4
	addi $t8, $t8, 1
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	bne $t8, $t9, LOOP1
	

    # Sum all elements
LOOP2:	lw $t0, 0($s0)
	subi $s0, $s0, 4
	subi $t8, $t8, 1
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	bne $t8, 1, LOOP1

    # Print the result

    # Exit
li $v0, 10
syscall