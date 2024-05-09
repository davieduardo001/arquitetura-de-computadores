#include<stdio.h>

int main() {
    int fibo[15] = {1,1};
    int i;

    for(i=1; i < 14; i++)
        fibo[i+1] = fibo[i] + fibo[i-1];

    for(i=0; i < 15; i++)
        printf("%d ", fibo[i]);

    return 0;
}