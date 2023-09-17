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



    subroutine test_pcg_seed_core(rng)

        !> A dummy argument for this SUBROUTINE
        class(pcg_state_type), intent(inout) :: rng

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

            class is(pcg_state_basic_8_type)

                block

                    !> A local variable for this BLOCK
                    integer(int8) :: init_state



                    do init_state = 0_int8, (huge(init_state) - 1_int8)
                        call rng%seed(init_state)
                        write(write_unit, FMT_WRITE_BASIC) init_state, rng%state
                    end do

                    init_state = huge(init_state)
                    rng%state  = init_state
                    call rng%seed(init_state)
                    write(write_unit, FMT_WRITE_BASIC) init_state, rng%state

                    init_state = init_state + 1_int8
                    rng%state  = init_state
                    call rng%seed(init_state)
                    write(write_unit, FMT_WRITE_BASIC) init_state, rng%state

                    do init_state = ( - huge(init_state) ), (- 1_int8)
                        rng%state = init_state
                        call rng%seed(init_state)
                        write(write_unit, FMT_WRITE_BASIC) init_state, rng%state
                    end do

                end block

            class is(pcg_state_basic_16_type)

                block

                    !> A local variable for this BLOCK
                    integer(int16) :: init_state



                    do init_state = 0_int16, (huge(init_state) - 1_int16)
                        call rng%seed(init_state)
                        write(write_unit, FMT_WRITE_BASIC) init_state, rng%state
                    end do

                    init_state = huge(init_state)
                    rng%state  = init_state
                    call rng%seed(init_state)
                    write(write_unit, FMT_WRITE_BASIC) init_state, rng%state

                    init_state = init_state + 1_int16
                    rng%state  = init_state
                    call rng%seed(init_state)
                    write(write_unit, FMT_WRITE_BASIC) init_state, rng%state

                    do init_state = ( - huge(init_state) ), (- 1_int16)
                        rng%state = init_state
                        call rng%seed(init_state)
                        write(write_unit, FMT_WRITE_BASIC) init_state, rng%state
                    end do

                end block

            class is(pcg_state_basic_32_type)

                block

                    !> A local variable for this BLOCK
                    integer(int32) :: init_state



                    init_state = 1_int32

                    do
                        call rng%seed(init_state)
                        write(write_unit, FMT_WRITE_BASIC) init_state, rng%state
                        if (init_state .lt. 0_int32) exit
                        init_state = init_state + init_state
                    end do

                end block

            class is(pcg_state_basic_64_type)

                block

                    !> A local variable for this BLOCK
                    integer(int64) :: init_state



                    init_state = 1_int64

                    do
                        call rng%seed(init_state)
                        write(write_unit, FMT_WRITE_BASIC) init_state, rng%state
                        if (init_state .lt. 0_int64) exit
                        init_state = init_state + init_state
                    end do

                end block

            type is(pcg_state_setseq_8_type)

                block

                    !> A local variable for this BLOCK
                    integer(int8) :: init_state



                    do init_state = 0_int8, (huge(init_state) - 1_int8)
                        call rng%initialize()
                        call rng%seed(init_state, rng%inc)
                        write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc
                    end do

                    init_state = huge(init_state)
                    call rng%initialize()
                    call rng%seed(init_state, rng%inc)
                    write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc

                    init_state = init_state + 1_int8
                    call rng%initialize()
                    call rng%seed(init_state, rng%inc)
                    write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc

                    do init_state = ( - huge(init_state) ), (- 1_int8)
                        call rng%initialize()
                        call rng%seed(init_state, rng%inc)
                        write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc
                    end do

                end block

            type is(pcg_state_setseq_16_type)

                block

                    !> A local variable for this BLOCK
                    integer(int16) :: init_state



                    do init_state = 0_int16, (huge(init_state) - 1_int16)
                        call rng%initialize()
                        call rng%seed(init_state, rng%inc)
                        write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc
                    end do

                    init_state = huge(init_state)
                    call rng%initialize()
                    call rng%seed(init_state, rng%inc)
                    write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc

                    init_state = init_state + 1_int16
                    call rng%initialize()
                    call rng%seed(init_state, rng%inc)
                    write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc

                    do init_state = ( - huge(init_state) ), (- 1_int16)
                        call rng%initialize()
                        call rng%seed(init_state, rng%inc)
                        write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc
                    end do

                end block

            type is(pcg_state_setseq_32_type)

                block

                    !> A local variable for this BLOCK
                    integer(int32) :: init_state


                    init_state = 1_int32

                    do
                        call rng%initialize()
                        call rng%seed(init_state, rng%inc)
                        write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc
                        if (init_state .lt. 0_int32) exit
                        init_state = init_state + init_state
                    end do

                end block

            type is(pcg_state_setseq_64_type)

                block

                    !> A local variable for this BLOCK
                    integer(int64) :: init_state



                    init_state = 1_int64

                    do
                        call rng%initialize()
                        call rng%seed(init_state, rng%inc)
                        write(write_unit, FMT_WRITE_SETSEQ) init_state, rng%state, rng%inc
                        if (init_state .lt. 0_int64) exit
                        init_state = init_state + init_state
                    end do

                end block
            
        end select



        ! close the used file
        close(write_unit)       

    end subroutine test_pcg_seed_core



    module procedure test_pcg_seed

        !> A local variable for this SUBROUTINE
        type(pcg_state_mcg_8_type) :: rng_mcg_8

        !> A local variable for this SUBROUTINE
        type(pcg_state_mcg_16_type) :: rng_mcg_16

        !> A local variable for this SUBROUTINE
        type(pcg_state_mcg_32_type) :: rng_mcg_32

        !> A local variable for this SUBROUTINE
        type(pcg_state_mcg_64_type) :: rng_mcg_64



        !> A local variable for this SUBROUTINE
        type(pcg_state_oneseq_8_type) :: rng_oneseq_8

        !> A local variable for this SUBROUTINE
        type(pcg_state_oneseq_16_type) :: rng_oneseq_16

        !> A local variable for this SUBROUTINE
        type(pcg_state_oneseq_32_type) :: rng_oneseq_32

        !> A local variable for this SUBROUTINE
        type(pcg_state_oneseq_64_type) :: rng_oneseq_64



        !> A local variable for this SUBROUTINE
        type(pcg_state_setseq_8_type) :: rng_setseq_8

        !> A local variable for this SUBROUTINE
        type(pcg_state_setseq_16_type) :: rng_setseq_16

        !> A local variable for this SUBROUTINE
        type(pcg_state_setseq_32_type) :: rng_setseq_32

        !> A local variable for this SUBROUTINE
        type(pcg_state_setseq_64_type) :: rng_setseq_64



        !> A local variable for this SUBROUTINE
        type(pcg_state_unique_8_type) :: rng_unique_8

        !> A local variable for this SUBROUTINE
        type(pcg_state_unique_16_type) :: rng_unique_16

        !> A local variable for this SUBROUTINE
        type(pcg_state_unique_32_type) :: rng_unique_32

        !> A local variable for this SUBROUTINE
        type(pcg_state_unique_64_type) :: rng_unique_64



        call test_pcg_seed_core(rng_mcg_8 )
        call test_pcg_seed_core(rng_mcg_16)
        call test_pcg_seed_core(rng_mcg_32)
        call test_pcg_seed_core(rng_mcg_64)

        call test_pcg_seed_core(rng_oneseq_8 )
        call test_pcg_seed_core(rng_oneseq_16)
        call test_pcg_seed_core(rng_oneseq_32)
        call test_pcg_seed_core(rng_oneseq_64)

        call test_pcg_seed_core(rng_setseq_8 )
        call test_pcg_seed_core(rng_setseq_16)
        call test_pcg_seed_core(rng_setseq_32)
        call test_pcg_seed_core(rng_setseq_64)

        call test_pcg_seed_core(rng_unique_8 )
        call test_pcg_seed_core(rng_unique_16)
        call test_pcg_seed_core(rng_unique_32)
        call test_pcg_seed_core(rng_unique_64)

    end procedure test_pcg_seed

end submodule pcg_seed_implementation
