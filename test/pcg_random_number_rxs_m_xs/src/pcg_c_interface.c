#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include "../../../reference/pcg_variants.h"
#include "../../pcg_random_number/pcg_c_interface.h"



void signed_pcg_oneseq_8_rxs_m_xs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 8, rxs_m_xs, 8)
}



void signed_pcg_setseq_8_rxs_m_xs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 8, rxs_m_xs, 8)
}



void signed_pcg_oneseq_16_rxs_m_xs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 16, rxs_m_xs, 16)
}



void signed_pcg_unique_16_rxs_m_xs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 16, rxs_m_xs, 16)
}



void signed_pcg_setseq_16_rxs_m_xs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 16, rxs_m_xs, 16)
}



void signed_pcg_oneseq_32_rxs_m_xs_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 32, rxs_m_xs, 32)
}



void signed_pcg_setseq_32_rxs_m_xs_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 32, rxs_m_xs, 32)
}



void signed_pcg_unique_32_rxs_m_xs_32_random_r(const int32_t harvest_size, int32_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 32, rxs_m_xs, 32)
}



void signed_pcg_oneseq_64_rxs_m_xs_64_random_r(const int32_t harvest_size, int64_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 64, rxs_m_xs, 64)
}



void signed_pcg_unique_64_rxs_m_xs_64_random_r(const int32_t harvest_size, int64_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 64, rxs_m_xs, 64)
}



void signed_pcg_setseq_64_rxs_m_xs_64_random_r(const int32_t harvest_size, int64_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 64, rxs_m_xs, 64)
}
