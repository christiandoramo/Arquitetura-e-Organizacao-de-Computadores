.data
	meuCaractere: .byte 'A' # um caractere possui 1 byte (255 )
.text
	li $v0, 4 # imprime char ou string
	la $a0, meuCaractere # l� o caractere a ser impresso
	syscall # se n�o estiver aqui a instru��o v0 ser� a proxima $v0
	
	li $v0, 10 #encerra programa
	syscall # no caso essa proxima instru��o � encerrar de encerrar o programa	
	# portanto o meuCaractere n�o seria impresso