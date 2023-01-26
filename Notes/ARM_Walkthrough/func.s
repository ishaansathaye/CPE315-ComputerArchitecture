fp .req x29 
lr .req x30

/*

int func(int a, int b)
{
  printf("a %d\nb %d\n\n", a, b);
  swap(&a, &b);
  printf("a %d\nb %d\n\n", a, b);
  return sum(a, b);
}


*/


.global func
func:
    stp fp, lr, [sp, -32]!
    mov fp, sp

    // a comes in w0, store at fp+16
    str w0, [fp, 16]
    // b comes in w1 store at fp+24
    str w1, [fp, 24]
   

    // Setup the print
    ldr x0, =funcprint
    ldr w1, [fp, 16]
    ldr w2, [fp, 24]
    bl printf

    // Setup the swap, need to pass addresses
    add x0, fp, 16
    add x1, fp, 24
    bl swap
 

    // Another print
    ldr x0, =funcprint
    ldr w1, [fp, 16]
    ldr w2, [fp, 24]
    bl printf

    
    // Setup call to sum, need to pass values
    ldr w0, [fp, 16]
    ldr w1, [fp, 24]
    bl sum

    ldp fp, x30, [sp], 32
    ret

   
.global swap
swap:
    // x0 contains address of x, x1 contains address of y
    // return value in w0
    ldr w2, [x0]
    ldr w3, [x1]
    str w2, [x1]
    str w3, [x0]
    ret


.global sum
sum:
    // x comes in w0, y in w1
    // return value in w0
    add w0, w0, w1
    ret


.global     main
main:
    // pre-increment the stack point to create space for two 8-byte registers
    // link register (x30), and frame pointer (fp), and store them.
    // Making space for main_x at 16, main_y at 24, ret at 32
    stp     fp, x30, [sp, -48]!
    mov fp, sp

    // Initialize main_x, main_y
    mov w0, #7
    str w0, [fp, 16]

    mov w0, #10
    str w0, [fp, 24]

    ldr x0, =printformat
    ldr w1, [fp, 16]
    ldr w2, [fp, 24]
    bl printf

    ldr w0, [fp, 16]
    ldr w1, [fp, 24]
    bl func
    str w0, [fp, 32]

    ldr x0, =printformat
    ldr w1, [fp, 16]
    ldr w2, [fp, 24]
    bl printf

    // restore the registers and post-decrement 
    // the stack pointer for consistency
    ldr w0, [fp, 32]
    ldp     fp, x30, [sp], 48
    // return from the call
    ret


printformat:
    .asciz "x %d\ny %d\n\n"
funcprint:
    .asciz "a %d\nb %d\n\n"

