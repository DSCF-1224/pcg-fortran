submodule (pcg_fortran) pcg_advance_mcg_implementation

    implicit none
    contains



    module procedure pcg_advance_8_mcg

        !> A local variable for this SUBROUTINE
        integer(int8) :: old_state



        old_state = rng%state

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                , &!
                init_delta    = delta                    , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_8 , &!
                init_cur_plus = 0_int8                     &!
            )

    end procedure pcg_advance_8_mcg

end submodule pcg_advance_mcg_implementation
