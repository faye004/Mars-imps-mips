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
	li $t8, 0
	
#ripristono puntatore complicato e spagliato, guarda gli altri
#RIPRISTINA_ARRAY:
#		addi $s0, $s0, -4
#		addi $t8, $t8, 1
#		bne $t8, $t9, RIPRISTINA_ARRAY
    
    #suoluzione mia veloce
    #li $t0, -4
    #mul $t0, $t0, $t9
    #add $s0, $s0, $t0
    
    #soluzione più veloce
    #li $t0, 4
#mul $t0, $t0, $t9   # t0 = size * 4
#sub $s0, $s0, $t0   # s0 torna indietro
    
    #oppure usando lo shift
    sll $t0, $t9, 2   # t0 = t9 * 4
sub $s0, $s0, $t0  #ripristini il puntatore

 # Sum all elements
    li $t1, 0
    li $t8, 0
    
SUM_ARRAY:	lw $t0, 0($s0)
		add $t1, $t1, $t0
		addi $s0, $s0, 4
		addi $t8, $t8, 1
		bne $t8, $t9, SUM_ARRAY

    # Print the result
    li $v0, 4
    la $a0, result_msg
    syscall
    move $a0, $t1
li $v0, 1
syscall
    # Exit
li $v0, 10
syscall
