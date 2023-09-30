#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include "../../../reference/pcg_variants.h"
#include "../../pcg_random_number/pcg_c_interface.h"



void signed_pcg_mcg_16_xsh_rs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(mcg, 16, xsh_rs, 8)
}



void signed_pcg_oneseq_16_xsh_rs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 16, xsh_rs, 8)
}



void signed_pcg_setseq_16_xsh_rs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 16, xsh_rs, 8)
}



void signed_pcg_unique_16_xsh_rs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 16, xsh_rs, 8)
}



void signed_pcg_mcg_32_xsh_rs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(mcg, 32, xsh_rs, 16)
}



void signed_pcg_oneseq_32_xsh_rs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 32, xsh_rs, 16)
}



void signed_pcg_setseq_32_xsh_rs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 32, xsh_rs, 16)
}



void signed_pcg_unique_32_xsh_rs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 32, xsh_rs, 16)
}



void signed_pcg_mcg_64_xsh_rs_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(mcg, 64, xsh_rs, 32)
}



void signed_pcg_oneseq_64_xsh_rs_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 64, xsh_rs, 32)
}



void signed_pcg_setseq_64_xsh_rs_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 64, xsh_rs, 32)
}



void signed_pcg_unique_64_xsh_rs_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 64, xsh_rs, 32)
}
