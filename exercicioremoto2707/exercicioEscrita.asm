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
	
	move $t1, $v0  # salva descritor em t1 se t0 recebeu -1 arquivo nao foi encotrado
	
	# pedindo texto ao usuario
	li $v0, 8 # comando ler string
	la $a0, textoDigitado # carregando endereco da string
	li $a1, 4096 # buffer do tamanho max da string
	syscall # lendo string do usuario com tamanho maximo 4kb
	
	
	jal strlen # pegando tamanho da string digitada em endereco a0
    	addi $t2, $v0, -1 # tamanho em lido menos o terminador /0
	
	
	# escrevendo no arquivo
	move $a0, $t1  # descritor de v0/t0 vai para a0
	li $v0, 15 # escreve conteudo no arquivo descrito em v0
	la $a1, textoDigitado # a1 recebe o endereco do conteudo a ser escrito no arquivo do descritor
	addi $a2, $t2, 0 # usando buffer do tamanho da string menos o /0
	syscall 
	
	# fechando arquivo
	li $v0, 16 # feche o arquivo
	move $a0, $t1 # descritor do arquivo para fechar
	syscall
	
	li $v0, 10 #fim
	syscall
	
strlen:
    # Recebe o endereço da string em $a0
    # Retorna o tamanho da string em $v0
    move $v0, $zero      # Inicializa o contador para zero

strloop:
    lb $t0, 0($a0)       # Carrega o caractere atual da string em $t0
    beq $t0, $zero, strend  # Se chegou ao final da string (null terminator), sai do loop
    addi $a0, $a0, 1     # Avança para o próximo caractere na string
    addi $v0, $v0, 1     # Incrementa o contador de caracteres
    j strloop            # Repete o loop

strend:
    jr $ra               # Retorna à função chamadora
