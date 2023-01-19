/*
void swap(int *a, int *b)
{
    int temp;
    temp = *x;
    *x = *y;
    *y = temp;
}
*/

    .arch armv8-a
    .text
    .global swap

swap:
    // x0 holds x, x1 holds y
    // w9 holds a temp value from the memory pointed to by x
    // w10 holds a temp value from the memory pointed to by y
    ldr w9, [x0] // w9 <= *x
    ldr w10 [x1] // w10 <= *y
    str w9, [x1] // *y <= w9
    str w10, [x0] // *x <= w10
    ret

