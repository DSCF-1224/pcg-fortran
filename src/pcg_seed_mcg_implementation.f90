submodule (pcg_fortran) pcg_seed_mcg_implementation

    implicit none
    contains



    module procedure pcg_seed_8_mcg  ; rng%state = ior( init_state, 1_int8  ); end procedure
    module procedure pcg_seed_16_mcg ; rng%state = ior( init_state, 1_int16 ); end procedure
    module procedure pcg_seed_32_mcg ; rng%state = ior( init_state, 1_int32 ); end procedure
    module procedure pcg_seed_64_mcg ; rng%state = ior( init_state, 1_int64 ); end procedure

end submodule pcg_seed_mcg_implementation
