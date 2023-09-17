submodule (pcg_fortran) pcg_step_setseq_implementation

    implicit none
    contains



    module procedure pcg_step_8_setseq
        rng%state = rng%default_multiplier(rng%state) + rng%inc
    end procedure pcg_step_8_setseq



    module procedure pcg_step_16_setseq
        rng%state = rng%default_multiplier(rng%state) + rng%inc
    end procedure pcg_step_16_setseq



    module procedure pcg_step_32_setseq
        rng%state = rng%default_multiplier(rng%state) + rng%inc
    end procedure pcg_step_32_setseq



    module procedure pcg_step_64_setseq
        rng%state = rng%default_multiplier(rng%state) + rng%inc
    end procedure pcg_step_64_setseq

end submodule pcg_step_setseq_implementation
