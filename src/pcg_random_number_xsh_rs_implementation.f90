submodule (pcg_fortran) pcg_random_number_xsh_rs_implementation

    implicit none
    contains



    module procedure pcg_random_number_16_xsh_rs_8

        !> A local variable for this SUBROUTINE
        integer(int16) :: old_state

        old_state = rng%state
        call rng%step()
        harvest = pcg_output_xsh_rs(old_state)

    end procedure pcg_random_number_16_xsh_rs_8



    module procedure pcg_random_number_32_xsh_rs_16

        !> A local variable for this SUBROUTINE
        integer(int32) :: old_state

        old_state = rng%state
        call rng%step()
        harvest = pcg_output_xsh_rs(old_state)

    end procedure pcg_random_number_32_xsh_rs_16



    module procedure pcg_random_number_64_xsh_rs_32

        !> A local variable for this SUBROUTINE
        integer(int64) :: old_state

        old_state = rng%state
        call rng%step()
        harvest = pcg_output_xsh_rs(old_state)

    end procedure pcg_random_number_64_xsh_rs_32

end submodule pcg_random_number_xsh_rs_implementation
