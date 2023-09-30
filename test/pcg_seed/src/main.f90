program test

    use, intrinsic :: iso_fortran_env

    use, non_intrinsic :: pcg_fortran

    implicit none



    type(pcg_state_mcg_8_type ) :: rng_mcg_8
    type(pcg_state_mcg_16_type) :: rng_mcg_16
    type(pcg_state_mcg_32_type) :: rng_mcg_32
    type(pcg_state_mcg_64_type) :: rng_mcg_64

    type(pcg_state_oneseq_8_type ) :: rng_oneseq_8
    type(pcg_state_oneseq_16_type) :: rng_oneseq_16
    type(pcg_state_oneseq_32_type) :: rng_oneseq_32
    type(pcg_state_oneseq_64_type) :: rng_oneseq_64

    type(pcg_state_setseq_8_type ) :: rng_setseq_8
    type(pcg_state_setseq_16_type) :: rng_setseq_16
    type(pcg_state_setseq_32_type) :: rng_setseq_32
    type(pcg_state_setseq_64_type) :: rng_setseq_64

    type(pcg_state_unique_8_type ) :: rng_unique_8
    type(pcg_state_unique_16_type) :: rng_unique_16
    type(pcg_state_unique_32_type) :: rng_unique_32
    type(pcg_state_unique_64_type) :: rng_unique_64



    print * , compiler_version()
    print * , compiler_options()



    call test_pcg_seed(rng_mcg_8 )
    call test_pcg_seed(rng_mcg_16)
    call test_pcg_seed(rng_mcg_32)
    call test_pcg_seed(rng_mcg_64)

    call test_pcg_seed(rng_oneseq_8 )
    call test_pcg_seed(rng_oneseq_16)
    call test_pcg_seed(rng_oneseq_32)
    call test_pcg_seed(rng_oneseq_64)

    call test_pcg_seed(rng_setseq_8 )
    call test_pcg_seed(rng_setseq_16)
    call test_pcg_seed(rng_setseq_32)
    call test_pcg_seed(rng_setseq_64)

    call test_pcg_seed(rng_unique_8 )
    call test_pcg_seed(rng_unique_16)
    call test_pcg_seed(rng_unique_32)
    call test_pcg_seed(rng_unique_64)

end program test
