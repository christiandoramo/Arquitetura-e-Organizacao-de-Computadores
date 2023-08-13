.data
    prompt1: .asciiz "Digite o número referente a 'x': "
    prompt2: .asciiz "Digite o número referente a 'y': "
    msg_gt: .asciiz "x maior do que y\n"
    msg_lt: .asciiz "x menor do que y\n"
    msg_eq: .asciiz "x igual a y\n"

.text
.globl main

main:
    # Imprimir prompt para o primeiro número
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Ler o primeiro número (x)
    li $v0, 6
    syscall
    add.s $f1, $f2, $f0   # Salvar o valor de x em $s0
    
    # Imprimir prompt para o segundo número
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Ler o segundo número (y)
    li $v0, 6
    syscall
    
    # Comparar x e y f1 e x, f0 e y
    c.eq.s $f1, $f0    # Comparar x e y
    bc1t equal         # Se forem iguais, pular para "equal"
    
    
    # Não são iguais, então comparar para determinar maior/menor
    c.lt.s $f1, $f0    # Comparar se x < y
    bc1t less_than     # Se x < y, pular para "less_than"

    li $v0, 4
    la $a0, msg_gt
    syscall
    j end
    
less_than:
    # x é maior que y
    li $v0, 4
    la $a0, msg_lt
    syscall
    j end
    
equal:
    # x é igual a y
    li $v0, 4
    la $a0, msg_eq
    syscall
    
end:
    li $v0, 10      # Sair do programa
    syscall
