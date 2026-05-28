
#include "equasion/equasion.h"
#include <math.h>

void EquasionCtor(SquareEqT *equasion) {
  assert(equasion);

  equasion->a = NAN;
  equasion->b = NAN;
  equasion->c = NAN;
  equasion->root1 = NAN;
  equasion->root2 = NAN;
  equasion->numRoots = NO_ROOTS;
  equasion->errorFlags = ERR_NONE;
}

bool IsZero(float value) {
  static const float eps = 1e-6f;

  return fabsf(value) < eps;
}

void SolveEquasion(SquareEqT *equasion) {
  assert(equasion);

  if (IsZero(equasion->a)) {
    if (IsZero(equasion->b)) {
      equasion->numRoots = IsZero(equasion->c) ? INF_ROOTS : NO_ROOTS;
      return;
    }

    equasion->root1 = -equasion->c / equasion->b;
    equasion->numRoots = ONE_ROOT;
    return;
  }

  float discriminant =
      equasion->b * equasion->b - 4 * equasion->a * equasion->c;

  if (!IsZero(discriminant) && discriminant < 0) {
    equasion->numRoots = NO_ROOTS;
    return;
  }

  if (IsZero(discriminant)) {
    equasion->root1 = -equasion->b / (2 * equasion->a);
    equasion->numRoots = ONE_ROOT;
    return;
  }

  float sqrtD = sqrtf(discriminant);

  equasion->root1 = (-equasion->b - sqrtD) / (2 * equasion->a);
  equasion->root2 = (-equasion->b + sqrtD) / (2 * equasion->a);
  equasion->numRoots = TWO_ROOTS;
}
