In MIPS i registri sono divisi per convenzione in categorie.

I più importanti qui sono:

* `$t0 - $t9` → **temporary registers**

  * possono essere modificati liberamente
  * il chiamato NON deve ripristinarli

* `$s0 - $s7` → **saved registers**

  * se una funzione li modifica, deve salvarli e ripristinarli prima del `jr $ra`

Quindi quando dicevo “usa gli `$s`”, intendevo:

se vuoi conservare un valore importante durante la funzione (per esempio il puntatore iniziale dell’array), è più corretto metterlo in un registro `$s`.

Nel tuo codice hai fatto:

```asm
addi $a0, $a0, 4
```

quindi modifichi `$a0` mentre scorri l’array.

Poi alla fine fai:

```asm
sll $t0, $a1, 2
sub $a0, $a0, $t0
```

per ripristinarlo manualmente.

Funziona, ma è più pulito fare così:

```asm
move $s0, $a0
```

all’inizio della funzione, e usare `$s0` come puntatore.

Esempio:

```asm
count_even_function:

    move $s0, $a0   # salva indirizzo array

    li $v0, 0
    li $t1, 0

LOOP:
    lw $t0, 0($s0)

    andi $t2, $t0, 1
    bne $t2, $zero, SKIP

    addi $v0, $v0, 1

SKIP:
    addi $s0, $s0, 4
    addi $t1, $t1, 1

    bne $t1, $a1, LOOP

    jr $ra
```

Però attenzione: dato che `$s0` è un saved register, la convenzione MIPS dice che devi salvarlo nello stack e ripristinarlo.

Versione completamente corretta:

```asm
count_even_function:

    addi $sp, $sp, -4
    sw $s0, 0($sp)

    move $s0, $a0

    li $v0, 0
    li $t1, 0

LOOP:
    lw $t0, 0($s0)

    andi $t2, $t0, 1
    bne $t2, $zero, SKIP

    addi $v0, $v0, 1

SKIP:
    addi $s0, $s0, 4
    addi $t1, $t1, 1

    bne $t1, $a1, LOOP

    lw $s0, 0($sp)
    addi $sp, $sp, 4

    jr $ra
```

Questa è la vera convenzione MIPS:

* chi chiama può aspettarsi che gli `$s` rimangano invariati
* quindi il chiamato deve salvarli/ripristinarli.
