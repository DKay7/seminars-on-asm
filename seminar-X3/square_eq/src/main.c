
#include "io/io.h"
#include "equasion/solver.h"

int main(int argc, const char **argv) {
  SquareEqT equasion;

  EquasionCtor(&equasion);

  if (argc > 1)
    ReadCoefFromArgs(argc, argv, &equasion);
  else
    InputCoef(&equasion);

  if (equasion.errorFlags != ERR_NONE) {
    ReportErrors(&equasion);
    return 1;
  }

  SolveEquasion(&equasion);
  PrintAnswers(&equasion);

  return 0;
}
