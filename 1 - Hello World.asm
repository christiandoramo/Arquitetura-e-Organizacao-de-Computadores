.data
	minhaString: .asciiz "Olá, mundouuu"
.text
	li $v0, 4 # imprime string
	la $a0, minhaString # indica onde está a string para impressao
	syscall