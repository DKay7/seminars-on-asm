#ifndef EQUASION_H
#define EQUASION_H

#include <assert.h>
#include <stdbool.h>
#include <stdint.h>

typedef enum {
  NO_ROOTS = 0,
  ONE_ROOT = 1,
  TWO_ROOTS = 2,
  INF_ROOTS = 3
} NumRoots;

typedef enum { ERR_NONE = 0, ERR_BAD_INPUT = 1 << 0 } ErrorFlags;

typedef struct {
  float a, b, c;
  float root1, root2;
  NumRoots numRoots;

  uint16_t errorFlags;
} SquareEqT;

void EquasionCtor(SquareEqT *equasion);
void SolveEquasion(SquareEqT *equasion);

bool IsZero(float value);

#endif
