.data
fibo: .word 1, 1, 0:28    # Vetor fibo com 15 elementos inicializados com 1, 1 e zeros
newline: .asciiz "\n"

.text
.globl main

main:
    # Inicialização dos registradores
    li $t0, 1       # $t0 = 1 (fib(i))
    li $t1, 1       # $t1 = 1 (fib(i-1))
    li $t2, 2       # $t2 = 2 (i)
    li $t3, 15      # $t3 = 15 (tamanho do vetor)
    la $a0, fibo    # Endereço base do vetor fibo

loop:
    # Condição para o término do loop
    bge $t2, $t3, print_fibo

    # Calcula fib(i) = fib(i-1) + fib(i-2)
    lw $t4, 4($a0)      # Carrega fib(i-1)
    add $t0, $t0, $t1   # Calcula fib(i) = fib(i) + fib(i-1)
    sw $t0, 8($a0)      # Armazena fib(i) na próxima posição do vetor
    move $t1, $t4       # Atualiza fib(i-1) para o próximo loop
    addi $t2, $t2, 1    # Incrementa i

    # Avança para a próxima posição do vetor
    addi $a0, $a0, 4    # Incrementa o endereço do vetor

    # Loop
    j loop

print_fibo:
    # Impressão do vetor fibo
    li $v0, 4           # Syscall para imprimir string
    la $a0, newline     # Endereço da nova linha
    syscall

    li $v0, 1           # Syscall para imprimir inteiro
    la $a0, fibo        # Endereço base do vetor
    li $t2, 15          # $t2 = 15 (tamanho do vetor)

print_loop:
    # Imprime cada elemento do vetor
    lw $a0, 0($a0)      # Carrega o elemento atual do vetor
    syscall

    # Imprime espaço entre os elementos
    li $v0, 4           # Syscall para imprimir string
    la $a0, " "         # Endereço do espaço
    syscall

    # Avança para o próximo elemento do vetor
    addi $a0, $a0, 4    # Incrementa o endereço do vetor
    addi $t2, $t2, -1   # Decrementa contador

    # Verifica se chegou ao final do vetor
    bgtz $t2, print_loop

    # Saída do programa
    li $v0, 10          # Syscall para terminar o programa
    syscall
