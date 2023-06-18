.text
	addi $t1, $zero, 10

	sll $s0, $t1, 10 # shift left
		
	li $v0, 1
	move $a0, $s0
	syscall
	
# shift left -> multiplica por potencias de 2 simplesmente andando bits para esquerda
	# sll $t0, $t1, nCasas
# shift right -> divide por potencias de 2 simplesmente andando bits para direita
	# srl $t0, $t1, nCasas