submodule (pcg_fortran) pcg_advance_setseq_implementation

    implicit none
    contains



    module procedure pcg_advance_8_setseq

        !> A local variable for this SUBROUTINE
        integer(int8) :: old_state



        old_state = rng%state

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                , &!
                init_delta    = delta                    , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_8 , &!
                init_cur_plus = rng%inc                    &!
            )

    end procedure pcg_advance_8_setseq



    module procedure pcg_advance_16_setseq

        !> A local variable for this SUBROUTINE
        integer(int16) :: old_state



        old_state = rng%state

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                 , &!
                init_delta    = delta                     , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_16 , &!
                init_cur_plus = rng%inc                     &!
            )

    end procedure pcg_advance_16_setseq

end submodule pcg_advance_setseq_implementation
