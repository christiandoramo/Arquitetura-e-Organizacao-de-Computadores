.data
msgDeN: .asciiz "Digite o comprimento N (maior ou igual a 8): "
msgDeX: .asciiz "Digite o valor para x: "
msgErro: .asciiz "N inválido\n"
pulaLinha: .asciiz "\n"
espaco: .asciiz " "
tamanhoRealX: .word 0
tamanhoRealY: .word 0
enderecoX: .word 0
enderecoY: .word 0
N: .word 0

.text

main:
    li      $v0,                4                                       # pirnt string
    la      $a0,                msgDeN                                  # carrega endereço msgDeN
    syscall 

    li      $v0,                5                                       # recebe inteiro
    syscall 
    move    $t0,                $v0                                     # $t0 contém o comprimento N

# N é válido (N >= 8)
    li      $t1,                8
    blt     $t0,                $t1,            entradaInvalida         # se t0 < t1 entao e falso q t0>=t1

    sw      $t0,                N                                       # N = t0 (o tamanho de x)

# Alocar memória para o array de entrada x
    addi    $t7,                $0,             4                       # uma word equivale a 4 bytes logo o verdadeiro valor de uma posição é 4
    mul     $t0,                $t0,            $t7                     # N * 4 = cada espaço são 4 bytes
    move    $a0,                $t0
    jal     aloqueNaMemoria
    move    $t2,                $v0                                     # $t2 contém o endereço base do array x

    la      $a0,                enderecoX
    sw      $v0,                0($a0)                                  # gravando o endereço de x
    la      $a0,                tamanhoRealX                            # carrega endereço do tamanho Realx
    sw      $t0,                ($a0)                                   # guardando tam de x

# Alocando memória para o array de saída y (comprimento N - 7)
    sub     $t6,                $t0,            28                      # $t6 contém 4*t0-7 (N - 7) (4N-28)
    move    $a0,                $t6                                     # a0 = 4n -28
    jal     aloqueNaMemoria
    move    $t2,                $v0                                     # $t3 contém o endereço base do array y

    la      $a0,                enderecoY
    sw      $v0,                0($a0)                                  # gravando o endereço de Y
    la      $a0,                tamanhoRealY                            # carrega endereço do tamanho Realx
    sw      $t0,                ($a0)                                   # guardando tam de Y

# Loop para receber os valores de x(e y) do usuário
    li      $t1,                0                                       # INICIANDO O contador do loop------------------------------------
    la      $a0,                pulaLinha                               # carrega e depois embaixo imprime o \n pulalinha
    li      $v0,                4
    syscall 

loopDeEntradasParaX:
                                                                        # Prompt para receber o valor de x[i]
    li      $v0,                4
    la      $a0,                msgDeX
    syscall 

# Imprimir o índice i
    addi    $t7,                $0,             4
    div     $t1,                $t7
    mflo    $a0                                                         # quociente de LO para o a0
    li      $v0,                1
    syscall 


    la      $a0,                espaco                                  # Imprimir espaço " "
    li      $v0,                4
    syscall 


# Recebe o valor de x[i] do usuário

    li      $v0,                5                                       # recebe inteiro
    syscall 

    la      $a0,                x_Endereco                              # endereço base de x
    add     $t2,                $a0,            $t1                     # endereço de x + contador de posição
    sw      $v0,                0($t2)                                  # Salvar o valor de x[i] na memória - v0 em x_Endereço + contador(4byte)

    addi    $t1,                $t1,            4                       # Incrementar o contador do loop + 4 byte = 1 word

    blt     $t1,                $t0,            loopDeEntradasParaX     # Continuar o loop até que i < N
    beq     $t1,                $t0,            tratamentoDeY           # t1 == N ja rodou n vezes, logo posso calcular y
                                                                        # no final t1 é será N, t0 == t1

# Realizar um laço para calcular as (N-7) componentes do array y
# dadas por y[n] = ( x[n] + x[n+1] + x[n+2] + x[n+3] + x[n+4] + x[n+5] + x[n+6] + x[n+7]) / 8
# As componentes devem ser salvas no espaço alocado da memória para y

tratamentoDeY:
    li      $t1,                0                                       # $t1 contém o índice n do array y
    la      $a0,                enderecoY
    addi    $t3,                $a0,            0                       # endereço de y em t3

calculeY:
                                                                        # Cálculo de y[n] = (x[n] + x[n+1] + x[n+2] + x[n+3] + x[n+4] + x[n+5] + x[n+6] + x[n+7]) / 8
    la      $a0,                enderecoX                               # Posição de X

    add     $t2,                $a0,            $t1                     # t2 = posição atual e bytes
                                                                        # lendo posição n
    lw      $s0,                ($t2)                                   # x[n]
    lw      $s1,                4($t2)                                  # x[n+1]
    lw      $s2,                8($t2)                                  # x[n+2]
    lw      $s3,                12($t2)                                 # x[n+3]
    lw      $s4,                16($t2)                                 # x[n+4]
    lw      $s5,                20($t2)                                 # x[n+5]
    lw      $s6,                24($t2)                                 # x[n+6]
    lw      $s7,                28($t2)                                 # x[n+7]


    add     $s0,                $s0,            $s1
    add     $s0,                $s2,            $s3
    add     $s0,                $s4,            $s5
    add     $s0,                $s6,            $s7

    addi    $t0,                $0,             8                       # 8 para divisao media movel

    div     $s0,                $t0                                     # divisao media movel

# Armazena o valor de y[n] no array y
    mfhi    $t2                                                         # adiciona o quociente da dvisao para t2

    la      $a0,                enderecoY
    add     $t3,                $t3,            $t1                     # endereço de y + contador (t1 bytes)
    sw      $t2,                ($t3)                                   # gravando a media na posição atual t2 em y

    addi    $t1,                $t1,            4                       # Incrementa o índice n em x para o proximo loop
    addi    $t3,                $t3,            4                       # Aponta para o próximo elemento de y


    lw      $t0,                tamanhoRealY                            # tamanho N-7 em bytes de Y
    beq     $t1,                $t0,            imprimirArrays          # Se t1 == (N-7), imprime os arrays x e y
    j       calculeY                                                    # loop para cada n dentro de x desde que n <= N-7

aloqueNaMemoria:
    li      $v0,                9                                       # syscall 9 - sbrk (alocar memória)
    syscall 
    jr      $ra                                                         # foltando pra chamada

entradaInvalida:
                                                                        # Mensagem de erro para N inválido
    li      $v0,                4
    la      $a0,                msgErro
    syscall 
    j       main                                                        # Reiniciar o programa


# PARTE FINAL -------------------------------------------


imprimeArrays:
                                                                        # Impressão do array de entrada x
    la      $a0,                saidaX
    li      $v0,                4
    syscall 

    lw      $a0,                enderecoX
    addi    $t1,                $a0,            0                       # $t1 contém o índice n do array x

    lw      $a0,                tamanhoRealX
    addi    $t3,                $a0,            0                       # $t1 contém o índice n do array x

imprimeXloop:
    beq     $t1,                $t3,            imprimeY
    lw      $a0,                ($t1)                                   # Carrega o valor de x[n]
    jal     print_int                                                   # Imprime o valor de x[n]
    la      $a0,                space
    li      $v0,                4
    syscall 
    addi    $t1,                $t1,            4                       # Incrementa o índice n
    j       imprimeXloop

imprimeY:
                                                                        # Impressão do array de saída y
    la      $a0,                saidaY
    li      $v0,                4
    syscall 

    lw      $a0,                enderecoY
    addi    $t1,                $a0,            0                       # $t1 contém o índice n do array y

    lw      $a0,                tamanhoRealY
    addi    $t3,                $a0,            0                       # $t1 contém o índice n do array y

imprimeYloop:
    beq     $t1,                $t3,            fim
    lw      $a0,                ($t1)                                   # Carrega o valor de y[n]
    jal     print_int                                                   # Imprime o valor de y[n]
    la      $a0,                space
    li      $v0,                4
    syscall 
    addi    $t1,                $t1,            4                       # Incrementa o índice n
    j       imprimeYloop

fim:
                                                                        # Encerra o programa
    li      $v0,                10
    syscall 






