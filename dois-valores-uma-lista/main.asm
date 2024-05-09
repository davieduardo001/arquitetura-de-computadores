.data
prompt1: .asciiz "Digite o primeiro valor: "
prompt2: .asciiz "Digite o segundo valor: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Prompt para o usuário digitar o primeiro valor
    li $v0, 4           # Syscall para imprimir string
    la $a0, prompt1     # Endereço da string de prompt1
    syscall

    # Recebe o primeiro valor do usuário
    li $v0, 5           # Syscall para ler inteiro
    syscall
    move $t0, $v0       # Move o primeiro valor para $t0

    # Prompt para o usuário digitar o segundo valor
    li $v0, 4           # Syscall para imprimir string
    la $a0, prompt2     # Endereço da string de prompt2
    syscall

    # Recebe o segundo valor do usuário
    li $v0, 5           # Syscall para ler inteiro
    syscall
    move $t1, $v0       # Move o segundo valor para $t1

    # Verifica se o primeiro valor é menor que o segundo
    blt $t0, $t1, loop_forward

    # Verifica se o primeiro valor é maior que o segundo
    bgt $t0, $t1, loop_backward

    # Se forem iguais, imprime o valor
    li $v0, 1           # Syscall para imprimir inteiro
    move $a0, $t0       # Move o valor para imprimir
    syscall

    # Nova linha
    li $v0, 4           # Syscall para imprimir string
    la $a0, newline     # Endereço da nova linha
    syscall

    # Saída do programa
    li $v0, 10          # Syscall para terminar o programa
    syscall

loop_forward:
    # Loop para imprimir os valores do primeiro até o segundo (em ordem crescente)
    move $t2, $t0       # Inicializa o contador com o valor do primeiro
loop_forward_loop:
    # Imprime o valor atual do contador
    li $v0, 1           # Syscall para imprimir inteiro
    move $a0, $t2       # Move o valor para imprimir
    syscall

    # Verifica se o valor atual é igual ao segundo valor
    beq $t2, $t1, loop_forward_end

    # Imprime ", "
    li $v0, 4           # Syscall para imprimir string
    la $a0, ", "        # Endereço da string ", "
    syscall

    # Incrementa o contador
    addi $t2, $t2, 1

    # Loop
    j loop_forward_loop

loop_forward_end:
    # Nova linha
    li $v0, 4           # Syscall para imprimir string
    la $a0, newline     # Endereço da nova linha
    syscall

    # Saída do programa
    li $v0, 10          # Syscall para terminar o programa
    syscall

loop_backward:
    # Loop para imprimir os valores do segundo até o primeiro (em ordem decrescente)
    move $t2, $t0       # Inicializa o contador com o valor do primeiro
loop_backward_loop:
    # Imprime o valor atual do contador
    li $v0, 1           # Syscall para imprimir inteiro
    move $a0, $t2       # Move o valor para imprimir
    syscall

    # Verifica se o valor atual é igual ao segundo valor
    beq $t2, $t1, loop_backward_end

    # Imprime ", "
    li $v0, 4           # Syscall para imprimir string
    la $a0, ", "        # Endereço da string ", "
    syscall

    # Decrementa o contador
    addi $t2, $t2, -1

    # Loop
    j loop_backward_loop

loop_backward_end:
    # Nova linha
    li $v0, 4           # Syscall para imprimir string
    la $a0, newline     # Endereço da nova linha
    syscall

    # Saída do programa
    li $v0, 10          # Syscall para terminar o programa
    syscall
