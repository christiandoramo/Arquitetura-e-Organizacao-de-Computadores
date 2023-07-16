# nome: Christian Oliveira do Ramo
# grupo: João Lucas, Christian Oliveira,  Allexandre, Vinícius Vasconcelos
# data: 14/07/2023
# atividade: Lista 03 - Assembly MIPS
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2

# Questão: 2
 

# Escreva um programa que executa os seguintes passos:
# Recebe uma string (S) do usuário;
# Recebe um char (C1) do usuário;
# Recebe outro char (C2) do usuário;
# Substitui todas as ocorrências do char C1 na string S pelo char C2;
# Imprime a nova string com os caracteres substituídos

.data
    promptS:    .asciiz "Digite uma string: "
    promptC1:   .asciiz "Digite o caractere a ser substituído: "
    promptC2:   .asciiz "Digite o caractere substituto: "
    result:     .asciiz "Nova string com os caracteres substituídos: "

.text
.globl main
main:
    # Prompt para a string S
    li $v0, 4
    la $a0, promptS
    syscall

    # Ler a string S
    li $v0, 8
    la $a0, s
    li $a1, 256  # Tamanho máximo da string
    syscall

    # Prompt para o caractere C1
    li $v0, 4
    la $a0, promptC1
    syscall

    # Ler o caractere C1
    li $v0, 12
    syscall
    move $t0, $v0  # Salvar o caractere C1 em $t0

    # Prompt para o caractere C2
    li $v0, 4
    la $a0, promptC2
    syscall

    # Ler o caractere C2
    li $v0, 12
    syscall
    move $t1, $v0  # Salvar o caractere C2 em $t1

    # Substituir os caracteres
    li $v0, 4
    la $a0, result
    syscall

    li $t2, 0  # Índice para percorrer a string S
loop:
    lb $t3, s($t2)  # Carregar um caractere da string S

    beqz $t3, end  # Se chegamos ao final da string, sair do loop

    beq $t3, $t0, replace  # Se o caractere é igual a C1, substituir

    li $v0, 11  # Imprimir o caractere original
    move $a0, $t3
    syscall

    addi $t2, $t2, 1  # Avançar para o próximo caractere
    j loop

replace:
    li $v0, 11  # Imprimir o caractere substituto
    move $a0, $t1
    syscall

    addi $t2, $t2, 1  # Avançar para o próximo caractere
    j loop

end:
    li $v0, 10  # Sair do programa
    syscall

.data
s:  .space 256  # Espaço para a string S
