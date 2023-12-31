#include <stdio.h>
#include <stdlib.h>
#include "../pcg_variants.h"

int test_pcg_output_rxs_m_xs_8_8(void)
{
    FILE *fp;

    // open a file to save the reference data
    fp = fopen("./8.dat", "w");

    // judge whether or not opening the file has succeeded
    if (!fp)
    {
        perror("File opening failed");
        return EXIT_FAILURE;
    }

    // calculate & save the reference data
    for (uint8_t state = 0;;)
    {
        fprintf(fp, "%d %d\n", (int8_t)state, (int8_t)pcg_output_rxs_m_xs_8_8(state));
        if (state == UINT8_MAX) break;
        state++;
    }

    // close the used file
    fclose(fp);

    return EXIT_SUCCESS;
}



int test_pcg_output_rxs_m_xs_16_16(void)
{
    FILE *fp;

    // open a file to save the reference data
    fp = fopen("./16.dat", "w");

    // judge whether or not opening the file has succeeded
    if (!fp)
    {
        perror("File opening failed");
        return EXIT_FAILURE;
    }

    // calculate & save the reference data
    for (uint16_t state = 0;;)
    {
        fprintf(fp, "%d %d\n", (int16_t)state, (int16_t)pcg_output_rxs_m_xs_16_16(state));
        if (state == UINT16_MAX) break;
        state++;
    }

    // close the used file
    fclose(fp);

    return EXIT_SUCCESS;
}



int test_pcg_output_rxs_m_xs_32_32(void)
{
    FILE *fp;

    // open a file to save the reference data
    fp = fopen("./32.dat", "w");

    // judge whether or not opening the file has succeeded
    if (!fp)
    {
        perror("File opening failed");
        return EXIT_FAILURE;
    }

    // calculate & save the reference data
    for (uint32_t state = 1; state > 0; state <<= 1)
    {
        fprintf(fp, "%d %d\n", (int32_t)state, (int32_t)pcg_output_rxs_m_xs_32_32(state));
    }

    // close the used file
    fclose(fp);

    return EXIT_SUCCESS;
}



int test_pcg_output_rxs_m_xs_64_64(void)
{
    FILE *fp;

    // open a file to save the reference data
    fp = fopen("./64.dat", "w");

    // judge whether or not opening the file has succeeded
    if (!fp)
    {
        perror("File opening failed");
        return EXIT_FAILURE;
    }

    // calculate & save the reference data
    for (uint64_t state = 1; state > 0; state <<= 1)
    {
        fprintf(fp, "%ld %ld\n", (int64_t)state, (int64_t)pcg_output_rxs_m_xs_64_64(state));
    }

    // close the used file
    fclose(fp);

    return EXIT_SUCCESS;
}



int main(void)
{
    int stat_test;

    stat_test = test_pcg_output_rxs_m_xs_8_8();
    if (stat_test == EXIT_FAILURE) return EXIT_FAILURE;

    stat_test = test_pcg_output_rxs_m_xs_16_16();
    if (stat_test == EXIT_FAILURE) return EXIT_FAILURE;

    stat_test = test_pcg_output_rxs_m_xs_32_32();
    if (stat_test == EXIT_FAILURE) return EXIT_FAILURE;

    stat_test = test_pcg_output_rxs_m_xs_64_64();
    if (stat_test == EXIT_FAILURE) return EXIT_FAILURE;

    return EXIT_SUCCESS;
}
