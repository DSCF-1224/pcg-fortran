submodule (pcg_fortran) pcg_step_mcg_implementation

    implicit none
    contains



    module procedure pcg_step_8_mcg
        rng%state = rng%default_multiplier(rng%state)
    end procedure pcg_step_8_mcg



    module procedure pcg_step_16_mcg
        rng%state = rng%default_multiplier(rng%state)
    end procedure pcg_step_16_mcg



    module procedure pcg_step_32_mcg
        rng%state = rng%default_multiplier(rng%state)
    end procedure pcg_step_32_mcg



    module procedure pcg_step_64_mcg
        rng%state = rng%default_multiplier(rng%state)
    end procedure pcg_step_64_mcg

end submodule pcg_step_mcg_implementation
