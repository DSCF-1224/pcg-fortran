submodule (pcg_fortran) pcg_output_rxs_m_implementation

    implicit none
    contains



    module procedure pcg_output_rxs_m_16_8
        rxs_m = int(shiftr( (ieor(shiftr( state, (shiftr(state, 13) + 3_int16) ), state) * 62169_int32), 8 ), int8)
    end procedure pcg_output_rxs_m_16_8



    module procedure test_pcg_output_rxs_m
        call test_pcg_output_rxs_m_16_8
    end procedure test_pcg_output_rxs_m



    subroutine test_pcg_output_rxs_m_16_8

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

        state = state_huge     ; call write_result
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
            &   pcg_output_rxs_m(state)

        end subroutine write_result

    end subroutine test_pcg_output_rxs_m_16_8

end submodule pcg_output_rxs_m_implementation
