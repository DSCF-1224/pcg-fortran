#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../pcg_variants.h"



#define TARGET_PCG_STATE(rng_type, rng_size) pcg_state_ ## rng_type ## _ ## rng_size ## _
#define TEST_TARGET(rng_type, rng_size)      pcg_       ## rng_type ## _ ## rng_size ## _step_r

#define TARGET_SIGNED_INT(rng_size)        int ## rng_size ## _t
#define TARGET_UNSIGNED_INT(rng_size)     uint ## rng_size ## _t
#define TARGET_UNSIGNED_INT_MAX(rng_size) UINT ## rng_size ## _MAX



#define FPRINTF_FORMAT(rng_size) ((rng_size < 64) ? ("%x %x\n") : ("%lx %lx\n"))

#define OUTPUT_FILE_PATH(rng_type, rng_size) ("./" #rng_type "_" #rng_size ".dat")

#define TEST_CODE_CORE(rng_type, rng_size) \
    do { \
        TARGET_PCG_STATE(rng_type, rng_size) rng; \
        rng.state = state; \
        TEST_TARGET(rng_type, rng_size)(&rng); \
        fprintf( \
            fp, \
            FPRINTF_FORMAT(rng_size), \
            (TARGET_SIGNED_INT(rng_size))state, \
            (TARGET_SIGNED_INT(rng_size))(rng.state) \
        ); \
    } while(false);

#define TEST_CODE_UNIT(rng_type, rng_size) \
    do { \
        FILE *fp; \
        /* open a file to save the reference data */ \
        fp = fopen(OUTPUT_FILE_PATH(rng_type, rng_size), "w"); \
        \
        /* judge whether or not opening the file has succeeded */ \
        if (!fp) { \
            perror("File opening failed"); \
            return EXIT_FAILURE; \
        } \
        \
        /* calculate & save the reference data */ \
        if (rng_size < 32) \
        { \
            for (TARGET_UNSIGNED_INT(rng_size) state = 0;;) \
            { \
                TEST_CODE_CORE(rng_type, rng_size) \
                if (state == TARGET_UNSIGNED_INT_MAX(rng_size)) break; \
                state++; \
            } \
        } \
        else \
        { \
            for (TARGET_UNSIGNED_INT(rng_size) state = 1; state > 0; state <<= 1) \
            { \
                TEST_CODE_CORE(rng_type, rng_size) \
                if (state == (TARGET_UNSIGNED_INT_MAX(rng_size))) break; \
            } \
        } \
        \
        /* close the used file */ \
        fclose(fp); \
        \
    } while(false);



#define TEST_CODE_EACH_TYPE(rng_type) \
    do { \
        TEST_CODE_UNIT(rng_type,  8) \
        TEST_CODE_UNIT(rng_type, 16) \
        TEST_CODE_UNIT(rng_type, 32) \
        TEST_CODE_UNIT(rng_type, 64) \
    } while (false);



#define TYPEDEF_PCG_STATE(rng_size) \
    typedef struct pcg_state_        ## rng_size pcg_state_mcg_    ## rng_size ## _; \
    typedef struct pcg_state_        ## rng_size pcg_state_oneseq_ ## rng_size ## _; \
    typedef struct pcg_state_        ## rng_size pcg_state_unique_ ## rng_size ## _; \
    typedef struct pcg_state_setseq_ ## rng_size pcg_state_setseq_ ## rng_size ## _;    



int main(void)
{
    TYPEDEF_PCG_STATE( 8)
    TYPEDEF_PCG_STATE(16)
    TYPEDEF_PCG_STATE(32)
    TYPEDEF_PCG_STATE(64)

    TEST_CODE_EACH_TYPE(mcg)
    TEST_CODE_EACH_TYPE(oneseq)
    TEST_CODE_EACH_TYPE(setseq)
    TEST_CODE_EACH_TYPE(unique)

    return EXIT_SUCCESS;
}
