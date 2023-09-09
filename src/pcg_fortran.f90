module pcg_fortran

    use, intrinsic :: iso_fortran_env

    implicit none

    private
    public  :: test_pcg_output_xsh_rr
    public  :: test_pcg_output_xsh_rs



    interface pcg_output_xsh_rr

        !> Output function: XSH RR
        module pure elemental function pcg_output_xsh_rr_16_8(state) result(xsh_rr)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int8) :: xsh_rr

        end function pcg_output_xsh_rr_16_8

    end interface pcg_output_xsh_rr



    interface pcg_output_xsh_rs

        !> Output function: XSH RS
        module pure elemental function pcg_output_xsh_rs_16_8(state) result(xsh_rs)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int8) :: xsh_rs

        end function pcg_output_xsh_rs_16_8



        !> Output function: XSH RS
        module pure elemental function pcg_output_xsh_rs_32_16(state) result(xsh_rs)

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int16) :: xsh_rs

        end function pcg_output_xsh_rs_32_16



        !> Output function: XSH RS
        module pure elemental function pcg_output_xsh_rs_64_32(state) result(xsh_rs)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int32) :: xsh_rs

        end function pcg_output_xsh_rs_64_32

    end interface pcg_output_xsh_rs



    interface pcg_rotr

        !> Rotate helper function
        module pure elemental function pcg_rotr_8(value_, rot) result(rotr)

            !> A dummy argument for this FUNCTION
            integer(int8), intent(in) :: value_

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: rot

            !> The return value of this FUNCTION
            integer(int8) :: rotr

        end function pcg_rotr_8

    end interface pcg_rotr



    interface

        !> A SUBROUTINE for a test: `pcg_output_xsh_rs`
        module subroutine test_pcg_output_xsh_rs
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_output_xsh_rs

        !> A SUBROUTINE for a test: `pcg_output_xsh_rr`
        module subroutine test_pcg_output_xsh_rr
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_output_xsh_rr

    end interface

end module pcg_fortran
