submodule (pcg_fortran) pcg_step_unique_implementation

    implicit none
    contains



    module procedure pcg_step_8_unique

        !> A local variable for this FUNCTION
        type(pcg_state_unique_8_type), pointer :: ptr_png

        ptr_png => rng

        rng%state = rng%default_multiplier(rng%state) &!
        &         + int(ior(transfer(c_loc(ptr_png), 0_int64), 1_int64), int8)

    end procedure pcg_step_8_unique



    module procedure pcg_step_16_unique

        !> A local variable for this FUNCTION
        type(pcg_state_unique_16_type), pointer :: ptr_png

        ptr_png => rng

        rng%state = rng%default_multiplier(rng%state) &!
        &         + int(ior(transfer(c_loc(ptr_png), 0_int64), 1_int64), int16)

    end procedure pcg_step_16_unique



    module procedure pcg_step_32_unique

        !> A local variable for this FUNCTION
        type(pcg_state_unique_32_type), pointer :: ptr_png

        ptr_png => rng

        rng%state = rng%default_multiplier(rng%state) &!
        &         + int(ior(transfer(c_loc(ptr_png), 0_int64), 1_int64), int32)

    end procedure pcg_step_32_unique



    module procedure pcg_step_64_unique

        !> A local variable for this FUNCTION
        type(pcg_state_unique_64_type), pointer :: ptr_png

        ptr_png => rng

        rng%state = rng%default_multiplier(rng%state) &!
        &         + int(ior(transfer(c_loc(ptr_png), 0_int64), 1_int64), int64)

    end procedure pcg_step_64_unique

end submodule pcg_step_unique_implementation
