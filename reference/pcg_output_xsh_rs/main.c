#include <stdio.h>
#include <stdlib.h>
#include "../pcg_variants.h"

int test_pcg_output_xsh_rs_16_8(void)
{
    FILE *fp;

    // open a file to save the reference data
    fp = fopen("./16_8.dat", "w");

    // judge whether or not opening the file has succeeded
    if (!fp)
    {
        perror("File opening failed");
        return EXIT_FAILURE;
    }

    // calculate & save the reference data
    for (uint16_t state = 0;;)
    {
        fprintf(fp, "%d %d\n", (int16_t)state, (int8_t)pcg_output_xsh_rs_16_8(state));
        if (state == UINT16_MAX) break;
        state++;
    }

    // close the used file
    fclose(fp);

    return EXIT_SUCCESS;
}



int test_pcg_output_xsh_rs_32_16(void)
{
    FILE *fp;

    // open a file to save the reference data
    fp = fopen("./32_16.dat", "w");

    // judge whether or not opening the file has succeeded
    if (!fp)
    {
        perror("File opening failed");
        return EXIT_FAILURE;
    }

    // calculate & save the reference data
    for (uint32_t state = 1; state > 0; state <<= 1)
    {
        fprintf(fp, "%d %d\n", (int32_t)state, (int16_t)pcg_output_xsh_rs_32_16(state));
    }

    // close the used file
    fclose(fp);

    return EXIT_SUCCESS;
}



int test_pcg_output_xsh_rs_64_32(void)
{
    FILE *fp;

    // open a file to save the reference data
    fp = fopen("./64_32.dat", "w");

    // judge whether or not opening the file has succeeded
    if (!fp)
    {
        perror("File opening failed");
        return EXIT_FAILURE;
    }

    // calculate & save the reference data
    for (uint64_t state = 1; state > 0; state <<= 1)
    {
        fprintf(fp, "%ld %d\n", (int64_t)state, (int32_t)pcg_output_xsh_rs_64_32(state));
    }

    // close the used file
    fclose(fp);

    return EXIT_SUCCESS;
}



int main(void)
{
    int stat_test;

    stat_test = test_pcg_output_xsh_rs_16_8();
    if (stat_test == EXIT_FAILURE) return EXIT_FAILURE;

    stat_test = test_pcg_output_xsh_rs_32_16();
    if (stat_test == EXIT_FAILURE) return EXIT_FAILURE;

    stat_test = test_pcg_output_xsh_rs_64_32();
    if (stat_test == EXIT_FAILURE) return EXIT_FAILURE;

    return EXIT_SUCCESS;
}
