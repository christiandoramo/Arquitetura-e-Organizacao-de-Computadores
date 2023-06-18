.data
	msgResto: .asciiz "O resto é: " # string em ascii o z indica o /0 - null terminator
	msgQuociente: .ascii "O quociente da divisão é: "
.text
	li $t0, 32 # carrrega agora o valor 32 no reg t0
	li $t1, 5
	
	div $t0, $t1
	
	li $v0 , 1 # instrução imprime inteiro
	#parte inteira para s0
	mflo $s0 # move from lo
	
	# colocando resto em s1
	mfhi $s1 # move from hi
	
	
	
	############# imprimindo mensagem 1
	li $v0 , 4
	la $a0, msgQuociente
	syscall
	
	# imprimindo o valor de s0 - quociente
	li $v0 , 1
	move $a0, $s0 # movendo s0 para a0
	syscall

	# imprimindo um espaço
	#li $v0 , 11 # intrusção para imprimir um caractere diferente de li v0, 4
	# pois aqui não possui o /0 no final - terminador nulo
	#li $a0 , 32 # 32 é espaço em branco em ASCII
	#syscall
	
	# pulando uma linha
	li $v0, 11 # instrução de imprimir caractere
	li $a0, 10 # 10 é char pula linha em ascii
	syscall
	
	############# imprimindo mensagem 2
	li $v0 , 4
	la $a0, msgResto
	syscall

	# imprimindo o valor de s1 - resto
	li $v0 , 1
	move $a0, $s1 # movendo s1 para a0
	syscall

# move $a0, lo Não funciona, não consigo mover lo para o registrador a0