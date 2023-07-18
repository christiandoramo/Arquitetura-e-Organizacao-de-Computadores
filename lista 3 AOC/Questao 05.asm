.data
prompt1: .asciiz "Digite o comprimento N (maior ou igual a 8): "
prompt2: .asciiz "Digite o valor para x: "
invalid_msg: .asciiz "N inválido\n"
newline: .asciiz "\n"
space: .asciiz " "
x_Endereco: .word 0
y_Endereco: .word 0
N: .word 0

.text

# Função para alocar memória dinamicamente
# Argumentos:
#   $a0 - tamanho do array em palavras (4 bytes cada)
# Retorna:
#   $v0 - endereço base do array alocado
main:
    # Prompt para receber o comprimento N
    li $v0, 4
    la $a0, prompt1
    syscall

    # Receber o valor de N do usuário
    li $v0, 5
    syscall
    move $t0, $v0    # $t0 contém o comprimento N

    # Verificar se N é válido (N >= 8)
    li $t1, 8
    blt $t0, $t1, invalid_input # se t0 < t1 entao e falso q t0>=t1
    
    sw $t0, N

    # Alocar memória para o array de entrada x
    addi $t7, $0, 4 # uma word equivale a 4 bytes logo o verdadeiro valor de uma posição é 4
    mul $t0, $t0,$t7 
    move $a0, $t0
    jal allocate_memory
    move $t2, $v0    # $t2 contém o endereço base do array x
    
    la $a0, x_Endereco
    sw $t2, ($a0) # guardando posição de x em x_Endereço

    # Alocar memória para o array de saída y (comprimento N - 7)    
    sub $t0, $t0, 28  # $t0 contém N - 7 (4n-28)
    move $a0, $t0        # a0 = 4n -28
    jal allocate_memory
    move $t3, $v0    # $t3 contém o endereço base do array y
    
    la $a0, y_Endereco
    sw $t2, ($a0) # guardando posição de y em y_Endereço

    # Loop para receber os valores de x do usuário
    li $t1, 0        # contador do loop
    la $a0, newline
    li $v0, 4
    syscall

input_loop:
    # Prompt para receber o valor de x[i]
    li $v0, 4
    la $a0, prompt2
    syscall

    # Imprimir o índice i
    addi $t7,$0,4
	div $t1, $t7    
    mflo $a0 #quociente de LO para o a0 
     li $v0, 1
    syscall

    # Imprimir o separador ":"
    la $a0, space
    li $v0, 4
    syscall



    # Receber o valor de x[i] do usuário
    li $v0, 5 # recebe inteiro
    syscall
    
    la $a0, x_Endereco # endereço base de x
    
    add $t2, $a0, $t1 # endereço de x + contador de posição
    
    sw $v0, 0($t2)  # Salvar o valor de x[i] na memória - v0 em x_Endereço + contador(4byte)

    addi $t1, $t1, 4       # Incrementar o contador do loop + 4 byte = 1 word  
    
    lw $t0, N # t0 = N
    blt $t1, $t0, input_loop   # Continuar o loop até que i < N

    # Saída do programa
    li $v0, 10
    syscall
    
allocate_memory:
    li $v0, 9        	# syscall 9 - sbrk (alocar memória)
    syscall
    jr $ra		# foltando pra chamada

invalid_input:
    # Mensagem de erro para N inválido
    li $v0, 4
    la $a0, invalid_msg
    syscall

    # Reiniciar o programa
    j main
