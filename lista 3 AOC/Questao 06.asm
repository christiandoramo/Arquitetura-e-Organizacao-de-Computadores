.data
    input_prompt:   .asciiz "Digite o valor de n: "
    result_text:    .asciiz "O n-ésimo elemento da série de Fibonacci é: "

.text

main:
    # Solicita ao usuário para digitar o valor de n
    la $a0, input_prompt
    li $v0, 4           # Código da syscall para imprimir string
    syscall

    # Lê o valor de n da entrada padrão
    li $v0, 5           # Código da syscall para leitura de inteiro
    syscall
    move $a0, $v0       # Move o valor de n para $a0

    # Chama a função de Fibonacci recursiva
    li $s1, 0
    jal fibonacci
    move $s0, $v0       # Move o resultado para $a0

    # Imprime o resultado
    la $a0, result_text
    li $v0, 4
    syscall
    
    add $a0, $0, $s0 
    li $v0, 1           # Código da syscall para imprimir inteiro
    syscall

    # Encerra o programa
    li $v0, 10
    syscall


# Função recursiva de Fibonacci
fibonacci:
addi $sp, $sp, -12
sw $ra, 8($sp)
sw $s0, 4($sp)
sw $s1, 0($sp)
move $s0, $a0
li $v0, 1 # return value for terminal condition
ble $s0, 0x2, fibonacciExit # check terminal condition
addi $a0, $s0, -1 # set args for recursive call to f(n-1)
jal fibonacci
move $s1, $v0 # store result of f(n-1) to s1
addi $a0, $s0, -2 # set args for recursive call to f(n-2)
jal fibonacci
add $v0, $s1, $v0 # add result of f(n-1) to it
fibonacciExit:
# Epilogue
lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12
jr $ra
