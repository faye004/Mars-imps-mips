.text
.globl main
main:
    # Load n into $a0
	li $v0, 5
	syscall
	move $a0, $v0
    # Call fibonacci_recursive
	jal fibonacci_recursive
    # Print the returned value
	move $a0, $v0
	li $v0, 1
	syscall
    # Exit
    li $v0, 10
	syscall

fibonacci_recursive:
    # Return fibonacci(n) recursively using the stack
    li $t0, 0
    li $t1, 0
    li $t2, 0
    
    #caso base 0-1
    ble $a0, 1, BASE_CASE
    
    #incrementa stack
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    subi $a0, $a0, 1
    #RECURSIVE CALL -1
    jal fibonacci_recursive
    sw $v0, 4($sp)
    subi $a0, $a0, 1
    lw $t0, 4($sp)
    #RECURSIVE CALL -2
    jal fibonacci_recursive
C0:    sw $v0, 0($sp)
    lw $t1, 0($sp)
    
    add $v0, $v0, $t0
RETURN:    add $v0, $v0, $t1
    
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra
    
    
    
    #caso base 0-1
BASE_CASE:ble $a0, $zero, CASE_0
	
    li $t1, 0
	
j RETURN#C1
    
      
CASE_0: li $v0, 0
li $t0, 0
    li $t1, 0
	
j RETURN # C0

 
    
    
    
    
    
