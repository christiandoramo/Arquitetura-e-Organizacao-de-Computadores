# nome: Christian Oliveira do Ramo
# data: 27/07/2023
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2

# Exercício de Leitura

.data
	enderecoArquivo: .asciiz "C:/Users/chris/Desktop/AOC/exercicioremoto2707/teste-escrita.txt" 
	textoLido: .space 4096 # 4kb o arquivo do exercicio vale 1kb aprox
.text
	#abrindo arquivo
	li $v0, 13 # abrir arquivo
	la $a0, enderecoArquivo # a0 = endereco
	li $a1,  0 # flag - a1 0 é modo leitura, a1 1 é modo escrita
	syscall # descritor do arquivo vai pra v0
	
	move $t0, $v0  # salva descritor em t0 se t0 recebeu -1 arquivo nao foi encotrado
	
	# lendo arquivo
	move $a0, $t0  # descritor de v0/t0 vai para a0
	li $v0, 14 # ler conteudo do arquivo descrito em v0
	la $a1, textoLido # a1 é o endereco que recebe o conteudo do descritor
	li $a2, 4096 # usando buffer maior ou igual ao arquivo
	syscall 
	
	# printando o conteudo lido
	li $v0, 4
	move $a0, $a1
	syscall
	
	# fechando arquivo
	li $v0, 16 # feche o arquivo
	move $a0, $t0 # descritor do arquivo para fechar
	syscall
	
	li $v0, 10
	syscall
