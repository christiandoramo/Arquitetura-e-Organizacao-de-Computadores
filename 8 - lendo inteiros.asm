.data
	saudacao: .asciiz "Forneça sua Idade em anos: "
	resposta: .asciiz "Sua idade em dias é: "
.text
	li $v0, 4 #imprimindo string
	la $a0, saudacao
	syscall
	
	li $v0, 5 # lendo inteiro
	syscall
	
	move $t0, $v0 # move valor na instrução v0 para t0
	
	li $v0, 4 #imprimindo string
	la $a0, resposta
	syscall
	
	li $v0, 1
	
	mul $s0, $t0, 365
	mflo $a0
	syscall