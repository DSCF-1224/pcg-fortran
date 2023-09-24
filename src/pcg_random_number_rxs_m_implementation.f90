submodule (pcg_fortran) pcg_random_number_rxs_m_implementation

    implicit none
    contains



    module procedure pcg_random_number_16_rxs_m_8

        !> A local variable for this SUBROUTINE
        integer(int16) :: old_state

        old_state = rng%state
        call rng%step()
        harvest = pcg_output_rxs_m(old_state)

    end procedure pcg_random_number_16_rxs_m_8



    module procedure pcg_random_number_32_rxs_m_16

        !> A local variable for this SUBROUTINE
        integer(int32) :: old_state

        old_state = rng%state
        call rng%step()
        harvest = pcg_output_rxs_m(old_state)

    end procedure pcg_random_number_32_rxs_m_16

end submodule pcg_random_number_rxs_m_implementation
