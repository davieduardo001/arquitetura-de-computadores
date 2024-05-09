.data
prompt: .asciiz "Digite um número: "
result: .asciiz "O fatorial é: "
newline: .asciiz "\n"

.text
.globl main

# Função para calcular o fatorial de um número
# Input: $a0 - número cujo fatorial será calculado
# Output: $v0 - fatorial de $a0
fatorial:
    li $v0, 1       # Inicializa $v0 com 1 (caso base)
    blez $a0, return_case   # Se n <= 0, retorna 1

loop:
    mul $v0, $v0, $a0   # fatorial *= n
    addi $a0, $a0, -1   # Decrementa n
    bnez $a0, loop      # Se n != 0, continua o loop

return_case:
    jr $ra              # Retorna para o endereço de retorno

main:
    # Prompt para o usuário digitar um número
    li $v0, 4           # Syscall para imprimir string
    la $a0, prompt      # Endereço da string de prompt
    syscall

    # Recebe o número do usuário
    li $v0, 5           # Syscall para ler inteiro
    syscall
    move $a0, $v0       # Move o número para $a0

    # Chama a função fatorial
    jal fatorial

    # Imprime o resultado
    li $v0, 4           # Syscall para imprimir string
    la $a0, result      # Endereço da string de resultado
    syscall

    # Imprime o resultado do fatorial
    li $v0, 1           # Syscall para imprimir inteiro
    move $a0, $v0       # Move o resultado para $a0
    syscall

    # Saída do programa
    li $v0, 10          # Syscall para terminar o programa
    syscall
