#include <stdio.h>
#include <stdlib.h>
#include "../pcg_variants.h"

int test_pcg_output_xsl_rr_rr_64_64(void)
{
    FILE *fp;

    // open a file to save the reference data
    fp = fopen("./64_64.dat", "w");

    // judge whether or not opening the file has succeeded
    if (!fp)
    {
        perror("File opening failed");
        return EXIT_FAILURE;
    }

    // calculate & save the reference data
    for (uint64_t state = 1; state > 0; state <<= 1)
    {
        fprintf(fp, "%ld %d\n", (int64_t)state, (int32_t)pcg_output_xsl_rr_rr_64_64(state));
    }

    // close the used file
    fclose(fp);

    return EXIT_SUCCESS;
}



int main(void)
{
    int stat_test = test_pcg_output_xsl_rr_rr_64_64();
    if (stat_test == EXIT_FAILURE) return EXIT_FAILURE;

    return EXIT_SUCCESS;
}
