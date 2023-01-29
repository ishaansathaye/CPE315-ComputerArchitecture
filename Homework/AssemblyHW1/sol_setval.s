fp .req x29 
lr .req x30

setval:
    // x0 holds limit. Since we do not modify it 
    limit .req w19
    // val is stored on the stack at offset 24

    // going to need 4 8−byte stack locations (3 registers , one temp) 
    // So moving stack pointer by 32 (4x8)
    stp fp, lr, [sp, -32]!
    // After the stp insn, sp points to the value that was in fp/x29 
    // sp+8 points to what was in lr/x30
    
    // save the sp value to x29 so we can use that register instead 
    // This is equivalent to a mov
    add fp, sp, 0
    // all callee−saved registers we plan to use need to be preserved 
    // the full 64−bit register is saved even though we will only use 
    // 32 bits of it
    str x19, [sp,16]
    // Save incoming parameter limit to callee−saved x19
    mov limit, w0
    // initialize val to 0 on the stack
    str wzr, [fp,24]
    // check to see if we should inter the loop
    cmp limit , wzr 
    ble . lnoloop

.lloop:
    // The address of val is the first parameter 
    // addresses are 64−bit
    add x0, fp, 24
    // limit is the second parameter
    mov w1, limit
    bl myfunc
    // get any modified value of val
    ldr w0, [fp,24]
    // check the loop condition
    cmp w0, limit
    blt .lloop
    b .lexit

.lnoloop:
    mov x0, 0

.lexit:
    // restore any callee−saved registers 
    // remember to restore all 64 bits
    ldr x19, [sp,16]
    ldp fp, lr, [sp], 32 
    ret