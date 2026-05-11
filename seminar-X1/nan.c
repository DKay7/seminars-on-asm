// RUN: clang nan.c -o nan

#include <assert.h>
#include <math.h>
#include <stdio.h>

float divide(float a, float b);

int main() {

  printf("%.4f\n", divide(1.f, 4.f));
  printf("%.4f\n", divide(+1.f, 0.f));
  printf("%.4f\n", divide(-1.f, 0.f));
  printf("%.4f\n", divide(-0.f, +0.f));

  float x = 1e38f + divide(+0.f, +0.f);
  printf("%f:\n\tisnan(%f) = %d\n\tisinf(%f) = %d\n", x, x, isnan(x), x, isinf(x));
}

float divide(float a, float b) {
  // bad style:
  // assert(a == a);
  // assert(b == b);

  // always check values for NaNs since NaN propagation
  assert(!isnan(a));
  assert(!isnan(b));

  return a / b;
}
