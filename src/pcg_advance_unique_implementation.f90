submodule (pcg_fortran) pcg_advance_unique_implementation

    implicit none
    contains



    module procedure pcg_advance_8_unique

        !> A local variable for this SUBROUTINE
        integer(int8) :: old_state

        !> A local variable for this SUBROUTINE
        integer(int8) :: cur_plus

        !> A local variable for this SUBROUTINE
        type(pcg_state_unique_8_type), pointer :: ptr_png



        old_state = rng%state

        ptr_png  => rng
        cur_plus =  int(ior(transfer(c_loc(ptr_png), 0_int64), 1_int64), int8)

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                , &!
                init_delta    = delta                    , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_8 , &!
                init_cur_plus = cur_plus                   &!
            )

    end procedure pcg_advance_8_unique



    module procedure pcg_advance_16_unique

        !> A local variable for this SUBROUTINE
        integer(int16) :: old_state

        !> A local variable for this SUBROUTINE
        integer(int16) :: cur_plus

        !> A local variable for this SUBROUTINE
        type(pcg_state_unique_16_type), pointer :: ptr_png



        old_state = rng%state

        ptr_png  => rng
        cur_plus =  int(ior(transfer(c_loc(ptr_png), 0_int64), 1_int64), int16)

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                 , &!
                init_delta    = delta                     , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_16 , &!
                init_cur_plus = cur_plus                    &!
            )

    end procedure pcg_advance_16_unique



    module procedure pcg_advance_32_unique

        !> A local variable for this SUBROUTINE
        integer(int32) :: old_state

        !> A local variable for this SUBROUTINE
        integer(int32) :: cur_plus

        !> A local variable for this SUBROUTINE
        type(pcg_state_unique_32_type), pointer :: ptr_png



        old_state = rng%state

        ptr_png  => rng
        cur_plus =  int(ior(transfer(c_loc(ptr_png), 0_int64), 1_int64), int32)

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                 , &!
                init_delta    = delta                     , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_32 , &!
                init_cur_plus = cur_plus                    &!
            )

    end procedure pcg_advance_32_unique



    module procedure pcg_advance_64_unique

        !> A local variable for this SUBROUTINE
        integer(int64) :: old_state

        !> A local variable for this SUBROUTINE
        integer(int64) :: cur_plus

        !> A local variable for this SUBROUTINE
        type(pcg_state_unique_64_type), pointer :: ptr_png



        old_state = rng%state

        ptr_png  => rng
        cur_plus =  int(ior(transfer(c_loc(ptr_png), 0_int64), 1_int64), int64)

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                 , &!
                init_delta    = delta                     , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_64 , &!
                init_cur_plus = cur_plus                    &!
            )

    end procedure pcg_advance_64_unique

end submodule pcg_advance_unique_implementation
