submodule (pcg_fortran) pcg_advance_implementation

    implicit none



    integer(int8)  , parameter :: DELTA_INT8 =  -6_int8
    integer(int16) , parameter :: DELTA_INT16 = -6_int16
    integer(int32) , parameter :: DELTA_INT32 = -6_int32
    integer(int64) , parameter :: DELTA_INT64 = -6_int64



    character(len=*), parameter :: FMT_WRITE_BASIC  = '(Z0,1X,Z0)'
    character(len=*), parameter :: FMT_WRITE_SETSEQ = '(Z0,2(1X,Z0))'



    contains



    subroutine test_pcg_advance_core(rng)

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
        select type(rng)

            class is(pcg_state_basic_8_type)
            block

                !> A local variable for this BLOCK
                integer(int8) :: state



                do state = 0_int8, (huge(state) - 1_int8)
                    rng%state = state
                    call rng%advance(DELTA_INT8)
                    write(write_unit, FMT_WRITE_BASIC) state, rng%state
                end do

                state     = huge(state)
                rng%state = state
                call rng%advance(DELTA_INT8)
                write(write_unit, FMT_WRITE_BASIC) state, rng%state

                state     = state + 1_int8
                rng%state = state
                call rng%advance(DELTA_INT8)
                write(write_unit, FMT_WRITE_BASIC) state, rng%state

                do state = ( - huge(state) ), (- 1_int8)
                    rng%state = state
                    call rng%advance(DELTA_INT8)
                    write(write_unit, FMT_WRITE_BASIC) state, rng%state
                end do

            end block

            class is(pcg_state_basic_16_type)
            block

                !> A local variable for this BLOCK
                integer(int16) :: state



                do state = 0_int16, (huge(state) - 1_int16)
                    rng%state = state
                    call rng%advance(DELTA_INT16)
                    write(write_unit, FMT_WRITE_BASIC) state, rng%state
                end do

                state     = huge(state)
                rng%state = state
                call rng%advance(DELTA_INT16)
                write(write_unit, FMT_WRITE_BASIC) state, rng%state

                state     = state + 1_int16
                rng%state = state
                call rng%advance(DELTA_INT16)
                write(write_unit, FMT_WRITE_BASIC) state, rng%state

                do state = ( - huge(state) ), (- 1_int16)
                    rng%state = state
                    call rng%advance(DELTA_INT16)
                    write(write_unit, FMT_WRITE_BASIC) state, rng%state
                end do

            end block

            class is(pcg_state_basic_32_type)
            block

                !> A local variable for this BLOCK
                integer(int32) :: state



                state = 1_int32

                do
                    rng%state = state
                    call rng%advance(DELTA_INT32)
                    write(write_unit, FMT_WRITE_BASIC) state, rng%state
                    if (state .lt. 0_int32) exit
                    state = state + state
                end do

            end block

            class is(pcg_state_basic_64_type)
            block

                !> A local variable for this BLOCK
                integer(int64) :: state



                state = 1_int64

                do
                    rng%state = state
                    call rng%advance(DELTA_INT64)
                    write(write_unit, FMT_WRITE_BASIC) state, rng%state
                    if (state .lt. 0_int64) exit
                    state = state + state
                end do

            end block

            class is(pcg_state_setseq_8_type)
            block

                !> A local variable for this BLOCK
                integer(int8) :: state



                do state = 0_int8, (huge(state) - 1_int8)
                    call rng%initialize()
                    rng%state = state
                    call rng%advance(DELTA_INT8)
                    write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc
                end do

                state = huge(state)
                call rng%initialize()
                rng%state = state
                call rng%advance(DELTA_INT8)
                write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc

                state = state + 1_int8
                call rng%initialize()
                rng%state = state
                call rng%advance(DELTA_INT8)
                write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc

                do state = ( - huge(state) ), (- 1_int8)
                    call rng%initialize()
                    rng%state = state
                    call rng%advance(DELTA_INT8)
                    write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc
                end do

            end block

            class is(pcg_state_setseq_16_type)
            block

                !> A local variable for this BLOCK
                integer(int16) :: state



                do state = 0_int16, (huge(state) - 1_int16)
                    call rng%initialize()
                    rng%state = state
                    call rng%advance(DELTA_INT16)
                    write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc
                end do

                state = huge(state)
                call rng%initialize()
                rng%state = state
                call rng%advance(DELTA_INT16)
                write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc

                state = state + 1_int16
                call rng%initialize()
                rng%state = state
                call rng%advance(DELTA_INT16)
                write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc

                do state = ( - huge(state) ), (- 1_int16)
                    call rng%initialize()
                    rng%state = state
                    call rng%advance(DELTA_INT16)
                    write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc
                end do

            end block

            class is(pcg_state_setseq_32_type)
            block

                !> A local variable for this BLOCK
                integer(int32) :: state



                state = 1_int32

                do
                    call rng%initialize()
                    rng%state = state
                    call rng%advance(DELTA_INT32)
                    write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc
                    if (state .lt. 0_int32) exit
                    state = state + state
                end do

            end block

            class is(pcg_state_setseq_64_type)
            block

                !> A local variable for this BLOCK
                integer(int64) :: state



                state = 1_int64

                do
                    call rng%initialize()
                    rng%state = state
                    call rng%advance(DELTA_INT64)
                    write(write_unit, FMT_WRITE_SETSEQ) state, rng%state, rng%inc
                    if (state .lt. 0_int64) exit
                    state = state + state
                end do

            end block

        end select



        ! close the used file
        close(write_unit)

    end subroutine test_pcg_advance_core



    module procedure test_pcg_advance

        !> A local variable for this SUBROUTINE
        type(pcg_state_mcg_8_type ) :: rng_mcg_8
        type(pcg_state_mcg_16_type) :: rng_mcg_16
        type(pcg_state_mcg_32_type) :: rng_mcg_32
        type(pcg_state_mcg_64_type) :: rng_mcg_64



        !> A local variable for this SUBROUTINE
        type(pcg_state_oneseq_8_type ) :: rng_oneseq_8
        type(pcg_state_oneseq_16_type) :: rng_oneseq_16
        type(pcg_state_oneseq_32_type) :: rng_oneseq_32
        type(pcg_state_oneseq_64_type) :: rng_oneseq_64



        !> A local variable for this SUBROUTINE
        type(pcg_state_setseq_8_type ) :: rng_setseq_8
        type(pcg_state_setseq_16_type) :: rng_setseq_16
        type(pcg_state_setseq_32_type) :: rng_setseq_32
        type(pcg_state_setseq_64_type) :: rng_setseq_64



        !> A local variable for this SUBROUTINE
        type(pcg_state_unique_8_type ) :: rng_unique_8
        type(pcg_state_unique_16_type) :: rng_unique_16
        type(pcg_state_unique_32_type) :: rng_unique_32
        type(pcg_state_unique_64_type) :: rng_unique_64



        call test_pcg_advance_core(rng_mcg_8 )
        call test_pcg_advance_core(rng_mcg_16)
        call test_pcg_advance_core(rng_mcg_32)
        call test_pcg_advance_core(rng_mcg_64)

        call test_pcg_advance_core(rng_oneseq_8 )
        call test_pcg_advance_core(rng_oneseq_16)
        call test_pcg_advance_core(rng_oneseq_32)
        call test_pcg_advance_core(rng_oneseq_64)

        call test_pcg_advance_core(rng_setseq_8 )
        call test_pcg_advance_core(rng_setseq_16)
        call test_pcg_advance_core(rng_setseq_32)
        call test_pcg_advance_core(rng_setseq_64)

        call test_pcg_advance_core(rng_unique_8 )
        call test_pcg_advance_core(rng_unique_16)
        call test_pcg_advance_core(rng_unique_32)
        call test_pcg_advance_core(rng_unique_64)

    end procedure test_pcg_advance

end submodule pcg_advance_implementation
