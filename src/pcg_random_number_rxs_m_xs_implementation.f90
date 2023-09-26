submodule (pcg_fortran) pcg_random_number_rxs_m_xs_implementation

    implicit none
    contains



    module procedure pcg_random_number_8_rxs_m_xs_8

        !> A local variable for this SUBROUTINE
        integer(int8) :: old_state

        old_state = rng%state
        call rng%step()
        harvest = pcg_output_rxs_m_xs(old_state)

    end procedure pcg_random_number_8_rxs_m_xs_8



    module procedure pcg_random_number_16_rxs_m_xs_16

        !> A local variable for this SUBROUTINE
        integer(int16) :: old_state

        old_state = rng%state
        call rng%step()
        harvest = pcg_output_rxs_m_xs(old_state)

    end procedure pcg_random_number_16_rxs_m_xs_16

end submodule pcg_random_number_rxs_m_xs_implementation
