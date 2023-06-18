.text
	li $t0, 75 # aloca um numero
	addi $t1, $zero, 25
	add $s0, $t0, $t1
	addi $s1,$s0, 36 # add a,b,c == a = b + numero literal
	syscall
	
#	analise feita pelo chatgpt
#	$t1: outro registrador temporário que não precisa ser preservado entre chamadas de função43. 
#	Você está usando ele para armazenar o número 25.
#	$s0: um registrador salvo que precisa ser preservado entre chamadas de função43.
#	$zero: um registrador especial que sempre contém o valor zero43. Você está usando ele para adicionar 25 a $t1.