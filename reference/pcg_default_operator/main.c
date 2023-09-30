#include <stdio.h>
#include <stdlib.h>
#include "../pcg_variants.h"

#define FMT_DECIMAL(size)     (size < 64) ? ("%uU") : ("%lluULL")
#define FMT_HEXADECIMAL(size) (size < 64) ? ("%X")  : ("%llX")

#define CONSTANT_NAME_GENERATOR(operator, size) PCG_DEFAULT_ ## operator ## _ ## size

#define FORTRAN_CODE_GENERATOR_UNIT(operator, size) \
    printf("!> Equal to `"); \
    printf(FMT_DECIMAL(size), CONSTANT_NAME_GENERATOR(operator, size)); \
    printf("`\n"); \
    printf("integer(int%u), parameter, private :: PCG_DEFAULT_%s_%u = int(Z'", size, #operator, size); \
    printf(FMT_HEXADECIMAL(size), CONSTANT_NAME_GENERATOR(operator, size)); \
    printf("', int%u)\n\n", size);

#define FORTRAN_CODE_GENERATOR_SET(operator) \
    FORTRAN_CODE_GENERATOR_UNIT(operator,  8) \
    FORTRAN_CODE_GENERATOR_UNIT(operator, 16) \
    FORTRAN_CODE_GENERATOR_UNIT(operator, 32) \
    FORTRAN_CODE_GENERATOR_UNIT(operator, 64)



int main(void)
{
    FORTRAN_CODE_GENERATOR_SET(INCREMENT)
    FORTRAN_CODE_GENERATOR_SET(MULTIPLIER)
    return EXIT_SUCCESS;
}
