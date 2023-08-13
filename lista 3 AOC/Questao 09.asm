# nome: Christian Oliveira do Ramo

# grupo: Joao Lucas, Christian Oliveira,  Alexandre Vitor, Vinicius Vasconcelos
# data: 14/07/2023
# atividade: Lista 03 - Assembly MIPS
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2


.data
msgInicial:     .asciiz "Digite uma string: "
msgFinal:     .asciiz "O tamanho da string e: "
minhaString: .space 50
.text
    li      $v0,    4                                           # imprimindo msgInicia
    la      $a0,    msgInicial                                  # lendo msg
    syscall 

    li      $v0,    8                                           # ler string - para virar inteiro
    la   $a0, minhaString						# carrega o endereço de N em endereço a0, posição onde v0 será carregado
    addi $a1, $0, 50				 		# maximo de caracteres/bytes
    syscall
    
    li      $v0,    4                                           # imprimindo msgInicia
    la      $a0,    msgFinal                                  # lendo msg
    syscall 
    
    la   $a0, minhaString
    li $a1 , 50
    jal  fill_zero_caso_enter # a1 contador, a0 endereco   preenche com /0 onde vale enter
    
    la $a0, minhaString
    jal strlen # pegando tamanho da string digitada
    
    add $a0, $0, $v0 # retorno de strlen esta em v0
    li $v0, 1 # imprime inteiro
    syscall
    
    li $v0, 10
    syscall # fim do programa



# Recebe o endereço da string em $a0, $v0 retorna tamanho
strlen:
    move $v0, $zero      # Inicializa o contador para zero

strloop:
    lb $t0, 0($a0)       # Carrega o caractere atual da string em $t0
    beq $t0, $zero, strend  # Se chegou ao final da string (null terminator), sai do loop
    addiu $a0, $a0, 1     # Avança para o próximo caractere na string
    addi $v0, $v0, 1     # Incrementa o contador de caracteres
    j strloop            # Repete o loop

strend:
    jr $ra               # Retorna à função chamadora
  
# a1 contador, a0 endereco  
fill_zero_caso_enter:
  addi $v0, $a0, 0 # v0 vai retorna destination a0
  li $t1, 10 # valor de enter em ascii
  li $t2, 0 #garante que tem /0 em t0
  fill_zero_Loop:
  	beq $a1, $0, retorne # se contador e 0 termine
	lb $t0, 0($a0) # carrega valor na string na posicao a0 atual
	beq $t0, $t1, preencha # caso o valor atual na string for enter preencha com nulo
	j saiaDoPreenchimento
	preencha:
	sb $t2, 0($a0)
	saiaDoPreenchimento:
	addi $a0, $a0, 1 # destino = proximo byte(posição)
	addi $a1, $a1, -1 # o numero de bytes a ser copiado diminui em 1 a cada loop
	j fill_zero_Loop
  retorne:
	jr $ra