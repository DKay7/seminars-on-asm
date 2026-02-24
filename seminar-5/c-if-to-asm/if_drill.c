// Build assembly with: ./to_asm.sh

// int sum_even_only(int n) {
//   int i = 0;
//   int sum = 0;
//
//   while (i < n) {
//     if ((i & 1) == 0) {
//       sum += i;
//     }
//     i++;
//   }
//
//   return sum;
// }

#include <stdio.h>

int is_odd(int n) {
  if (n % 2 == 0) {
    printf("Is even!\n");
  }
  else {
    printf("Is odd!\n");
    return 0;
  }

}

int main(void) {
  return is_odd(10);
  // return sum_even_only(10);
}
