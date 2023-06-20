#float e double
.data
	msg: .asciiz "forneça um numero real: "
	# não ficam em registradores, mas em coprocessador 1
	pi: .float 3.141592
	e: .double 2,718281
	meuRegistrador0: .float 0.0 # variavel utilitaria entre floats
.text
	# Imprime float - li $v0, 2  
	# Imprime double - li $v0, 3 
	# Le float - li $v0, 6 
	# Le double - li $v0, 7
	# lwcl $f12, <var> move um float ou double para o espaço CORRETO em $f12
	# após a leitura o valor vai para $f0
	
	li $v0, 4
	la $a0, msg
	syscall
	
	#lendo numero
	li $v0, 6
	syscall # valor está em $f0
	
	# enquanto lw é load word para inteiro
	lwcl # load word c1(coprocessador 1)
	add.s $, 
	