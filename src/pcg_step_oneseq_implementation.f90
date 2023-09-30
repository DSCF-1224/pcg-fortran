submodule (pcg_fortran) pcg_step_oneseq_implementation

    implicit none
    contains



    module procedure pcg_step_8_oneseq
        rng%state = rng%default_increment( rng%default_multiplier(rng%state) )
    end procedure pcg_step_8_oneseq



    module procedure pcg_step_16_oneseq
        rng%state = rng%default_increment( rng%default_multiplier(rng%state) )
    end procedure pcg_step_16_oneseq



    module procedure pcg_step_32_oneseq
        rng%state = rng%default_increment( rng%default_multiplier(rng%state) )
    end procedure pcg_step_32_oneseq



    module procedure pcg_step_64_oneseq
        rng%state = rng%default_increment( rng%default_multiplier(rng%state) )
    end procedure pcg_step_64_oneseq

end submodule pcg_step_oneseq_implementation
