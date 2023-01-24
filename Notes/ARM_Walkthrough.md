# ARM Walkthrough

## Swap-Func-Main Example

### Func

```arm
fp .req x29
lr .req x30

.global func
func:
    stp fp, lr, [sp, -32]!
```
- Store Pointer Pair
- Make space for `func` on the stack by moving stack pointer down by 16 bytes
- Exclamation -> pre-increment

```arm
    mov fp, sp
```
- Store frame pointer value at the current stack pointer
    - So frame pointer points to the top of the stack, which is the original position

```arm
    // a comes in w0, store at fp+16
    str w0, [fp, 16]
    // b comes in s1 store at fp+24
    str s1, [fp, 24]

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

    ldp fp, lr, [sp], 32
    ret

```
- lp -> load pair
    - looks at stack pointer
    - puts everything back


