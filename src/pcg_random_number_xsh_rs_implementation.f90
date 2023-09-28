submodule (pcg_fortran) pcg_random_number_xsh_rr_implementation

    implicit none
    contains



    module procedure pcg_random_number_16_xsh_rs_8

        !> A local variable for this SUBROUTINE
        integer(int16) :: old_state

        old_state = rng%state
        call rng%step()
        harvest = pcg_output_xsh_rs(old_state)

    end procedure pcg_random_number_16_xsh_rs_8

end submodule pcg_random_number_xsh_rr_implementation
