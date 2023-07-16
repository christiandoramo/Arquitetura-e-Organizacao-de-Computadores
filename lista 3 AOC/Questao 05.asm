# nome: Christian Oliveira do Ramo
# grupo: João Lucas, Christian Oliveira,  Allexandre, Vinícius Vasconcelos
# data: 14/07/2023
# atividade: Lista 03 - Assembly MIPS
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2

# Questão: 5

# A média móvel é uma ferramenta matemática que permite remover oscilações de uma sequência numérica. 
# Do ponto de vista de processamento digital de sinais, a média móvel se trata de um filtro digital passa-baixas, ou seja,
# remove componentes de altas frequências (oscilações) de um sinal digital. 
# O objetivo desta questão é implementar um programa que calcula a média móvel de janela de tamanho 8 de um array de 
# inteiros (32 bits), resultando em um array de saída y (dados filtrados) também de inteiros. 
# O seu programa deve executar as seguintes etapas:
# Receber do usuário um comprimento N para o array de entrada x. 
# O comprimento N deve ser obrigatoriamente maior ou igual a 8. 
# Caso seja menor que 8, deve apresentar a mensagem “N inválido” e reiniciar o programa;
# Alocar dinamicamente uma região de memória para o array de entrada x de comprimento N;
# Alocar dinamicamente uma região de memória para o array de saída y, de comprimento (N-7)
# Realizar um laço para receber do usuário o valor de cada uma das N entradas do array de entrada x 
# (as entradas devem ser salvas no espaço alocado na memória);
# Realizar um laço para calcular as (N-7) componentes do array y, dadas por 
# y[n] = ( x[n] + x[n+1] + x[n+2] + x[n+3] + x[n+4] + x[n+5] + x[n+6] + x[n+7]) / 8. 
# As componentes devem ser salvas no espaço alocado da memória para y;
# Imprime (em formato de coluna) o vetor de entrada x;
# Imprime (em formato de coluna) o vetor de saída y; 

.data
    msgA: .asciiz "entre com o valor de A: "
    msgB: .asciiz "entre com o valor de B: "
    msgC: .asciiz "entre com o valor de C: "
    msgD: .asciiz "entre com o valor de D: "
    true: .asciiz "TRUE"
    false: .asciiz "FALSE"
.text
    la $a0, msgA # lendo string
    jal imprimirString # branch para a função
    jal lerInteiro # branch para lerInteiro
    add $t0, $0, $v0 # t0 = A

    la $a0, msgB # lendo msg
    jal imprimirString # imprima string
    jal lerInteiro
    add $t1, $0, $v0 # t0 = B

    la $a0, msgC # lendo msg
    jal imprimirString # imprima string
    jal lerInteiro
    add $t2, $0, $v0 # t0 = C

    la $a0, msgD # lendo msg
    jal imprimirString # imprima string
    jal lerInteiro
    add $t3, $0, $v0 # t0 = D


    # if (A+D == 7 || ...
    addi $s0, $0, 7  # s0 = 7
    add $s1 ,$t0, $t3 # s1 = a + d
    beq $s0,  $s1, printTrue # a+d == 7 ? ja será impresso TRUE independendo do resto por causa do ||


    # if (... B == 2 && C != 5)
    addi $s0, $0, 5 # s0 = 5
    beq $t2, $s0, printFalse # Se c = 5 JA PODEMOS dizer que já falso
    
    addi $s0, $0, 2
    beq $t1, $s0, printTrue # true Pois apesar da primeira condição falhar a segunda com a terceira não apontou erro
    
    # falhou no primeiro beq(n branchou),foi verdadeiro no segundo beq(n branchou), falhou no terceiro beq(n branchou)
    jal printFalse



    imprimirString:
        li $v0, 4 # imprima string
        syscall
        jr $ra  # voltando para a instrução anterior

    lerInteiro:
        li $v0, 5 # leia valor inteiro
        syscall
        jr $ra

    printTrue:
        la $a0, true # lendo variavel true
        li $v0, 4 # imprimindo
        syscall
        li $v0, 10 # encerrando programa

    printFalse:
        la $a0, false # lendo variavel false
        li $v0, 4 # imprimindo
        syscall
        li $v0, 10 # encerrando programav0