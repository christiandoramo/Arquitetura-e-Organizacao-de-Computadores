.text
	li $t0, 75 # aloca um numero
	addi $t1, $zero, 25
	add $s0, $t0, $t1
	addi $s1,$s0, 36 # add a,b,c == a = b + numero literal
	syscall
	
#	analise feita pelo chatgpt
#	$t1: outro registrador tempor�rio que n�o precisa ser preservado entre chamadas de fun��o43. 
#	Voc� est� usando ele para armazenar o n�mero 25.
#	$s0: um registrador salvo que precisa ser preservado entre chamadas de fun��o43.
#	$zero: um registrador especial que sempre cont�m o valor zero43. Voc� est� usando ele para adicionar 25 a $t1.