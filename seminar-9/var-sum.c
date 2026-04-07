// https://godbolt.org/z/MaGeYWb7d

#include <stdarg.h>
#include <stdio.h>

int sum(int count, ...) {
  va_list args;
  va_start(args, count);

  int s = 0;

  for (int i = 0; i < count; i++) {
    s += va_arg(args, int);
  }

  va_end(args);

  return s;
}

int main() {
  int a = sum(3, 10, 20, 30);
  int b = sum(5, 1, 2, 3, 4, 5);

  printf("sum1 = %d\n", a);
  printf("sum2 = %d\n", b);

  return 0;
}
