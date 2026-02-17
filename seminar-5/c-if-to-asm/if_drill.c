// Build assembly with: ./to_asm.sh

int sum_even_only(int n) {
  int i = 0;
  int sum = 0;

  while (i < n) {
    if ((i & 1) == 0) {
      sum += i;
    }
    i++;
  }

  return sum;
}

int main(void) {
  return sum_even_only(10);
}
