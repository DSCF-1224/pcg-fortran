submodule (pcg_fortran) pcg_random_number_xsl_rr_rr_implementation

    implicit none
    contains



    module procedure pcg_random_number_64_xsl_rr_rr_64

        !> A local variable for this SUBROUTINE
        integer(int64) :: old_state

        old_state = rng%state
        call rng%step()
        harvest = pcg_output_xsl_rr_rr(old_state)

    end procedure pcg_random_number_64_xsl_rr_rr_64

end submodule pcg_random_number_xsl_rr_rr_implementation
