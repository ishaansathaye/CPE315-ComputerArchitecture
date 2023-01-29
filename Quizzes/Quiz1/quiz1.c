// Prototypes
int f2 (int);

// The function you should convert to ARM
int f1 (int a) {
  int result=0, i;
  
  for (i=0; i<10; i++) {
    // result += f2(i+a);
    result += 1;
  }
  return result;
}
