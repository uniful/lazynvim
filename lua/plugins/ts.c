#include <stdio.h>

void show(int n,int m);

int main(int argc, char *argv[])
{
    show(2,3);

    printf("hello,world\n");

    return 0;
}

void show(int n,int m)
{
    printf("n+m = %d",n+m);
}
