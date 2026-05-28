#include "io/io.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static bool ReadFloat(const char *str, float *value) {
  assert(str != NULL);
  assert(value != NULL);

  char *end = NULL;
  float result = strtof(str, &end);

  if (end == str || *end != '\0')
    return false;

  *value = result;
  return true;
}

void InputCoef(SquareEqT *equasion) {
  assert(equasion);

  bool inputOk = false;

  do {
    printf("Enter coefficients: a, b, c\n");

    int numReaded = scanf("%f %f %f", &equasion->a, &equasion->b, &equasion->c);
    inputOk = (numReaded == 3);

    if (!inputOk) {
      int ch = 0;

      equasion->errorFlags |= ERR_BAD_INPUT;
      printf("error reading coefs. try again\n");
      while ((ch = getchar()) != '\n' && ch != EOF) {
      }
    }

  } while (!inputOk);
}

bool ReadCoefFromArgs(int argc, const char **argv, SquareEqT *equasion) {
  assert(argc > 0);
  assert(argv != NULL);
  assert(equasion != NULL);

  bool hasA = false;
  bool hasB = false;
  bool hasC = false;

  for (int i = 1; i < argc; i += 2) {
    if (i + 1 >= argc) {
      equasion->errorFlags |= ERR_BAD_INPUT;
      return false;
    }

    if (strcmp(argv[i], "-a") == 0) {
      hasA = ReadFloat(argv[i + 1], &equasion->a);
    } else if (strcmp(argv[i], "-b") == 0) {
      hasB = ReadFloat(argv[i + 1], &equasion->b);
    } else if (strcmp(argv[i], "-c") == 0) {
      hasC = ReadFloat(argv[i + 1], &equasion->c);
    } else {
      equasion->errorFlags |= ERR_BAD_INPUT;
      return false;
    }
  }

  if (!hasA || !hasB || !hasC)
    equasion->errorFlags |= ERR_BAD_INPUT;

  return equasion->errorFlags == ERR_NONE;
}

void PrintAnswers(const SquareEqT *equasion) {
  assert(equasion);

  switch (equasion->numRoots) {
  case NO_ROOTS:
    printf("No roots\n");
    break;

  case ONE_ROOT:
    printf("One root: %g\n", equasion->root1);
    break;

  case TWO_ROOTS:
    printf("Two roots: %g %g\n", equasion->root1, equasion->root2);
    break;

  case INF_ROOTS:
    printf("Infinite number of roots\n");
    break;

  default:
    printf("Unknown solver state\n");
    break;
  }
}

void ReportErrors(const SquareEqT *equasion) {
  assert(equasion);

  if (equasion->errorFlags == ERR_NONE)
    return;

  if (equasion->errorFlags & ERR_BAD_INPUT)
    printf("Bad input\n");
}
