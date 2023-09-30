#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "../pcg_variants.h"



#define TARGET_UNSIGNED_INT(rng_size)     uint ## rng_size ## _t
#define TARGET_UNSIGNED_INT_MAX(rng_size) UINT ## rng_size ## _MAX

#define TARGET_PCG_STATE(rng_type, rng_size)                  pcg_state_ ## rng_type ## _ ## rng_size ## _
#define TARGET_PCG_STATE_INITIALIZER(rng_type, rng_size)      pcg_state_ ## rng_type ## _ ## rng_size ## _initializer
#define TARGET_PCG_STATE_INITIALIZER_BASE(rng_type, rng_size) PCG_STATE_ ## rng_type ## _ ## rng_size ## _INITIALIZER
#define TEST_TARGET(rng_type, rng_size)                       pcg_       ## rng_type ## _ ## rng_size ## _advance_r



#define TYPEDEF_PCG_STATE(rng_size) \
    typedef struct pcg_state_        ## rng_size pcg_state_mcg_    ## rng_size ## _; \
    typedef struct pcg_state_        ## rng_size pcg_state_oneseq_ ## rng_size ## _; \
    typedef struct pcg_state_        ## rng_size pcg_state_unique_ ## rng_size ## _; \
    typedef struct pcg_state_setseq_ ## rng_size pcg_state_setseq_ ## rng_size ## _;



#define RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, rng_size) \
    const TARGET_PCG_STATE(rng_type_sml, rng_size) TARGET_PCG_STATE_INITIALIZER(rng_type_sml, rng_size) = PCG_STATE_ ## rng_type_cap ## _ ## rng_size ## _INITIALIZER;



#define RENAME_PCG_STATE_INITIALIZERS(rng_type_cap, rng_type_sml) \
    RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml,  8) \
    RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, 16) \
    RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, 32) \
    RENAME_PCG_STATE_INITIALIZER(rng_type_cap, rng_type_sml, 64)



#define OUTPUT_FILE_PATH(rng_type, rng_size) ("./" #rng_type "_" #rng_size ".dat")

#define FPRINTF_FORMAT(rng_size)        ( (rng_size < 64) ? ("%X %X\n")    : ("%lX %lX\n")     )
#define FPRINTF_FORMAT_SETSEQ(rng_size) ( (rng_size < 64) ? ("%X %X %X\n") : ("%lX %lX %lX\n") )



#define TEST_CODE_CORE(rng_type, rng_size) \
    do { \
        rng.state = state; \
        TEST_TARGET(rng_type, rng_size)(&rng, -6); \
        fprintf(fp, FPRINTF_FORMAT(rng_size), state, rng.state); \
    } while(false);



#define TEST_CODE(rng_type, rng_size) \
    do { \
        \
        /* open a file to save the reference data */ \
        FILE *fp = fopen(OUTPUT_FILE_PATH(rng_type, rng_size), "w"); \
        \
        /* judge whether or not opening the file has succeeded */ \
        if (!fp) { \
            perror("File opening failed"); \
            return EXIT_FAILURE; \
        } \
        \
        /* calculate & save the reference data */ \
        { \
            TARGET_PCG_STATE(rng_type, rng_size) rng; \
            \
            if (rng_size < 32) { \
                for (TARGET_UNSIGNED_INT(rng_size) state = 0;;) \
                { \
                    TEST_CODE_CORE(rng_type, rng_size) \
                    if (state == TARGET_UNSIGNED_INT_MAX(rng_size)) {break;} \
                    state++; \
                } \
            }\
            else { \
                for (TARGET_UNSIGNED_INT(rng_size) state = 1; state > 0; state <<= 1) \
                { \
                    TEST_CODE_CORE(rng_type, rng_size) \
                } \
            } \
        } \
    } while(false);



#define TEST_CODE_CORE_SETSEQ(rng_size) \
    do { \
        rng = TARGET_PCG_STATE_INITIALIZER(setseq, rng_size); \
        rng.state = state; \
        TEST_TARGET(setseq, rng_size)(&rng, -6); \
        fprintf(fp, FPRINTF_FORMAT_SETSEQ(rng_size), state, rng.state, rng.inc); \
    } while(false);



#define TEST_CODE_SETSEQ(rng_size) \
    do { \
        \
        /* open a file to save the reference data */ \
        FILE *fp = fopen(OUTPUT_FILE_PATH(setseq, rng_size), "w"); \
        \
        /* judge whether or not opening the file has succeeded */ \
        if (!fp) { \
            perror("File opening failed"); \
            return EXIT_FAILURE; \
        } \
        \
        /* calculate & save the reference data */ \
        { \
            TARGET_PCG_STATE(setseq, rng_size) rng; \
            \
            if (rng_size < 32) { \
                for (TARGET_UNSIGNED_INT(rng_size) state = 0;;) \
                { \
                    TEST_CODE_CORE_SETSEQ(rng_size) \
                    if (state == TARGET_UNSIGNED_INT_MAX(rng_size)) {break;} \
                    state++; \
                } \
            }\
            else { \
                for (TARGET_UNSIGNED_INT(rng_size) state = 1; state > 0; state <<= 1) \
                { \
                    TEST_CODE_CORE_SETSEQ(rng_size) \
                } \
            } \
        } \
    } while(false);



int main(void)
{
    TYPEDEF_PCG_STATE( 8)
    TYPEDEF_PCG_STATE(16)
    TYPEDEF_PCG_STATE(32)
    TYPEDEF_PCG_STATE(64)

    RENAME_PCG_STATE_INITIALIZERS(SETSEQ, setseq)

    TEST_CODE(mcg,  8)
    TEST_CODE(mcg, 16)
    TEST_CODE(mcg, 32)
    TEST_CODE(mcg, 64)

    TEST_CODE(oneseq,  8)
    TEST_CODE(oneseq, 16)
    TEST_CODE(oneseq, 32)
    TEST_CODE(oneseq, 64)

    TEST_CODE_SETSEQ( 8)
    TEST_CODE_SETSEQ(16)
    TEST_CODE_SETSEQ(32)
    TEST_CODE_SETSEQ(64)

    TEST_CODE(unique,  8)
    TEST_CODE(unique, 16)
    TEST_CODE(unique, 32)
    TEST_CODE(unique, 64)

    return EXIT_SUCCESS;
}
