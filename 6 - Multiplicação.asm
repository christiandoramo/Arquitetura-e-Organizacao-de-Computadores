.text
	li $t0, 12 # alocando Imediatamente um numero literal em t0
	addi $t1, $zero, 10
	# $s0 rececbera a multip.
	mul $s0, $t0, $t1 # s0 é resultado entre funções, t0 e t1 são temporarias dentro de funções

	li $v0, 1 # instrução de impressão de inteiro
	move $a0, $s0 # move o valor de s0 para a0 (o qual é usado pelo v0)
	syscall