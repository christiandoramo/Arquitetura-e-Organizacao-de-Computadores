.data
	idade: .word 66
.text
	li $v0, 1 # instru��o para imprime inteiro
	lw $a0, idade # carrega uma word para $a0
	syscall