# nome: Christian Oliveira do Ramo
# grupo: Grupo: João Lucas, Christian Oliveira,  Allexandre, Vinícius Vasconcelos
# data: 14/07/2023
# atividade: Lista 03 - Assembly MIPS
# disciplina: Arquitetura e Organização de Computadores
# semestre letivo: 

# Questão: 5

# A média móvel é uma ferramenta matemática que permite remover oscilações de uma sequência numérica. Do ponto de vista de processamento digital de sinais, a média móvel se trata de um filtro digital passa-baixas, ou seja, remove componentes de altas frequências (oscilações) de um sinal digital. O objetivo desta questão é implementar um programa que calcula a média móvel de janela de tamanho 8 de um array de inteiros (32 bits), resultando em um array de saída y (dados filtrados) também de inteiros. O seu programa deve executar as seguintes etapas:
# Receber do usuário um comprimento N para o array de entrada x. O comprimento N deve ser obrigatoriamente maior ou igual a 8. Caso seja menor que 8, deve apresentar a mensagem “N inválido” e reiniciar o programa;
# Alocar dinamicamente uma região de memória para o array de entrada x de comprimento N;
# Alocar dinamicamente uma região de memória para o array de saída y, de comprimento (N-7)
# Realizar um laço para receber do usuário o valor de cada uma das N entradas do array de entrada x (as entradas devem ser salvas no espaço alocado na memória);
# Realizar um laço para calcular as (N-7) componentes do array y, dadas por y[n] = ( x[n] + x[n+1] + x[n+2] + x[n+3] + x[n+4] + x[n+5] + x[n+6] + x[n+7]) / 8. As componentes devem ser salvas no espaço alocado da memória para y;
# Imprime (em formato de coluna) o vetor de entrada x;
# Imprime (em formato de coluna) o vetor de saída y; 

