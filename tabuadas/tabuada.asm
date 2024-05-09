.data
prompt: .asciiz "Digite um número para a tabuada: "
newline: .asciiz "\n"

.text
.globl main

main:
    # Prompt para o usuário digitar um número
    li $v0, 4           # Syscall para imprimir string
    la $a0, prompt      # Endereço da string de prompt
    syscall

    # Recebe o número do usuário
    li $v0, 5           # Syscall para ler inteiro
    syscall
    move $t0, $v0       # Move o número para $t0

    # Loop para calcular e imprimir a tabuada
    li $t1, 1           # Inicializa o multiplicador como 1
loop:
    # Calcula e imprime o valor da tabuada
    mul $a0, $t0, $t1   # Calcula o valor da tabuada (número * multiplicador)
    li $v0, 1           # Syscall para imprimir inteiro
    syscall

    # Imprime " x "
    li $v0, 4           # Syscall para imprimir string
    la $a0, " x "       # Endereço da string " x "
    syscall

    # Imprime o multiplicador
    move $a0, $t1       # Move o multiplicador para $a0
    li $v0, 1           # Syscall para imprimir inteiro
    syscall

    # Imprime " = "
    li $v0, 4           # Syscall para imprimir string
    la $a0, " = "       # Endereço da string " = "
    syscall

    # Imprime o resultado (valor da tabuada)
    li $v0, 1           # Syscall para imprimir inteiro
    syscall

    # Nova linha
    li $v0, 4           # Syscall para imprimir string
    la $a0, newline     # Endereço da nova linha
    syscall

    # Incrementa o multiplicador
    addi $t1, $t1, 1

    # Verifica se o loop deve continuar (multiplicador <= 10)
    ble $t1, 10, loop

    # Saída do programa
    li $v0, 10          # Syscall para terminar o programa
    syscall
