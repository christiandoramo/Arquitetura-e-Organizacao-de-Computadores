# nome: Christian Oliveira do Ramo
# grupo: João Lucas, Christian Oliveira,  Allexandre, Vinícius Vasconcelos
# data: 14/07/2023
# atividade: Lista 03 - Assembly MIPS
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2

# Questão: 3
 

# Escreva um programa que lê do usuário um inteiro N e escreve na tela as sequências no seguinte formato:
# 1
# 1, 2
# 1, 2, 3
# 1, 2, 3, 4
# …
# 1, 2, 3, 4, 5, …, N-1

.data
msgInicial: .asciiz "Digite um número inteiro maior que 0 N: "
msgReset: .asciiz "Digite um inteiro maior ou igual a 1"
sequencia: .asciiz "Sequência: "
virgula: .asciiz ", "
linha: .asciiz "\n"


.text
main:
    li $v0, 4               # print string
    la $a0, msgInicial     # msgInicial para o usuário digitar N
    syscall

    li $v0, 5 # leia o inteiro N
    syscall
    addi $t0, $v0, 0    # t0 = N

    ble $t0, $0, resetar# checando se é inteiro é menor ou igual a 0

    la $a0, sequencia     # print nome sequência
    li $v0, 4             # print string
    syscall

    addi $t1, $0 , 0    # t1 recebe 1 (t1 é o limitador para N linhas)
loopDaLinha:
    addi $t2, $0, 2      # t2 recebe 2 (t2 é o limitador para o ultimo numero de uma linha)
loopDalinhaImprimeLoop:
    addi $t1, $t1 , 1    # t1 recebe t1 + 1 sempre que entrar aqui, pois é uma nova linha - novo limite

    jal pulaLinha

    li $v0, 1            # imprime inteiro
    addi $a0, $0, 1     # Imprime o número primeiro de toda linha
    syscall

    addi $t2, $0, 2      # t2 recebe 2 (t2 é o limitador para o ultimo numero de uma linha)
imprimeLoop:
    ble $t2, $t1, imprimeVirgula    # se t2 < t1 então tem um prox numero a linha (logo precisa de ,)
    addi $t2, $t2, 1        # t2 = 2 + 1 -> t2 = 3 + 1  -> t2 = 4 + 1... t1 = N
    bgt $t2, $t1, pularLinha
    j Fim
    pularLinha:
         j loopDalinhaImprimeLoop # faz com que t2 continue sedo t2 e imprime 1 e 2
    

   

imprimeVirgula:
    li $v0, 4       # imprime string
    la $a0, virgula # imprime virgula
    syscall

    addi $a0, $t2, 0  # vai imprimir t2
    li $v0, 1         # Imprime t2
    syscall

    addi $t2, $t2, 1 # t2 ++ será 2 novamente no loop da linha 1 ate N-1

    beq $t2, $t0, Fim           # ja pode finalizar pois t1 = t2 = N impressao final

    beq $t2, $t1, loopDaLinha   # se t1 <= N continue prox linha caso p contrario  o programa encerra
 	
 	# CASO addi $t2, $t2, 1 # t2 ++ será 2 novamente no loop da linha 1 ate N	
    j imprimeLoop

pulaLinha:
    li $v0, 4
    la $a0, linha
    syscall
    jr $ra

resetar:
    li $v0, 4               # print string
    la $a0, msgReset     #  para o usuário digitar N >=1
    syscall
    j main
Fim:
    li $v0, 10
    syscall