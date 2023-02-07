    fp .req x29
    lr .req x30
// x0 holds a
f1:
    a .req x19 // alias for a
    result .req x20 // alias for result
    i .req x21 // alias for i

    stp fp, lr, [sp, -32]! // save fp and sp on stack
    mov fp, sp // move sp to fp

    str x19, [sp,16] // save x19
    mov a, x0 // move w0 to a

    str x20, [sp,24] // save x20
    mov result, xzr // move 0 to result
    
    str x21, [sp,32] // save x21
    mov i, xzr // move 0 to i

.lloop:
    add x0, i, a // add i and a, put into w0
    
    bl f2 // call f2

    add result, x0, result // add result and returned w0, put into result

    add i, i, #1 // add i and 1, put into i
    cmp i, #10 // compare i and 10
    blt .lloop // if i < 10, go to .lloop
    
    mov x0, result // move result to x0
    ldr x19, [sp,16] // restore x19
    ldr x20, [sp,24] // restore x20
    ldr x21, [sp,32] // restore x21
    ldp fp, lr, [sp], 32 // restore fp and sp
    ret // return x0
