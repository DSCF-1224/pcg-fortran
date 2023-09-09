submodule (pcg_fortran) pcg_output_xsh_rs_implementation

    implicit none
    contains



    module procedure pcg_output_xsh_rs_16_8

        integer(int16) :: i
        integer(int16) :: shift

        i      = ieor(shiftr(state, 7), state)
        shift  = shiftr(state, 14) + 3_int16
        xsh_rs = int(shiftr(i, shift), int8)

    end procedure pcg_output_xsh_rs_16_8



    module procedure pcg_output_xsh_rs_32_16

        integer(int32) :: i
        integer(int32) :: shift

        i      = ieor(shiftr(state, 11), state)
        shift  = shiftr(state, 30) + 11_int32
        xsh_rs = int(shiftr(i, shift), int16)

    end procedure pcg_output_xsh_rs_32_16



    module procedure test_pcg_output_xsh_rs
        call test_pcg_output_xsh_rs_16_8
        call test_pcg_output_xsh_rs_32_16
    end procedure test_pcg_output_xsh_rs



    subroutine test_pcg_output_xsh_rs_16_8

        !> A local PARAMETER for this SUBROUTINE
        integer(int16), parameter :: state_huge = huge(0_int16)

        !> A local variable for this SUBROUTINE
        !> The input value for the target of this test
        integer(int16) :: state

        !> A local variable for this SUBROUTINE
        !> The device number to output the result of this test
        integer :: write_unit

        ! open the file to save the result of this test
        open( &!
            newunit = write_unit   , &!
            file    = './16_8.dat' , &!
            action  = 'write'      , &!
            status  = 'replace'      &!
        )

        ! write the results of this test
        do state = 0_int16, (state_huge - 1_int16)
            call write_result
        end do

        state = state_huge      ; call write_result
        state = state + 1_int16 ; call write_result

        do state = (- state_huge), -1_int16
            call write_result
        end do

        ! close the used file
        close(write_unit)



        contains



        subroutine write_result

            write(write_unit, '(I0,1X,I0)') &!
            &   state, &!
            &   pcg_output_xsh_rs(state)

        end subroutine write_result

    end subroutine test_pcg_output_xsh_rs_16_8



    subroutine test_pcg_output_xsh_rs_32_16

        !> A local variable for this SUBROUTINE
        !> The input value for the target of this test
        integer(int32) :: state

        !> A local variable for this SUBROUTINE
        !> The device number to output the result of this test
        integer :: write_unit

        ! open the file to save the result of this test
        open( &!
            newunit = write_unit   , &!
            file    = './32_16.dat' , &!
            action  = 'write'      , &!
            status  = 'replace'      &!
        )

        ! write the results of this test
        state = 1_int32

        do

            write(write_unit, '(I0,1X,I0)') &!
            &   state, &!
            &   pcg_output_xsh_rs(state)

            if (state .lt. 0_int32) exit

            state = state + state

        end do

        ! close the used file
        close(write_unit)

    end subroutine test_pcg_output_xsh_rs_32_16

end submodule pcg_output_xsh_rs_implementation
