# nome: Christian Oliveira do Ramo
# grupo: João Lucas, Christian Oliveira,  Allexandre, Vinícius Vasconcelos
# data: 14/07/2023
# atividade: Lista 03 - Assembly MIPS
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2

# Questão: 1

# Escreva um código que lê quatro valores do usuário (A, B, C e D) e implementa o seguinte código:
# if (A+D == 7 || B == 2 && C != 5)
    #       printf(“TRUE”)                          # printf(“TRUE”);
                                                    # else
    #       printf(“FALSE”)                         # printf(“FALSE”);

.data
msgA: .asciiz "entre com o valor de A: "
msgB: .asciiz "entre com o valor de B: "
msgC: .asciiz "entre com o valor de C: "
msgD: .asciiz "entre com o valor de D: "
true: .asciiz "TRUE"
false: .asciiz "FALSE"
.text
    la      $a0,                msgA                # lendo string
    jal     imprimirString                          # branch para a função
    jal     lerInteiro                              # branch para lerInteiro
    add     $t0,                $0,     $v0         # t0 = A

    la      $a0,                msgB                # lendo msg
    jal     imprimirString                          # imprima string
    jal     lerInteiro
    add     $t1,                $0,     $v0         # t0 = B

    la      $a0,                msgC                # lendo msg
    jal     imprimirString                          # imprima string
    jal     lerInteiro
    add     $t2,                $0,     $v0         # t0 = C

    la      $a0,                msgD                # lendo msg
    jal     imprimirString                          # imprima string
    jal     lerInteiro
    add     $t3,                $0,     $v0         # t0 = D


# if (A+D == 7 || ...
    addi    $s0,                $0,     7           # s0 = 7
    add     $s1,                $t0,    $t3         # s1 = a + d
    beq     $s0,                $s1,    printTrue   # a+d == 7 ? ja será impresso TRUE independendo do resto por causa do ||


# if (... B == 2 && C != 5)
    addi    $s0,                $0,     5           # s0 = 5
    beq     $t2,                $s0,    printFalse  # Se c = 5 JA PODEMOS dizer que já falso

    addi    $s0,                $0,     2
    beq     $t1,                $s0,    printTrue   # true Pois apesar da primeira condição falhar a segunda com a terceira não apontou erro

# falhou no primeiro beq(n branchou),foi verdadeiro no segundo beq(n branchou), falhou no terceiro beq(n branchou)
    jal     printFalse



imprimirString:
    li      $v0,                4                   # imprima string
    syscall 
    jr      $ra                                     # voltando para a instrução anterior

lerInteiro:
    li      $v0,                5                   # leia valor inteiro
    syscall 
    jr      $ra

printTrue:
    la      $a0,                true                # lendo variavel true
    li      $v0,                4                   # imprimindo
    syscall 
    li      $v0,                10                  # encerrando programa

printFalse:
    la      $a0,                false               # lendo variavel false
    li      $v0,                4                   # imprimindo
    syscall 
    li      $v0,                10                  # encerrando programav0