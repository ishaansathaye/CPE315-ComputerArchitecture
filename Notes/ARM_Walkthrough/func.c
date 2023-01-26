#include <stdio.h>

int sum(int x, int y)
{
    return x+y;
}


void swap(int *x, int *y)
{
    int tmp;
    tmp = *x;
    *x = *y;
    *y = tmp;
}

int func(int a, int b)
{
    printf("a %d\nb %d\n\n", a, b);
    swap(&a, &b);
    printf("a %d\nb %d\n\n", a, b);
    return sum(a, b);
}

int main(int argc, char* argv[])
{
    int main_x = 7;
    int main_y = 10;
    int ret;
    printf("x %d\ny %d\n\n", main_x, main_y);
    //printf("x addr %p\ny addr %p\n", &main_x, &main_y);

    ret = func(main_x, main_y);

    printf("x %d\ny %d\n\n", main_x, main_y);
    return ret;
}
