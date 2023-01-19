/*
int testcod (int x, int y) {
    int equal;
    if (x == y) {
        equal = 1;
    } else {
        equal = 0;
    }
    return equal;
}
*/

    .arch armv8-a
    .text
    .global testcod

    equal_w2 .req w2

testcod:
    // x in wo
    // y in w1
    // equal in w2
    cmp w0, w1 // compare x and y
    beq .lthen // if equal, jump to .lthen
    mov w2, #0 // if not equal, set equal to 0
    b .lend // jump to .lend

.lthen:
    mov w2, #1 // if equal, set equal to 1

.lend:
    mov w0, w2 // return equal
    ret
