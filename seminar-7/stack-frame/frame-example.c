
// GodBolt link:
// https://godbolt.org/z/GcxGnqb8Y

#include <stdio.h>

static int data[8] = {12, 7, 19, 3, 25, 14, 8, 10};
static const int data_size = sizeof(data) / sizeof(data[0]);

int compute_stats() {

  int sum = 0;
  int min = data[0];
  int max = data[0];

  for (int i = 0; i < data_size; i++) {
    int v = data[i];

    sum += v;

    if (v < min)
      min = v;

    if (v > max)
      max = v;
  }

  int range = max - min;
  int avg = sum / data_size;

  return avg + range;
}

int fill_buffer() {
  int value = 10;
  int step = 3;

  for (int i = 0; i < data_size; i++) {
    data[i] = value;
    value += step;
  }

  return compute_stats();
}

int main() {
  int stats = fill_buffer();
  printf("stats: %d\n", stats);
}

