# nome: Christian Oliveira do Ramo
# grupo: João Lucas, Christian Oliveira,  Allexandre, Vinícius Vasconcelos
# data: 18/07/2023
# atividade: Lista 03 - Assembly MIPS
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 2022.2

# Questão: 5

# A média móvel é uma ferramenta matemática que permite remover oscilações de uma sequência numérica. Do ponto de vista de processamento digital de sinais, a média móvel se trata de um filtro digital passa-baixas, ou seja, remove componentes de altas frequências (oscilações) de um sinal digital. O objetivo desta questão é implementar um programa que calcula a média móvel de janela de tamanho 8 de um array de inteiros (32 bits), resultando em um array de saída y (dados filtrados) também de inteiros. O seu programa deve executar as seguintes etapas:
    #       Receber,            do,             usuário,                um,comprimento,N,para,o,array,de,entrada,x.,O,comprimento,N,deve,ser,obrigatoriamente,maior,ou,igual,a,8.,Caso,seja,menor,que,8,deve,apresentar,a,mensagem,“N,inválido”,e,reiniciar,o,programa#,Receber,do,usuário,um,comprimento,N,para,o,array,de,entrada,x.,O,comprimento,N,deve,ser,obrigatoriamente,maior,ou,igual,a,8.,Caso,seja,menor,que,8,deve,apresentar,a,mensagem,“N,inválido”,e,reiniciar,o,programa#,Receber,do,usuário,um,comprimento,N,para,o,array,de,entrada,x.,O,comprimento,N,deve,ser,obrigatoriamente,maior,ou,igual,a,8.,Caso,seja,menor,que,8,deve,apresentar,a,mensagem,“N,inválido”,e,reiniciar,o,programa# Receber do usuário um comprimento N para o array de entrada x. O comprimento N deve ser obrigatoriamente maior ou igual a 8. Caso seja menor que 8, deve apresentar a mensagem “N inválido” e reiniciar o programa;
    #       Alocar,             dinamicamente,  uma,                    região,de,memória,para,o,array,de,entrada,x,de,comprimento,N#,Alocar,dinamicamente,uma,região,de,memória,para,o,array,de,entrada,x,de,comprimento,N#,Alocar,dinamicamente,uma,região,de,memória,para,o,array,de,entrada,x,de,comprimento,N# Alocar dinamicamente uma região de memória para o array de entrada x de comprimento N;
                                                                        # Alocar dinamicamente uma região de memória para o array de saída y, de comprimento (N-7)
    #       Realizar,           um,             laço,                   para,receber,do,usuário,o,valor,de,cada,uma,das,N,entradas,do,array,de,entrada,x,(as,entradas,devem,ser,salvas,no,espaço,alocado,na,memória)#,Realizar,um,laço,para,receber,do,usuário,o,valor,de,cada,uma,das,N,entradas,do,array,de,entrada,x,(as,entradas,devem,ser,salvas,no,espaço,alocado,na,memória)#,Realizar,um,laço,para,receber,do,usuário,o,valor,de,cada,uma,das,N,entradas,do,array,de,entrada,x,(as,entradas,devem,ser,salvas,no,espaço,alocado,na,memória)# Realizar um laço para receber do usuário o valor de cada uma das N entradas do array de entrada x (as entradas devem ser salvas no espaço alocado na memória);
    #       Realizar,           um,             laço,                   para,calcular,as,(N-7),componentes,do,array,y,dadas,por,y[n],=,(,x[n],+,x[n+1],+,x[n+2],+,x[n+3],+,x[n+4],+,x[n+5],+,x[n+6],+,x[n+7]),/,8.,As,componentes,devem,ser,salvas,no,espaço,alocado,da,memória,para,y#,Realizar,um,laço,para,calcular,as,(N-7),componentes,do,array,y,dadas,por,y[n],=,(,x[n],+,x[n+1],+,x[n+2],+,x[n+3],+,x[n+4],+,x[n+5],+,x[n+6],+,x[n+7]),/,8.,As,componentes,devem,ser,salvas,no,espaço,alocado,da,memória,para,y#,Realizar,um,laço,para,calcular,as,(N-7),componentes,do,array,y,dadas,por,y[n],=,(,x[n],+,x[n+1],+,x[n+2],+,x[n+3],+,x[n+4],+,x[n+5],+,x[n+6],+,x[n+7]),/,8.,As,componentes,devem,ser,salvas,no,espaço,alocado,da,memória,para,y# Realizar um laço para calcular as (N-7) componentes do array y, dadas por y[n] = ( x[n] + x[n+1] + x[n+2] + x[n+3] + x[n+4] + x[n+5] + x[n+6] + x[n+7]) / 8. As componentes devem ser salvas no espaço alocado da memória para y;
    #       Imprime,            (em,            formato,                de,coluna),o,vetor,de,entrada,x#,Imprime,(em,formato,de,coluna),o,vetor,de,entrada,x#,Imprime,(em,formato,de,coluna),o,vetor,de,entrada,x# Imprime (em formato de coluna) o vetor de entrada x;
    #       Imprime,            (em,            formato,                de,coluna),o,vetor,de,saída,y#,Imprime,(em,formato,de,coluna),o,vetor,de,saída,y#,Imprime,(em,formato,de,coluna),o,vetor,de,saída,y# Imprime (em formato de coluna) o vetor de saída y;



.data
msgDeN: .asciiz "Digite o comprimento N (maior ou igual a 8): "
msgDeX: .asciiz "Digite o valor para x: "
saidaX: .asciiz "Os valores de X são: "
saidaY: .asciiz "Os valores de Y são:  "
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

    la      $a1,                tamanhoRealY                            # carrega endereço do tamanho Realx
    sw      $a0,                ($a1)                                   # guardando tam de Y

    la      $a0,                enderecoY
    sw      $v0,                0($a0)                                  # gravando o endereço de Y


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

    lw      $a0,                enderecoX                               # endereço base de x
    add     $t2,                $a0,            $t1                     # endereço de x + contador de posição atual


    li      $v0,                5                                       # recebe inteiro
    syscall 

    sw      $v0,                0($t2)                                  # Salvar o valor de x[i] na memória - v0 em x_Endereço + contador(4byte)

    addi    $t1,                $t1,            4                       # Incrementar o contador do loop + 4 byte = 1 word

    blt     $t1,                $t0,            loopDeEntradasParaX     # Continuar o loop até que i < N
                                                                        # no final t1 é será N, t0 == t1

# Realizar um laço para calcular as (N-7) componentes do array y
# dadas por y[n] = ( x[n] + x[n+1] + x[n+2] + x[n+3] + x[n+4] + x[n+5] + x[n+6] + x[n+7]) / 8
# As componentes devem ser salvas no espaço alocado da memória para y

tratamentoDeY:
    addi    $t1,                $0,             0                       # $t1 contém o índice n do array y
    lw      $a0,                enderecoY
    addi    $t4,                $a0,            0                       # t4 = endereço y
    addi    $t3,                $a0,            0                       # endereço de y em t3

    li      $t1,                0                                       # contador de y

calculeY:
                                                                        # Cálculo de y[n] = (x[n] + x[n+1] + x[n+2] + x[n+3] + x[n+4] + x[n+5] + x[n+6] + x[n+7]) / 8
    lw      $a0,                enderecoX                               # Posição de X
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
    add     $s1,                $s2,            $s3
    add     $s2,                $s4,            $s5
    add     $s3,                $s6,            $s7
    add     $s0,                $s0,            $s1
    add     $s1,                $s2,            $s3
    add     $s0,                $s0,            $s1

    addi    $t0,                $0,             8                       # 8 para divisao media movel

    div     $s0,                $t0                                     # divisao media movel

# Armazena o valor de y[n] no array y
    mflo    $t2                                                         # adiciona o quociente da dvisao para t2

    add     $t3,                $t4,            $t1                     # t3 = endereço de y + contador (t1 bytes)
    sw      $t2,                ($t3)                                   # gravando a media na posição atual t2 em y

    addi    $t1,                $t1,            4                       # Incrementa o índice n para o proximo loop

    lw      $t0,                tamanhoRealY                            # tamanho N-7 em bytes de Y
    beq     $t1,                $t0,            imprimeArrays           # Se t1 == (N-7), imprime os arrays x e y
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

    la      $a0,                pulaLinha
    li      $v0,                4
    syscall 


    lw      $a0,                enderecoX
    #       li,                 $v0,            1                       # testando o endereço de X
                                                                        # syscall

    addi    $t1,                $a0,            0                       # $t1 contém o endereçode x

    lw      $a0,                tamanhoRealX
    addi    $t3,                $a0,            0                       # $t3 contém tamanho de x

    li      $t2,                0                                       # t2 é o contador n do array x

imprimeXloop:
    bge     $t2,                $t3,            imprimeY                # PULA Pra y caso contador (t2) maior ou igual ao N (t3)

    add     $t4,                $t1,            $t2                     # t4 = endereço de x mais contador é a posição de cada indice

    lw      $a0,                ($t4)                                   # Carrega o valor de x[n] de t4 para a0
    li      $v0,                1                                       # imprime inteiro
    syscall 

# Imprime o valor de x[n]
    la      $a0,                pulaLinha
    li      $v0,                4
    syscall 
    addi    $t2,                $t2,            4                       # Incrementa o índice n (4 bytes = 1 indice)

    j       imprimeXloop

imprimeY:

# Impressão do array de saída y
    la      $a0,                saidaY
    li      $v0,                4
    syscall 

    la      $a0,                pulaLinha
    li      $v0,                4
    syscall 

    lw      $a0,                enderecoY

    addi    $t1,                $a0,            0                       # $t1 contém o endereçode x

    lw      $a0,                tamanhoRealY
    addi    $t3,                $a0,            0                       # $t3 contém tamanho de x

    li      $t2,                0                                       # t2 é o contador n do array x

imprimeYloop:
    bge     $t2,                $t3,            fim                     # PULA Pro fim

    add     $t4,                $t1,            $t2                     # t4 = endereço de y mais contador é a posição de cada indice

    lw      $a0,                ($t4)                                   # Carrega o valor de y[n] de t4 para a0
    li      $v0,                1                                       # imprime inteiro
    syscall 

# Imprime o valor de x[n]
    la      $a0,                pulaLinha
    li      $v0,                4
    syscall 
    addi    $t2,                $t2,            4                       # Incrementa o índice n (4 bytes = 1 indice)

    j       imprimeYloop

fim:
                                                                        # Encerra o programa
    li      $v0,                10
    syscall 






