submodule (pcg_fortran) pcg_step_implementation

    implicit none



    character(len=*), parameter :: FMT_WRITE = '(Z0,1X,Z0)'



    contains



    module procedure test_pcg_step

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

    end procedure test_pcg_step

end submodule pcg_step_implementation
