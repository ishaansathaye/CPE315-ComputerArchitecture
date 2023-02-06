/*
Both functions take three integer parameters, and return one integer number. 

The C declarations are:
- int driver(int a, int b, int c)
- int mystery(int n, int m, int p)

The following ARM implementation of the driver function violates the register usage convention.
*/

driver:
    stp x20, x21, [sp, -16]!
    mov fp, sp
    add x19, x0, x1
    sub x20, x2, #1
    mov x21, x1
    mov x5, #0
.lloop:
    mov x0, x19
    mov x2, x21
    mov x1, x20
    add x5, x5, #1
    bl mystery
    add x19, x20, x0
    cmp x21, x5
    bne .lloop
.lend:
    mov x0, x19
    ldp x20, x21, [sp], 16
    ret
