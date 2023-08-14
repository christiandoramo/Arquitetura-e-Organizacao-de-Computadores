.data
    prompt_q:   .asciiz "Digite a razao q da PG: "
    prompt_n:   .asciiz "Digite o termo n da PG para calcular a soma: "
    result_msg: .asciiz "O valor calculado da soma da PG eh: "
    
.text
    .globl main

main:
    # Imprimir prompt_q
    li $v0, 4
    la $a0, prompt_q
    syscall

    # Receber a razao q
    li $v0, 5
    syscall
    move $t0, $v0   # $t0 = q

    # Imprimir prompt_n
    li $v0, 4
    la $a0, prompt_n
    syscall

    # Receber o termo n
    li $v0, 5
    syscall
    move $t1, $v0   # $t1 = n

    # Chamar a função recursiva para calcular a soma da PG
    move $a0, $t0   # Passar q como argumento
    move $a1, $t1   # Passar n como argumento
    jal calculate_sum

    # Imprimir o resultado
    li $v0, 4
    la $a0, result_msg
    syscall
    
    move $a0, $v0   # Passar o valor calculado como argumento
    li $v0, 1
    syscall
    
    # Sair do programa
    li $v0, 10
    syscall

# Função recursiva para calcular a soma dos termos da PG
# $a0 = q, $a1 = n
calculate_sum:
    # Caso base: s[0] = 1
    beqz $a1, base_case
    
    # Chamada recursiva: s[n] = s[n-1] + a[n]
    subu $sp, $sp, 4     # Fazer espaço para armazenar o endereço de retorno
    sw $ra, 0($sp)       # Salvar o endereço de retorno na pilha
    
    sub $a1, $a1, 1      # n = n - 1
    jal calculate_sum
    
    lw $ra, 0($sp)       # Restaurar o endereço de retorno
    addu $sp, $sp, 4     # Liberar espaço da pilha
    
    # Chamar a função recursiva para calcular a[n]
    move $v1, $a0       # Salvar q em $v1
    move $a0, $a1       # Passar n como argumento
    move $a1, $v1       # Passar q como argumento
    jal calculate_pg    # Chamar a função recursiva de cálculo de a[n]
    
    add $v0, $v0, $a0   # s[n] = s[n-1] + a[n]
    jr $ra
    
base_case:
    li $v0, 1
    jr $ra

# Função recursiva para calcular a[n]
# $a0 = n, $a1 = q
calculate_pg:
    # Caso base: a[0] = 1
    beqz $a0, base_case_pg
    
    # Chamada recursiva: a[n] = q * a[n-1]
    subu $sp, $sp, 4     # Fazer espaço para armazenar o endereço de retorno
    sw $ra, 0($sp)       # Salvar o endereço de retorno na pilha
    
    sub $a0, $a0, 1      # n = n - 1
    jal calculate_pg
    
    lw $ra, 0($sp)       # Restaurar o endereço de retorno
    addu $sp, $sp, 4     # Liberar espaço da pilha
    
    mul $v0, $v0, $a1    # a[n] = q * a[n-1]
    jr $ra
    
base_case_pg:
    li $v0, 1
    jr $ra
