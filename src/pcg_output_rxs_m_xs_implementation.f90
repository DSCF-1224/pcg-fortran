submodule (pcg_fortran) pcg_output_rxs_m_xs_implementation

    implicit none



    !> This value is equal to `12605985483714917081ull`
    integer(int64), parameter :: MULTIPLIER_64 = -5840758589994634535_int64



    contains



    module procedure pcg_output_rxs_m_xs_8_8

        integer(int8) :: word

        word     = int( (ieor(shiftr( state, (shiftr(state, 6) + 2_int8) ), state) * 217_int16), int8 )
        rxs_m_xs = ieor( shiftr(word, 6), word )

    end procedure pcg_output_rxs_m_xs_8_8



    module procedure pcg_output_rxs_m_xs_16_16

        integer(int16) :: word

        word     = int( (ieor(shiftr( state, (shiftr(state, 13) + 3_int16) ), state) * 62169_int32), int16 )
        rxs_m_xs = ieor( shiftr(word, 11), word )

    end procedure pcg_output_rxs_m_xs_16_16



    module procedure pcg_output_rxs_m_xs_32_32

        integer(int32) :: word

        word     = ieor(shiftr( state, (shiftr(state, 28) + 4_int32) ), state) * 277803737_int32
        rxs_m_xs = ieor( shiftr(word, 22), word )

    end procedure pcg_output_rxs_m_xs_32_32



    module procedure pcg_output_rxs_m_xs_64_64

        integer(int64) :: word

        word     = ieor(shiftr( state, (shiftr(state, 59) + 5_int64) ), state) * MULTIPLIER_64
        rxs_m_xs = ieor( shiftr(word, 43), word )

    end procedure pcg_output_rxs_m_xs_64_64



    module procedure test_pcg_output_rxs_m_xs
        call test_pcg_output_rxs_m_xs_8_8
        call test_pcg_output_rxs_m_xs_16_16
        call test_pcg_output_rxs_m_xs_32_32
        call test_pcg_output_rxs_m_xs_64_64
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



    subroutine test_pcg_output_rxs_m_xs_16_16

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
            newunit = write_unit , &!
            file    = './16.dat' , &!
            action  = 'write'    , &!
            status  = 'replace'    &!
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
            &   pcg_output_rxs_m_xs(state)

        end subroutine write_result

    end subroutine test_pcg_output_rxs_m_xs_16_16



    subroutine test_pcg_output_rxs_m_xs_32_32

        !> A local variable for this SUBROUTINE
        !> The input value for the target of this test
        integer(int32) :: state

        !> A local variable for this SUBROUTINE
        !> The device number to output the result of this test
        integer :: write_unit

        ! open the file to save the result of this test
        open( &!
            newunit = write_unit , &!
            file    = './32.dat' , &!
            action  = 'write'    , &!
            status  = 'replace'    &!
        )

        ! write the results of this test
        state = 1_int32

        do

            write(write_unit, '(I0,1X,I0)') &!
            &   state, &!
            &   pcg_output_rxs_m_xs(state)

            if (state .lt. 0_int32) exit

            state = state + state

        end do

        ! close the used file
        close(write_unit)

    end subroutine test_pcg_output_rxs_m_xs_32_32



    subroutine test_pcg_output_rxs_m_xs_64_64

        !> A local variable for this SUBROUTINE
        !> The input value for the target of this test
        integer(int64) :: state

        !> A local variable for this SUBROUTINE
        !> The device number to output the result of this test
        integer :: write_unit

        ! open the file to save the result of this test
        open( &!
            newunit = write_unit , &!
            file    = './64.dat' , &!
            action  = 'write'    , &!
            status  = 'replace'    &!
        )

        ! write the results of this test
        state = 1_int64

        do

            write(write_unit, '(I0,1X,I0)') &!
            &   state, &!
            &   pcg_output_rxs_m_xs(state)

            if (state .lt. 0_int64) exit

            state = state + state

        end do

        ! close the used file
        close(write_unit)

    end subroutine test_pcg_output_rxs_m_xs_64_64

end submodule pcg_output_rxs_m_xs_implementation
