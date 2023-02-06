    .global f1
f1: 
    stp x29, x30, [sp, -32]!  // save FP and LR
    add x29, sp, 0            // Save SP to FP
    stp x19, x20, [x29,16]    // Save two callee−saved regs
    mov x20, x0               // Initialize result to parameter a
    mov x19, 0                // Initialize i to 0

loop:
    mov x0, x19               // Save i to parameter register
    bl f2                    // Call f2
    add x20, x20, x0          // Increment result with return from f2
    add x19, x19, 1           // Increment i
    cmp x19, 10               // Compare i to 10
    bne loop                  // Continue if not equal

    mov x0, x20               // Move result to return value reg
    ldp x19, x20, [sp,16]     // Restore callee−saved regs
    ldp x29, x30, [sp], 32    // Restore FP and LR and SP
    ret                           // Return