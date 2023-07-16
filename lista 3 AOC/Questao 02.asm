# nome: Christian Oliveira do Ramo
# grupo: João Lucas, Christian Oliveira,  Allexandre, Vinícius Vasconcelos
# data: 14/07/2023
# atividade: Lista 03 - Assembly MIPS
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2

# Questão: 2


# Escreva um programa que executa os seguintes passos:
# Recebe,     uma,    string,         (S),do,usuário
# Recebe,     um,     char,           (C1),do,usuário
# Recebe,     outro,  char,           (C2),do,usuário,
# Substitui,  todas,  as,             ocorrências,do,char,C1,na,string,S,pelo,char,C2
# Substitui  todas,      as,     ocorrências,    do,char,C1,na,string,S,pelo,char,C2
# Imprime a nova string com os caracteres substituídos

.data
msgS:    .asciiz "Digite uma string: "
msgC1:   .asciiz "Digite o caractere a ser substituído: "
msgC2:   .asciiz "Digite o caractere substituto: "
saida:     .asciiz "Nova string com os caracteres substituídos: "
C1:         .space 1                                                # Espaço para o caractere C1
C2:         .space 1                                                # Espaço para o caractere C2
S:          .space 1024                                             # Espaço para a string S
rodou: .asciiz "rodou o loop mais uma vez"
.text
.globl main
main:

# S
    li      $v0,        4                                           # imprima string
    la      $a0,        msgS                                        # leia msgS
    syscall 
    li      $v0,        8                                           # leia String a partir da syscall
    la      $a0,        S                                           # traga endereço de S para o a0
    li      $a1,        1024                                        # Tamanho máximo - certos bytes
    syscall 

# C1
    li      $v0,        4                                           # imprima string
    la      $a0,        msgC1                                       # carregue endereço da string a imprimir C1
    syscall 
    li      $v0,        12                                          # leia caractere
    syscall 
    sb      $v0,        C1                                          # guarde o byte/caractere de v0 em C1

# C2
    li      $v0,        4                                           # imprima string
    la      $a0,        msgC2                                       # leia endereço da string a imprimir C1
    syscall 
    li      $v0,        12                                          # leia caractere
    syscall 
    sb      $v0,        C2                                          # Armazenar vyte/caractere de v0 em C2



# Substituindo -------------------------------------------------------------------------------------------------
    la      $a0,        S
    jal     trocaChars

# Encerra o programa
    li      $v0,        10
    syscall 

trocaChars:                                                         # Carregar o endereço base da string S3
    lb      $t0,        C1                                          # Carregar o caractere C1
    lb      $t1,        C2                                          # Carregar o caractere C2
    addi    $t4,        $a0,    0                                   # Salva o endereço base da string S em $t4
    addiu   $t2,        $t4,    0,      #,Índice,para,percorrer,a,string,S# Índice para percorrer a string S
loop:
    lbu     $t3,        0($t2)                                      # ERROR - Carregar byte/char na posição atual de a0 dentro de S para t3
    beq     $t3,        $0,     end                                 # Se acabou a string, sair do loop
    beq     $t3,        $t0,    troca                               # Se o caractere é igual a C1, substituir por C2
    addiu   $t2,        $t2,    1                                   # Avançar para o próximo byte dentro S
    j       loop                                                    # i.e. a cada loop => a0 + 1 byte = 1($s1), a0 +2 = 2($s1)
troca:
    sb      $t1,        0($t2)                                      # troca C1 por C2
    addiu   $t2,        $t2,    1                                   # Avançar para o próximo byte dentro de S
    j       loop

end:
    li      $v0,        4
    la      $a0,        saida
    syscall 
    li      $v0,        4
    la      $a0,        S
    syscall 

