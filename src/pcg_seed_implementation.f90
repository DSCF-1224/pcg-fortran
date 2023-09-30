submodule (pcg_fortran) pcg_seed_implementation

    implicit none



    character(len=*), parameter :: FMT_WRITE_BASIC  = '(Z0,1X,Z0)'
    character(len=*), parameter :: FMT_WRITE_SETSEQ = '(Z0,2(1X,Z0))'



    contains



    module procedure pcg_step_for_seeding_8
        call rng%step()
        rng%state = rng%state + init_state
        call rng%step()
    end procedure pcg_step_for_seeding_8



    module procedure pcg_step_for_seeding_16
        call rng%step()
        rng%state = rng%state + init_state
        call rng%step()
    end procedure pcg_step_for_seeding_16



    module procedure pcg_step_for_seeding_32
        call rng%step()
        rng%state = rng%state + init_state
        call rng%step()
    end procedure pcg_step_for_seeding_32



    module procedure pcg_step_for_seeding_64
        call rng%step()
        rng%state = rng%state + init_state
        call rng%step()
    end procedure pcg_step_for_seeding_64



    module procedure test_pcg_seed

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

        select type (rng)

            class is(pcg_state_8_type)
            block

                !> A local variable for this BLOCK
                integer(int8) :: init_state



                init_state = 0_int8

                do

                    call test_pcg_seed_core_8(write_unit, init_state, rng)

                    select case(init_state)
                        case( -1_int8          ) ; exit
                        case( huge(init_state) ) ; init_state = -1_int8
                        case default             ; init_state = init_state + 1_int8
                    end select

                end do

            end block

            class is(pcg_state_16_type)
            block

                !> A local variable for this BLOCK
                integer(int16) :: init_state



                init_state = 0_int16

                do

                    call test_pcg_seed_core_16(write_unit, init_state, rng)

                    select case(init_state)
                        case( -1_int16         ) ; exit
                        case( huge(init_state) ) ; init_state = -1_int16
                        case default             ; init_state = init_state + 1_int16
                    end select

                end do

            end block

            class is(pcg_state_32_type)
            block

                !> A local variable for this BLOCK
                integer(int32) :: init_state



                init_state = 1_int32

                do
                    call test_pcg_seed_core_32(write_unit, init_state, rng)
                    if (init_state .lt. 0_int32) exit
                    init_state = init_state + init_state
                end do

            end block

            class is(pcg_state_64_type)
            block

                !> A local variable for this BLOCK
                integer(int64) :: init_state



                init_state = 1_int64

                do
                    call test_pcg_seed_core_64(write_unit, init_state, rng)
                    if (init_state .lt. 0_int64) exit
                    init_state = init_state + init_state
                end do

            end block
            
        end select



        ! close the used file
        close(write_unit)

    end procedure test_pcg_seed



    subroutine test_pcg_seed_core_8(write_unit, init_state, rng)

        !> A dummy argument for this SUBROUTINE
        integer, intent(in) :: write_unit

        !> A dummy argument for this SUBROUTINE
        integer(int8), intent(in) :: init_state

        !> A dummy argument for this SUBROUTINE
        class(pcg_state_8_type), intent(inout) :: rng



        select type(rng)

            class is(pcg_state_basic_8_type)
            call rng%seed(init_state)
            write(write_unit, FMT_WRITE_BASIC) init_state, rng%state

            type is(pcg_state_setseq_8_type)
            call rng%initialize()
            call rng%seed(init_state, rng%inc)
            write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc

        end select

    end subroutine test_pcg_seed_core_8



    subroutine test_pcg_seed_core_16(write_unit, init_state, rng)

        !> A dummy argument for this SUBROUTINE
        integer, intent(in) :: write_unit

        !> A dummy argument for this SUBROUTINE
        integer(int16), intent(in) :: init_state

        !> A dummy argument for this SUBROUTINE
        class(pcg_state_16_type), intent(inout) :: rng



        select type(rng)

            class is(pcg_state_basic_16_type)
            call rng%seed(init_state)
            write(write_unit, FMT_WRITE_BASIC) init_state, rng%state

            type is(pcg_state_setseq_16_type)
            call rng%initialize()
            call rng%seed(init_state, rng%inc)
            write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc

        end select

    end subroutine test_pcg_seed_core_16



    subroutine test_pcg_seed_core_32(write_unit, init_state, rng)

        !> A dummy argument for this SUBROUTINE
        integer, intent(in) :: write_unit

        !> A dummy argument for this SUBROUTINE
        integer(int32), intent(in) :: init_state

        !> A dummy argument for this SUBROUTINE
        class(pcg_state_32_type), intent(inout) :: rng



        select type(rng)

            class is(pcg_state_basic_32_type)
            call rng%seed(init_state)
            write(write_unit, FMT_WRITE_BASIC) init_state, rng%state

            type is(pcg_state_setseq_32_type)
            call rng%initialize()
            call rng%seed(init_state, rng%inc)
            write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc

        end select

    end subroutine test_pcg_seed_core_32



    subroutine test_pcg_seed_core_64(write_unit, init_state, rng)

        !> A dummy argument for this SUBROUTINE
        integer, intent(in) :: write_unit

        !> A dummy argument for this SUBROUTINE
        integer(int64), intent(in) :: init_state

        !> A dummy argument for this SUBROUTINE
        class(pcg_state_64_type), intent(inout) :: rng



        select type(rng)

            class is(pcg_state_basic_64_type)
            call rng%seed(init_state)
            write(write_unit, FMT_WRITE_BASIC) init_state, rng%state

            type is(pcg_state_setseq_64_type)
            call rng%initialize()
            call rng%seed(init_state, rng%inc)
            write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc

        end select

    end subroutine test_pcg_seed_core_64

end submodule pcg_seed_implementation
