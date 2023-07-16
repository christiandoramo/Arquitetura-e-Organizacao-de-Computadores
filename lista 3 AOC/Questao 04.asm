# nome: Christian Oliveira do Ramo
# grupo: João Lucas, Christian Oliveira,  Allexandre, Vinícius Vasconcelos
# data: 14/07/2023
# atividade: Lista 03 - Assembly MIPS
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2

# Questão: 4

# Escreva um programa que lê do usuário um inteiro N de 32 bits que corresponde a um valor de tempo em segundos e
# escreve na tela o tempo equivalente no seguinte formato:
# “Y anos, M meses, D dias, H horas, M minutos e S segundos”

# OBS: por simplicidade, considere que o ano é composto de 12 meses de 30 dias.
# OBS2: Seu programa deve ser capaz de receber um valor de até 4.294.967.295 segundos e calcular o tempo corretamente.
# OBS2: A informação final deve ser de tal forma que represente o tempo total fornecido pelo usuário.
# Por exemplo. 122 segundos deve fornecer uma mensagem de
# “0 anos, 0 meses, 0 dias, 0 horas, 2 minutos e 2 segundos”.
# Por exemplo (2), 90000 segundos deve fornecer uma mensagem de
# “0 anos, 0 meses, 1 dias, 1 horas, 0 minutos e 0 segundos”.

.data
msgInicial:     .asciiz "Digite um valor de tempo em segundos: "
msgFinal:     .asciiz "O tempo equivalente é: "
anos:      .asciiz " anos, "
meses:     .asciiz " meses, "
dias:       .asciiz " dias, "
horas:      .asciiz " horas, "
min:    .asciiz " minutos e "
segundos:    .asciiz " segundos\n"

.text
    li      $v0,    4                                           # imprimindo msgInicia
    la      $a0,    msgInicial                                  # lendo msg
    syscall 

    li      $v0,    5                                           # ler inteiro
    syscall 
    addiu   $t0,    $v0,        0                               # t0 = entrada em v0

    li      $t1,    31536000                                    # t1 = 1 ano em segundos (60 * 60 * 24 * 30 365)
    divu    $t0,    $t1                                         # N dividido por segundos em ANOS
    mflo    $s0                                                 # Quociente de N/anos para s0 é anos
    mfhi    $t1                                                 # Resto da divisão N/anos para t1

    li      $t0,    2592000                                     # t0 = 1 mês em segundos (60 * 60 * 24 * 30)
    divu    $t1,    $t0                                         # Resto da divisão N/anos por meses em segundos
    mflo    $s1                                                 # Quociente de RestoDaDivisaoAnos/mesesEmSegundos para s1 é meses
    mfhi    $t2                                                 # RestodadivisãoAnos/mes para t2

    li      $t0,    86400                                       # t0 = 1 dia em segundos (60  * 60  * 24)
    divu    $t2,    $t0                                         # resto em dias / dias em segundos
    mflo    $s2                                                 # Quociente de RestoDaDivisaoMeses/DiasEmSegundos para s2 é dias
    mfhi    $t3                                                 # Resto da divisão Meses/dias para t3

    li      $t0,    3600                                        # t0 = 1 hora em segundos (60 * 60)
    divu    $t3,    $t0                                         # resto em minutos / minutos em segundos
    mflo    $s3                                                 # Quociente de RestoDaDivisaoDias/HorasEMSegundos para s3 é horas
    mfhi    $t4                                                 # resta da divisão dias/horas para t4

    li      $t0,    60                                          # t0 = 1 min (60 segundos)
    divu    $t4,    $t0                                         # resto em horas / minutos em segundos
    mflo    $s4                                                 # Quociente de RestoDaDivisaoHoras/MinutosemSegundos para s4 é minutos
    mfhi    $s5                                                 # resta da divisão horas/minutos para t5 -> t5 é segundos

# printando msg final
    li      $v0,    4
    la      $a0,    msgFinal
    syscall 

    li      $v0,    1
    addiu   $a0,    $s0,        0                               # anos
    syscall 

    li      $v0,    4
    la      $a0,    anos
    syscall 

    li      $v0,    1
    addiu   $a0,    $s1,        0                               # meses
    syscall 

    li      $v0,    4
    la      $a0,    meses
    syscall 

    li      $v0,    1
    addiu   $a0,    $s2,        0                               # dias
    syscall 

    li      $v0,    4
    la      $a0,    dias
    syscall 

    li      $v0,    1
    addiu   $a0,    $s3,        0                               # horas
    syscall 

    li      $v0,    4
    la      $a0,    horas
    syscall 

    li      $v0,    1
    addiu   $a0,    $s4,        0                               # min
    syscall 

    li      $v0,    4
    la      $a0,    min
    syscall 

    li      $v0,    1
    addiu   $a0,    $s5,        0                               # segundos
    syscall 

    li      $v0,    4
    la      $a0,    segundos
    syscall 

    li      $v0,    10                                          # fim do programa
    syscall 
