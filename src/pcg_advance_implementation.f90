submodule (pcg_fortran) pcg_advance_implementation

    implicit none



    integer(int8)  , parameter :: DELTA_INT8 =  -6_int8
    integer(int16) , parameter :: DELTA_INT16 = -6_int16
    integer(int32) , parameter :: DELTA_INT32 = -6_int32
    integer(int64) , parameter :: DELTA_INT64 = -6_int64



    character(len=*), parameter :: FMT_WRITE_BASIC  = '(Z0,1X,Z0)'
    character(len=*), parameter :: FMT_WRITE_SETSEQ = '(Z0,2(1X,Z0))'



    contains



    module procedure test_pcg_advance

        !> A local variable for this SUBROUTINE
        !> The device number to output the result of this test
        integer :: write_unit

        !> A local variable for this SUBROUTINE
        !> The file name to output the result of this test
        character(len=15) :: file_name



        ! setup the file to save the result of this test
        call generate_output_file_name(rng, file_name)



        ! open the file to save the result of this test
        open( &!
            newunit = write_unit      , &!
            file    = trim(file_name) , &!
            action  = 'write'         , &!
            status  = 'replace'         &!
        )



        ! write the results of this test
        select type(rng)

            class is(pcg_state_8_type)
            block

                !> A local variable for this BLOCK
                integer(int8) :: state



                state = 0_int8

                do

                    call test_pcg_advance_core_8(write_unit, state, rng)

                    select case(state)
                        case( -1_int8     ) ; exit
                        case( huge(state) ) ; state = -1_int8
                        case default        ; state = state + 1_int8
                    end select

                end do

            end block

            class is(pcg_state_16_type)
            block

                !> A local variable for this BLOCK
                integer(int16) :: state



                state = 0_int16

                do

                    call test_pcg_advance_core_16(write_unit, state, rng)

                    select case(state)
                        case( -1_int16    ) ; exit
                        case( huge(state) ) ; state = -1_int16
                        case default        ; state = state + 1_int16
                    end select

                end do

            end block

            class is(pcg_state_32_type)
            block

                !> A local variable for this BLOCK
                integer(int32) :: state



                state = 1_int32

                do
                    call test_pcg_advance_core_32(write_unit, state, rng)
                    if (state .lt. 0_int32) exit
                    state = state + state
                end do

            end block

            class is(pcg_state_64_type)
            block

                !> A local variable for this BLOCK
                integer(int64) :: state



                state = 1_int64

                do
                    call test_pcg_advance_core_64(write_unit, state, rng)
                    if (state .lt. 0_int64) exit
                    state = state + state
                end do

            end block

        end select



        ! close the used file
        close(write_unit)

    end procedure test_pcg_advance



    subroutine test_pcg_advance_core_8(write_unit, state, rng)

        !> A dummy argument for this SUBROUTINE
        integer, intent(in) :: write_unit

        !> A dummy argument for this SUBROUTINE
        integer(int8), intent(in) :: state

        !> A dummy argument for this SUBROUTINE
        class(pcg_state_8_type), intent(inout) :: rng



        call rng%initialize()
        rng%state = state
        call rng%advance(DELTA_INT8)

        select type(rng)

            class is(pcg_state_basic_8_type)
            write(write_unit, FMT_WRITE_BASIC) state, rng%state

            type is(pcg_state_setseq_8_type)
            write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc

        end select

    end subroutine test_pcg_advance_core_8




    subroutine test_pcg_advance_core_16(write_unit, state, rng)

        !> A dummy argument for this SUBROUTINE
        integer, intent(in) :: write_unit

        !> A dummy argument for this SUBROUTINE
        integer(int16), intent(in) :: state

        !> A dummy argument for this SUBROUTINE
        class(pcg_state_16_type), intent(inout) :: rng



        call rng%initialize()
        rng%state = state
        call rng%advance(DELTA_INT16)

        select type(rng)

            class is(pcg_state_basic_16_type)
            write(write_unit, FMT_WRITE_BASIC) state, rng%state

            type is(pcg_state_setseq_16_type)
            write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc

        end select

    end subroutine test_pcg_advance_core_16




    subroutine test_pcg_advance_core_32(write_unit, state, rng)

        !> A dummy argument for this SUBROUTINE
        integer, intent(in) :: write_unit

        !> A dummy argument for this SUBROUTINE
        integer(int32), intent(in) :: state

        !> A dummy argument for this SUBROUTINE
        class(pcg_state_32_type), intent(inout) :: rng



        call rng%initialize()
        rng%state = state
        call rng%advance(DELTA_INT32)

        select type(rng)

            class is(pcg_state_basic_32_type)
            write(write_unit, FMT_WRITE_BASIC) state, rng%state

            type is(pcg_state_setseq_32_type)
            write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc

        end select

    end subroutine test_pcg_advance_core_32




    subroutine test_pcg_advance_core_64(write_unit, state, rng)

        !> A dummy argument for this SUBROUTINE
        integer, intent(in) :: write_unit

        !> A dummy argument for this SUBROUTINE
        integer(int64), intent(in) :: state

        !> A dummy argument for this SUBROUTINE
        class(pcg_state_64_type), intent(inout) :: rng



        call rng%initialize()
        rng%state = state
        call rng%advance(DELTA_INT64)

        select type(rng)

            class is(pcg_state_basic_64_type)
            write(write_unit, FMT_WRITE_BASIC) state, rng%state

            type is(pcg_state_setseq_64_type)
            write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc

        end select

    end subroutine test_pcg_advance_core_64

end submodule pcg_advance_implementation
