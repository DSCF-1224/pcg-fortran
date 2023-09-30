submodule (pcg_fortran) pcg_seed_unique_implementation

    implicit none
    contains



    module procedure pcg_seed_8_unique
        rng%state = 0_int8
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_8_unique



    module procedure pcg_seed_16_unique
        rng%state = 0_int16
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_16_unique



    module procedure pcg_seed_32_unique
        rng%state = 0_int32
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_32_unique



    module procedure pcg_seed_64_unique
        rng%state = 0_int64
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_64_unique

end submodule pcg_seed_unique_implementation
