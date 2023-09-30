#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include "../../../reference/pcg_variants.h"



#define TARGET_PCG_STATE(rng_type, rng_size)                   pcg_state_ ## rng_type ## _ ## rng_size ## _
#define TARGET_PCG_STATE_INITIALIZER(rng_type, rng_size)       pcg_state_ ## rng_type ## _ ## rng_size ## _initializer
#define TARGET_PCG_STATE_INITIALIZER_BASE(rng_type, rng_size)  PCG_STATE_ ## rng_type ## _ ## rng_size ## _INITIALIZER
#define TARGET_PCG_RANDOM_R(rng_type, state_size, output_size) pcg_ ## rng_type ## _ ## state_size ## _xsl_rr_rr_ ## output_size ## _random_r



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
    RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, 64)



#define SIGNED_PCG_RXS_M_RANDOM_R(rng_type, state_size, output_size) \
    do { \
        TARGET_PCG_STATE(rng_type, state_size) rng = TARGET_PCG_STATE_INITIALIZER(rng_type, state_size); \
        for (int32_t i = 0; i < harvest_size; i++) \
        { \
            harvest[i] = TARGET_PCG_RANDOM_R(rng_type, state_size, output_size)(&rng); \
        } \
    } while (false);



TYPEDEF_PCG_STATE(64)



RENAME_PCG_STATE_INITIALIZERS(MCG,    mcg)
RENAME_PCG_STATE_INITIALIZERS(ONESEQ, oneseq)
RENAME_PCG_STATE_INITIALIZERS(SETSEQ, setseq)
RENAME_PCG_STATE_INITIALIZERS(UNIQUE, unique)



void signed_pcg_oneseq_64_xsl_rr_rr_64_random_r(const int32_t harvest_size, int64_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(oneseq, 64, 64)
}



void signed_pcg_setseq_64_xsl_rr_rr_64_random_r(const int32_t harvest_size, int64_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(setseq, 64, 64)
}



void signed_pcg_unique_64_xsl_rr_rr_64_random_r(const int32_t harvest_size, int64_t harvest[])
{
    SIGNED_PCG_RXS_M_RANDOM_R(unique, 64, 64)
}
