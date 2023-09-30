#include <inttypes.h>
#include <stdbool.h>
#include <stdio.h>
#include "../../reference/pcg_variants.h"

#ifndef PCG_C_INTERFACE_H_INCLUDED
#define PCG_C_INTERFACE_H_INCLUDED 1


    #define TARGET_PCG_STATE(rng_type, rng_size)                   pcg_state_ ## rng_type ## _ ## rng_size ## _
    #define TARGET_PCG_STATE_INITIALIZER(rng_type, rng_size)       pcg_state_ ## rng_type ## _ ## rng_size ## _initializer
    #define TARGET_PCG_STATE_INITIALIZER_BASE(rng_type, rng_size)  PCG_STATE_ ## rng_type ## _ ## rng_size ## _INITIALIZER



    #define TARGET_PCG_RANDOM_R(rng_type, state_size, output_type, output_size) pcg_ ## rng_type ## _ ## state_size ## _ ## output_type ## _ ## output_size ## _random_r



    #define TYPEDEF_PCG_STATE(rng_size) \
        typedef struct pcg_state_        ## rng_size TARGET_PCG_STATE(mcg,    rng_size); \
        typedef struct pcg_state_        ## rng_size TARGET_PCG_STATE(oneseq, rng_size); \
        typedef struct pcg_state_        ## rng_size TARGET_PCG_STATE(unique, rng_size); \
        typedef struct pcg_state_setseq_ ## rng_size TARGET_PCG_STATE(setseq, rng_size);



    #define RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, rng_size) \
        static const TARGET_PCG_STATE(rng_type_sml, rng_size) \
        TARGET_PCG_STATE_INITIALIZER(rng_type_sml, rng_size) = \
        TARGET_PCG_STATE_INITIALIZER_BASE(rng_type_cap, rng_size);



    #define RENAME_PCG_STATE_INITIALIZERS(rng_type_cap, rng_type_sml) \
        RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml,  8) \
        RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, 16) \
        RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, 32) \
        RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, 64)



    #define SIGNED_PCG_RANDOM_R_IMPLEMENTATION(rng_type, state_size, output_type, output_size) \
        do { \
            TARGET_PCG_STATE(rng_type, state_size) rng = TARGET_PCG_STATE_INITIALIZER(rng_type, state_size); \
            for (int32_t i = 0; i < harvest_size; i++) \
            { \
                harvest[i] = TARGET_PCG_RANDOM_R(rng_type, state_size, output_type, output_size)(&rng); \
            } \
        } while (false);



    TYPEDEF_PCG_STATE( 8)
    TYPEDEF_PCG_STATE(16)
    TYPEDEF_PCG_STATE(32)
    TYPEDEF_PCG_STATE(64)



    RENAME_PCG_STATE_INITIALIZERS(MCG,    mcg)
    RENAME_PCG_STATE_INITIALIZERS(ONESEQ, oneseq)
    RENAME_PCG_STATE_INITIALIZERS(SETSEQ, setseq)
    RENAME_PCG_STATE_INITIALIZERS(UNIQUE, unique)

#endif /* PCG_C_INTERFACE_H_INCLUDED */
