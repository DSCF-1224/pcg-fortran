submodule (pcg_fortran) pcg_step_implementation

    implicit none



    character(len=*), parameter :: FMT_WRITE = '(Z0,1X,Z0)'



    contains



    subroutine test_pcg_step_core(rng)

        !> A local variable for this SUBROUTINE
        class(pcg_state_type) :: rng

        !> A local variable for this SUBROUTINE
        !> The device number to output the result of this test
        integer :: write_unit

        !> A local variable for this SUBROUTINE
        !> The file name to output the result of this test
        character(len=15), allocatable :: file_name



        ! setup the file to save the result of this test

        select type(rng)

            type is( pcg_state_mcg_8_type     ); file_name = 'mcg_8'
            type is( pcg_state_mcg_16_type    ); file_name = 'mcg_16'
            type is( pcg_state_mcg_32_type    ); file_name = 'mcg_32'
            type is( pcg_state_mcg_64_type    ); file_name = 'mcg_64'

            type is( pcg_state_oneseq_8_type  ); file_name = 'oneseq_8'
            type is( pcg_state_oneseq_16_type ); file_name = 'oneseq_16'
            type is( pcg_state_oneseq_32_type ); file_name = 'oneseq_32'
            type is( pcg_state_oneseq_64_type ); file_name = 'oneseq_64'

            type is( pcg_state_setseq_8_type  ); file_name = 'setseq_8'
            type is( pcg_state_setseq_16_type ); file_name = 'setseq_16'
            type is( pcg_state_setseq_32_type ); file_name = 'setseq_32'
            type is( pcg_state_setseq_64_type ); file_name = 'setseq_64'

            type is( pcg_state_unique_8_type  ); file_name = 'unique_8'
            type is( pcg_state_unique_16_type ); file_name = 'unique_16'
            type is( pcg_state_unique_32_type ); file_name = 'unique_32'
            type is( pcg_state_unique_64_type ); file_name = 'unique_64'

        end select

        file_name = './' // trim(file_name) // '.dat'



        ! open the file to save the result of this test
        open( &!
            newunit = write_unit      , &!
            file    = trim(file_name) , &!
            action  = 'write'         , &!
            status  = 'replace'         &!
        )



        ! write the results of this test

        call rng%initialize()

        select type(rng)

            class is(pcg_state_8_type)

                block

                    !> A local variable for this BLOCK
                    integer(int8) :: state



                    do state = 0_int8, (huge(state) - 1_int8)
                        rng%state = state
                        call rng%step()
                        write(write_unit, FMT_WRITE) state, rng%state
                    end do

                    state     = huge(state)
                    rng%state = state
                    call rng%step()
                    write(write_unit, FMT_WRITE) state, rng%state

                    state     = state + 1_int8
                    rng%state = state
                    call rng%step()
                    write(write_unit, FMT_WRITE) state, rng%state

                    do state = ( - huge(state) ), (- 1_int8)
                        rng%state = state
                        call rng%step()
                        write(write_unit, FMT_WRITE) state, rng%state
                    end do

                end block

            class is(pcg_state_16_type)

                block

                    !> A local variable for this BLOCK
                    integer(int16) :: state



                    do state = 0_int16, (huge(state) - 1_int16)
                        rng%state = state
                        call rng%step()
                        write(write_unit, FMT_WRITE) state, rng%state
                    end do

                    state     = huge(state)
                    rng%state = state
                    call rng%step()
                    write(write_unit, FMT_WRITE) state, rng%state

                    state     = state + 1_int16
                    rng%state = state
                    call rng%step()
                    write(write_unit, FMT_WRITE) state, rng%state

                    do state = ( - huge(state) ), (- 1_int16)
                        rng%state = state
                        call rng%step()
                        write(write_unit, FMT_WRITE) state, rng%state
                    end do

                end block

            class is(pcg_state_32_type)

                block

                    !> A local variable for this BLOCK
                    integer(int32) :: state

                    state = 1_int32

                    do
                        rng%state = state
                        call rng%step()
                        write(write_unit, FMT_WRITE) state, rng%state
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
                        rng%state = state
                        call rng%step()
                        write(write_unit, FMT_WRITE) state, rng%state
                        if (state .lt. 0_int64) exit
                        state = state + state
                    end do

                end block

        end select

        ! close the used file
        close(write_unit)        

    end subroutine test_pcg_step_core



    subroutine test_pcg_step

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



        call test_pcg_step_core(rng_mcg_8 )
        call test_pcg_step_core(rng_mcg_16)
        call test_pcg_step_core(rng_mcg_32)
        call test_pcg_step_core(rng_mcg_64)

        call test_pcg_step_core(rng_oneseq_8 )
        call test_pcg_step_core(rng_oneseq_16)
        call test_pcg_step_core(rng_oneseq_32)
        call test_pcg_step_core(rng_oneseq_64)

        call test_pcg_step_core(rng_setseq_8 )
        call test_pcg_step_core(rng_setseq_16)
        call test_pcg_step_core(rng_setseq_32)
        call test_pcg_step_core(rng_setseq_64)

        call test_pcg_step_core(rng_unique_8 )
        call test_pcg_step_core(rng_unique_16)
        call test_pcg_step_core(rng_unique_32)
        call test_pcg_step_core(rng_unique_64)

    end subroutine test_pcg_step

end submodule pcg_step_implementation
