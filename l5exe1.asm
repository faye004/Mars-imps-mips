.data
result_msg: .asciiz "Result: "

.text
.globl main
main:
    # Load two arguments in $a0 and $a1
 
	li $v0, 5
	syscall
	
	move $a0, $v0
	li $v0, 5
	syscall
	move $a1, $v0

    # Call sum_function
jal sum_function
    # Print the returned value
        move $t0, $v0
li $v0, 4
	la $a0, result_msg
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
    # Exit
	li $v0, 10
	syscall
sum_function:
    # Return a + b in $v0
    li $v0, 0
    add $v0, $a1, $a0
    jr $ra
