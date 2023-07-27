# nome: Christian Oliveira do Ramo
# data: 27/07/2023
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2


# Exercicio de Escrita

.data
	enderecoArquivo: .asciiz "C:/Users/chris/Desktop/AOC/exercicioremoto2707/teste-escrita.txt" 
	textoDigitado: .space 4096 # 4kb o arquivo do exercicio vale 1kb aprox
.text
	#abrindo arquivo
	li $v0, 13 # abrir arquivo
	la $a0, enderecoArquivo # a0 = endereco
	li $a1,  1 # flag - a1 0 é modo leitura, a1 1 é modo escrita
	syscall # descritor do arquivo vai pra v0
	
	move $t0, $v0  # salva descritor em t0 se t0 recebeu -1 arquivo nao foi encotrado
	
	# pedindo texto ao usuario
	li $v0, 8 # comando ler string
	la $a0, textoDigitado # carregando endere;o da string
	li $a1, 4096 # buffer do tamanho max da string
	syscall # lendo string do usuario com tamanho maximo 4kb
	
	
	# escrevendo no arquivo
	move $a0, $t0  # descritor de v0/t0 vai para a0
	li $v0, 15 # escreve conteudo no arquivo descrito em v0
	la $a1, textoDigitado # a1 recebe o endereco do conteudo a ser escrito no arquivo do descritor
	li $a2, 4096 # usando buffer maior ou igual ao arquivo
	syscall 
	
	# fechando arquivo
	li $v0, 16 # feche o arquivo
	move $a0, $t0 # descritor do arquivo para fechar
	syscall
	
	li $v0, 10
	syscall
