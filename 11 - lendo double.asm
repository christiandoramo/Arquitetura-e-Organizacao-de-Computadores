#float e double
.data
	msg: .asciiz "forne�a um numero double: "
	zero: .double 0.0
.text
	#imprimindo msg
	li $v0, 4 # instru��o imprimir string
	la $a0, msg
	syscall
	
	#lendo numero
	li $v0, 7 # ler double
	syscall # valor s� pode ficar em posi��o PAR - uma parte em no primeiro byte outra no segundo
	

	ldc1 $f2, zero # load double coprocessor 1
	add.d $f12, $f2, $f0 # add.d - double add.s - single precision(float) somando f0(double gravado come�a em f0 e termina em f1)
	
	# imprime numero
	li $v0, 3 # printar double
	syscall
	
