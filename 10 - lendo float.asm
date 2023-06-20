#float e double
.data
	msg: .asciiz "forne�a um numero real: "
	msg2: .asciiz "Seu numero �: "
	# n�o ficam em registradores, mas em coprocessador 1
	pi: .float 3.141592
	e: .double 2,718281
	meuRegistrador0: .float 0.0 # variavel utilitaria entre floats
.text
	# Imprime float - li $v0, 2  
	# Imprime double - li $v0, 3 
	# Le float - li $v0, 6 
	# Le double - li $v0, 7
	# lwc1 $f12, <var> move um float ou double para o espa�o CORRETO em $f12
	# ap�s a leitura o valor vai para $f0
	
	# msg 1
	li $v0, 4
	la $a0, msg
	syscall
	
	#lendo numero
	li $v0, 6
	syscall # valor est� em $f0
	
	# enquanto lw � load word para inteiro
	lwc1 $f1, meuRegistrador0 # load word c1(coprocessador 1)
	add.s $f12, $f1, $f0 # GAMBIARRA DA POH@ pra ir pra f12 pra imprimir
	
	# msg 2
	li $v0, 4
	la $a0, msg2
	syscall
	
	#imprimindo float
	li $v0,  2
	syscall # imprimindo numero em $f12
	