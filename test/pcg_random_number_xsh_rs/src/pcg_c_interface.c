#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include "../../../reference/pcg_variants.h"



#define TARGET_PCG_STATE(rng_type, rng_size)                   pcg_state_ ## rng_type ## _ ## rng_size ## _
#define TARGET_PCG_STATE_INITIALIZER(rng_type, rng_size)       pcg_state_ ## rng_type ## _ ## rng_size ## _initializer
#define TARGET_PCG_STATE_INITIALIZER_BASE(rng_type, rng_size)  PCG_STATE_ ## rng_type ## _ ## rng_size ## _INITIALIZER
#define TARGET_PCG_RANDOM_R(rng_type, state_size, output_size) pcg_ ## rng_type ## _ ## state_size ## _xsh_rs_ ## output_size ## _random_r



#define TYPEDEF_PCG_STATE(rng_size) \
    typedef struct pcg_state_        ## rng_size TARGET_PCG_STATE(mcg,    rng_size); \
    typedef struct pcg_state_        ## rng_size TARGET_PCG_STATE(oneseq, rng_size); \
    typedef struct pcg_state_        ## rng_size TARGET_PCG_STATE(unique, rng_size); \
    typedef struct pcg_state_setseq_ ## rng_size TARGET_PCG_STATE(setseq, rng_size);



#define RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, rng_size) \
    const TARGET_PCG_STATE(rng_type_sml, rng_size) \
    TARGET_PCG_STATE_INITIALIZER(rng_type_sml, rng_size) = \
    TARGET_PCG_STATE_INITIALIZER_BASE(rng_type_cap, rng_size);

#define RENAME_PCG_STATE_INITIALIZERS(rng_type_cap, rng_type_sml) \
    RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, 16) \
    RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, 32)



#define SIGNED_PCG_RXS_M_RANDOM_R(rng_type, state_size, output_size) \
    do { \
        TARGET_PCG_STATE(rng_type, state_size) rng = TARGET_PCG_STATE_INITIALIZER(rng_type, state_size); \
        for (int32_t i = 0; i < harvest_size; i++) \
        { \
            harvest[i] = TARGET_PCG_RANDOM_R(rng_type, state_size, output_size)(&rng); \
        } \
    } while (false);



TYPEDEF_PCG_STATE(16)
TYPEDEF_PCG_STATE(32)



RENAME_PCG_STATE_INITIALIZERS(MCG,    mcg)
RENAME_PCG_STATE_INITIALIZERS(ONESEQ, oneseq)
RENAME_PCG_STATE_INITIALIZERS(SETSEQ, setseq)
RENAME_PCG_STATE_INITIALIZERS(UNIQUE, unique)



void signed_pcg_mcg_16_xsh_rs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(mcg, 16, 8)
}



void signed_pcg_oneseq_16_xsh_rs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 16, 8)
}



void signed_pcg_setseq_16_xsh_rs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 16, 8)
}



void signed_pcg_unique_16_xsh_rs_8_random_r(const int32_t harvest_size, int8_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 16, 8)
}



void signed_pcg_mcg_32_xsh_rs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(mcg, 32, 16)
}



void signed_pcg_oneseq_32_xsh_rs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 32, 16)
}



void signed_pcg_setseq_32_xsh_rs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 32, 16)
}



void signed_pcg_unique_32_xsh_rs_16_random_r(const int32_t harvest_size, int16_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 32, 16)
}
