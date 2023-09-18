submodule (pcg_fortran) pcg_advance_oneseq_implementation

    implicit none
    contains



    module procedure pcg_advance_8_oneseq

        !> A local variable for this SUBROUTINE
        integer(int8) :: old_state



        old_state = rng%state

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                , &!
                init_delta    = delta                    , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_8 , &!
                init_cur_plus = PCG_DEFAULT_INCREMENT_8    &!
            )

    end procedure pcg_advance_8_oneseq



    module procedure pcg_advance_16_oneseq

        !> A local variable for this SUBROUTINE
        integer(int16) :: old_state



        old_state = rng%state

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                 , &!
                init_delta    = delta                     , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_16 , &!
                init_cur_plus = PCG_DEFAULT_INCREMENT_16    &!
            )

    end procedure pcg_advance_16_oneseq



    module procedure pcg_advance_32_oneseq

        !> A local variable for this SUBROUTINE
        integer(int32) :: old_state



        old_state = rng%state

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                 , &!
                init_delta    = delta                     , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_32 , &!
                init_cur_plus = PCG_DEFAULT_INCREMENT_32    &!
            )

    end procedure pcg_advance_32_oneseq



    module procedure pcg_advance_64_oneseq

        !> A local variable for this SUBROUTINE
        integer(int64) :: old_state



        old_state = rng%state

        rng%state = &!
            pcg_advance_lcg( &!
                state         = old_state                 , &!
                init_delta    = delta                     , &!
                init_cur_mult = PCG_DEFAULT_MULTIPLIER_64 , &!
                init_cur_plus = PCG_DEFAULT_INCREMENT_64    &!
            )

    end procedure pcg_advance_64_oneseq

end submodule pcg_advance_oneseq_implementation
