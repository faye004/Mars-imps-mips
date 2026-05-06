.data
prompt_msg: .asciiz "Enter an integer: "
even_msg:   .asciiz "Even"
odd_msg:    .asciiz "Odd"

.text
.globl main
main:
    # Read an integer
	li $v0, 4
	la $a0, prompt_msg
	syscall
	li $v0, 5
	syscall
	
	move $t0, $v0
    # Check whether it is even or odd
	li $t1, 2
	div $t0, $t1
	mfhi $s0   # prende il resto (HI)
	beq $s0, $zero, EVEN
    # Print the correct message
	li $v0, 4
	la $a0, odd_msg
	syscall
    # Exit
EXIT:	li $v0, 10
	syscall
	
EVEN:	li $v0, 4
	la $a0, even_msg
	syscall
	j EXIT