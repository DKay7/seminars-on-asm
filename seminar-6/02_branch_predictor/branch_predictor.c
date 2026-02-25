// RUN: clang -m32 -O2 -fno-pie -S -emit-llvm -fno-discard-value-names branch_predictor.c -o branch_predictor

// RUN: export EVENTS="branches,branch-misses,cycles,instructions"

// RUN:  perf stat -e "$EVENTS" branch_predictor random 2000000 40

// RUN:  perf stat -e "$EVENTS" branch_predictor predictable 2000000 40

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static volatile int sink = 0;

#define likely(x) __builtin_expect(!!(x), 1)
#define unlikely(x) __builtin_expect(!!(x), 0)

static int branchy_sum(const int *arr, int n) {
  int sum = 0;
  for (int i = 0; i < n; i++) {
    if (unlikely(arr[i] > 0)) { // We tell branch-predictor that
                                // this condition is unlikely to happen
      sum += arr[i];
      sink = sum; /* keep branch explicit, avoid cmov */
    }
  }
  return sum;
}

static void fill_data(int *arr, int n, const char *mode) {
  if (strcmp(mode, "predictable") == 0) {
    for (int i = 0; i < n; i++) {
      arr[i] = (rand() % 100) + 1; /* always positive => predictable branch */
    }
    return;
  }

  if (strcmp(mode, "random") == 0) {
    for (int i = 0; i < n; i++) {
      arr[i] = (rand() & 1) ? 1 : -1; /* random sign => hard to predict */
    }
    return;
  }

  fprintf(stderr, "Unknown mode: %s (use predictable|random)\n", mode);
  exit(2);
}

int main(int argc, char **argv) {
  const char *mode = (argc > 1) ? argv[1] : "random";
  int n = (argc > 2) ? atoi(argv[2]) : 2000000;
  int rounds = (argc > 3) ? atoi(argv[3]) : 40;

  if (n <= 0 || rounds <= 0) {
    fprintf(stderr, "Usage: %s [predictable|random] [n] [rounds]\n", argv[0]);
    return 2;
  }

  int *arr = (int *)malloc((size_t)n * sizeof(int));
  if (!arr) {
    perror("malloc");
    return 1;
  }

  srand(1);
  fill_data(arr, n, mode);

  volatile int warmup = branchy_sum(arr, n);
  (void)warmup;

  long long checksum = 0;
  for (int r = 0; r < rounds; r++) {
    checksum += branchy_sum(arr, n);
  }

  printf("mode=%s n=%d rounds=%d checksum=%lld sink=%d\n", mode, n, rounds,
         checksum, sink);

  free(arr);
  return 0;
}
