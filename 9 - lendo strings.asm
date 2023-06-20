.data
	meuNome: .space 50 # bytes(1 caractere = 1 byte) reservados a string
	pergunta: .asciiz "Qual é o seu nome: "
	saudacao: .asciiz "Olá!, "
.text
	#pergunta
	li $v0, 4 #imprime string
	la $a0, pergunta # carrega pergunta em a0
	syscall

	li $v0, 8 #lê uma string
	la $a0, meuNome # le variavel na memoriaRam
	la $a1, 50 # numero  debytes reservados em a1
	syscall # o valor fica em a0 e não v0 diferente da leitura de inteiro
	
	#saudacao
	li $v0, 4
	la $a0, saudacao
	syscall
	
	#Imprimindo variavel pos atribuição
	li $v0, 4
	la $a0, meuNome
	syscall
	
	li $v0, 10 # fim do programa
	