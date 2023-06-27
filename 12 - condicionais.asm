# branch - ramifique (ou seja, salte para o label especificado caso...)
# ex: beq $a0, $a1, labelCasoTrueorFalse

# beq branch if equal
# bne branch if not equal
# blt branch if less than
# bgt branch if greater than
# ble branch if less or equal
# bge branch if greater or equal

.data
	msg: .asciiz "Digite um numero para eu saber se ele é par ou ímpar: "
	par: .asciiz "O número é par."
	impar: .asciiz "O número é ímpar."
.text
	li $v0, 4 # imprime ascii
	la $a0, msg # carrega var
	syscall
	
	li $v0, 5 # ler inteiro
	syscall
	
	li $t0, 2 # armazena 2 em t0
	
	div $v0, $t0 # divide v0 por t0
	
	mfhi $t1 # Movendo resto para t1
	
	# cjecando se a divisao por dois deu resto 0 (foi par)
	beq $t1, $zero, imprimeParImpar # comparando, comparado, labelParaPularCodigoAbaixo
	# imprimindo caso beq seja falso
		li $v0, 4 # imprime string
		la $a0, impar
		syscall
		
		li $v0, 10 # parando programa
		syscall
	imprimeParImpar:
		li $v0, 4 # imprime string
		la $a0, par
		syscall