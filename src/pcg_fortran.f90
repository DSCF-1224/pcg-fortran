module pcg_fortran

    use, intrinsic :: iso_fortran_env

    implicit none

    private
    public  :: test_pcg_output_xsh_rs



    interface pcg_output_xsh_rs

        !> Output function: XHS RS
        module pure elemental function pcg_output_xsh_rs_16_8(state) result(xsh_rs)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int8) :: xsh_rs

        end function pcg_output_xsh_rs_16_8

    end interface pcg_output_xsh_rs



    interface

        !> A SUBROUTINE for a test: `pcg_output_xsh_rs`
        module subroutine test_pcg_output_xsh_rs
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_output_xsh_rs

    end interface

end module pcg_fortran
