.data
	minhaString: .asciiz "Ol�, mundouuu"
.text
	li $v0, 4 # imprime string
	la $a0, minhaString # indica onde est� a string para impressao
	syscall