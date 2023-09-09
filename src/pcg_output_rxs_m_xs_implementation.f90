submodule (pcg_fortran) pcg_output_rxs_m_xs_implementation

    implicit none
    contains



    module procedure pcg_output_rxs_m_xs_8_8

        integer(int8) :: word

        word     = int( (ieor(shiftr( state, (shiftr(state, 6) + 2_int8) ), state) * 217_int16), int8 )
        rxs_m_xs = ieor( shiftr(word, 6), word )

    end procedure pcg_output_rxs_m_xs_8_8



    module procedure test_pcg_output_rxs_m_xs
        call test_pcg_output_rxs_m_xs_8_8
    end procedure test_pcg_output_rxs_m_xs



    subroutine test_pcg_output_rxs_m_xs_8_8

        !> A local PARAMETER for this SUBROUTINE
        integer(int8), parameter :: state_huge = huge(0_int8)

        !> A local variable for this SUBROUTINE
        !> The input value for the target of this test
        integer(int8) :: state

        !> A local variable for this SUBROUTINE
        !> The device number to output the result of this test
        integer :: write_unit

        ! open the file to save the result of this test
        open( &!
            newunit = write_unit , &!
            file    = './8.dat'  , &!
            action  = 'write'    , &!
            status  = 'replace'    &!
        )

        ! write the results of this test
        do state = 0_int8, (state_huge - 1_int8)
            call write_result
        end do

        state = state_huge     ; call write_result
        state = state + 1_int8 ; call write_result

        do state = (- state_huge), -1_int8
            call write_result
        end do

        ! close the used file
        close(write_unit)



        contains



        subroutine write_result

            write(write_unit, '(I0,1X,I0)') &!
            &   state, &!
            &   pcg_output_rxs_m_xs(state)

        end subroutine write_result

    end subroutine test_pcg_output_rxs_m_xs_8_8

end submodule pcg_output_rxs_m_xs_implementation
