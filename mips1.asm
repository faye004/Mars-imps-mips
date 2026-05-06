.data # puoi aggiungere in quale indirizzo salvare i dati facendo in questa linea <addr>
# puoi salvare (load) dei tipi di dati uguali a ascii, word, asciiz, half, byte
#.space operatore usato per riservare tot spazio nella memoria
#syscall chiama l'api del sistema operativo per dirgli che deve stampare una cosa a schermo
#li $v0, 4 comando che dice al SO che devestampare una stringa
#li $v0, 1 comando che dice al SO che devestampare un int
#li $v0, 2 comando che dice al SO che devestampare una float
#li $v0, 3 comando che dice al SO che devestampare una double
#li $v0, 5 comando che dice al SO che deve leggere una int

#li $v0, 6 comando che dice al SO che deve leggere una float

#li $v0, 7 comando che dice al SO che deve leggere una double

#li $v0, 8 comando che dice al SO che deve leggere una stringa

#li $v0, 10 exit program instruction
prompt_msg: .asciiz "Hello! Enter an integer: "
result_msg: .asciiz "You entered: "

.text
.globl main
main:
    # Print the prompt message
    li $v0, 4
    la $a0, prompt_msg
    syscall

    # Read an integer from standard input
   li $v0, 5
   la $a0, 

    # Save the input value

    # Print the result label
  
    # Print the stored integer
    
    # Exit the program
  