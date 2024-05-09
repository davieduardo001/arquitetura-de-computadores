#include <stdio.h>

int fatorial(int n);

int main() {
    int n, f;

    printf("Digite um número: ");
    scanf("%d", &n);

    f = fatorial(n);

    printf("O fatorial é: %d\n", f);

    return 0;
}

int fatorial(int n) {
    if (n == 0 || n == 1)
        return 1;
    else
        return n * fatorial(n - 1);
}
