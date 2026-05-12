.data
array_data: .word 1, 2, 3, 4, 5, 6
result_msg: .asciiz "Even values: "

.text
.globl main

main:
    # Pass array address and size
    la $a0, array_data
    li $a1, 6

    jal count_even_function

    # Save result
    move $t0, $v0

    # Print message
    li $v0, 4
    la $a0, result_msg
    syscall

    # Print result
    move $a0, $t0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall


count_even_function:
    # v0 = counter
    li $v0, 0

    # t1 = index
    li $t1, 0

COUNT_EVEN:
    lw $t0, 0($a0)

    # Check if even
    andi $t2, $t0, 1

    # If odd skip increment
    bne $t2, $zero, SKIP

    addi $v0, $v0, 1

SKIP:
    addi $a0, $a0, 4
    addi $t1, $t1, 1

    bne $t1, $a1, COUNT_EVEN

    jr $ra