.data
	meuCaractere: .byte 'A' # um caractere possui 1 byte (255 )
.text
	li $v0, 4 # imprime char ou string
	la $a0, meuCaractere # lê o caractere a ser impresso
	syscall # se não estiver aqui a instrução v0 será a proxima $v0
	
	li $v0, 10 #encerra programa
	syscall # no caso essa proxima instrução é encerrar de encerrar o programa	
	# portanto o meuCaractere não seria impresso