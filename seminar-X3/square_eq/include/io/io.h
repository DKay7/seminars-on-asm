#ifndef IO_H
#define IO_H

#include "equasion/equasion.h"
#include <assert.h>
#include <stdbool.h>

void InputCoef(SquareEqT *equasion);
bool ReadCoefFromArgs(int argc, const char *argv[], SquareEqT *equasion);
void PrintAnswers(const SquareEqT *equasion);
void ReportErrors(const SquareEqT *equasion);

#endif
