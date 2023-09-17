submodule (pcg_fortran) pcg_seed_oneseq_implementation

    implicit none
    contains



    module procedure pcg_seed_8_oneseq
        rng%state = 0_int8
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_8_oneseq



    module procedure pcg_seed_16_oneseq
        rng%state = 0_int16
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_16_oneseq



    module procedure pcg_seed_32_oneseq
        rng%state = 0_int32
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_32_oneseq



    module procedure pcg_seed_64_oneseq
        rng%state = 0_int64
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_64_oneseq

end submodule pcg_seed_oneseq_implementation
