.text
	li $t0, 12 # alocando Imediatamente um numero literal em t0
	addi $t1, $zero, 10
	# $s0 rececbera a multip.
	mul $s0, $t0, $t1 # s0 � resultado entre fun��es, t0 e t1 s�o temporarias dentro de fun��es

	li $v0, 1 # instru��o de impress�o de inteiro
	move $a0, $s0 # move o valor de s0 para a0 (o qual � usado pelo v0)
	syscall