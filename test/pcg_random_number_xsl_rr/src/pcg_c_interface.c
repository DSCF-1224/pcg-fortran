#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include "../../../reference/pcg_variants.h"
#include "../../pcg_random_number/pcg_c_interface.h"



void signed_pcg_mcg_64_xsl_rr_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(mcg, 64, xsl_rr, 32)
}



void signed_pcg_oneseq_64_xsl_rr_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 64, xsl_rr, 32)
}



void signed_pcg_setseq_64_xsl_rr_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 64, xsl_rr, 32)
}



void signed_pcg_unique_64_xsl_rr_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 64, xsl_rr, 32)
}
