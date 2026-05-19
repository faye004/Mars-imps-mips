.data
result_msg: .asciiz "Factorial: "

.text
.globl main
main:
    # Load n into $a0
li $v0, 5
syscall
move $a0, $v0

    # Call factorial_recursive
jal factorial_recursive
move $s0, $v0
    # Print the returned value
li $v0, 4
la $a0, result_msg
syscall
move $a0, $s0

li $v0, 1
syscall
    # Exit
li $v0, 10
syscall


factorial_recursive:

    # Caso base
    beq $a0, $zero, BASE_CASE

    # Salva contesto
    addi $sp, $sp, -8

    sw $ra, 4($sp)
    sw $a0, 0($sp)

    # Chiamata ricorsiva
    addi $a0, $a0, -1
    jal factorial_recursive

    # Ripristina contesto
    lw $a0, 0($sp)
    lw $ra, 4($sp)

    addi $sp, $sp, 8

    # Combina risultato
    mul $v0, $v0, $a0

    jr $ra

BASE_CASE:
    li $v0, 1
    jr $ra