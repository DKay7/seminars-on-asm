// RUN: check on godbolt https://godbolt.org/z/n6hWseMfc

#include <stdio.h>

unsigned int ror32(unsigned int value, unsigned int shift) {
  return (value >> shift) | (value << (32 - shift));
}

int main() {

  unsigned int x = 0;
  unsigned int n = 0;
  scanf("%ud %ud", &x, &n);
  unsigned char x_shifted = ror32(x, n);

  printf("%b -> %b\n", x, x_shifted);
}
