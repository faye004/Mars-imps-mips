.data
prompt_msg: .asciiz "Enter N: "
result_msg: .asciiz "Sum: "

.text
.globl main
main:
    # Read N
    li $v0, 4
    la $a0, prompt_msg
    syscall
    
    li $v0, 5
    syscall
    
    move $s0, $v0

    # Initialize counter and accumulator
    li $t0, 1
    li $s1, 0
    addi $t2, $s0, 1

    # Use a loop from 1 to N
LOOP:	add $s1, $s1, $t0
	addi $t0, $t0, 1
	
ACCUMULATOR:	bne $t0, $t2, LOOP


    # Print the sum
    li $v0, 4
    la $a0, result_msg
    syscall
    
    move $a0, $s1
    
    li $v0, 1
    syscall
    
    # Exit
li $v0, 10
syscall