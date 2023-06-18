.text
	addi $t1, $zero, 200

	srl $s0, $t1, 1 # shift right
		
	li $v0, 3
	move $a0, $s0
	syscall
	
# shift left -> multiplica por potencias de 2 simplesmente andando bits para esquerda
	# sll $t0, $t1, nCasas
# shift right -> divide por potencias de 2 simplesmente andando bits para direita
	# srl $t0, $t1, nCasas