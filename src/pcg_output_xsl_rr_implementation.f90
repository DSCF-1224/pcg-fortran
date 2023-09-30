submodule (pcg_fortran) pcg_output_xsl_rr_implementation

    implicit none
    contains



    module procedure pcg_output_xsl_rr_64_32
        xsl_rr = pcg_rotr( ieor( int(shiftr(state, 32), int32), int(state, int32) ), shiftr(state, 59) )
    end procedure pcg_output_xsl_rr_64_32



    module procedure test_pcg_output_xsl_rr
        call test_pcg_output_xsl_rr_64_32
    end procedure test_pcg_output_xsl_rr



    subroutine test_pcg_output_xsl_rr_64_32

        !> A local variable for this SUBROUTINE
        !> The input value for the target of this test
        integer(int64) :: state

        !> A local variable for this SUBROUTINE
        !> The device number to output the result of this test
        integer :: write_unit

        ! open the file to save the result of this test
        open( &!
            newunit = write_unit    , &!
            file    = './64_32.dat' , &!
            action  = 'write'       , &!
            status  = 'replace'       &!
        )

        ! write the results of this test
        state = 1_int64

        do

            write(write_unit, '(I0,1X,I0)') &!
            &   state, &!
            &   pcg_output_xsl_rr(state)

            if (state .lt. 0_int64) exit

            state = state + state

        end do

        ! close the used file
        close(write_unit)

    end subroutine test_pcg_output_xsl_rr_64_32

end submodule pcg_output_xsl_rr_implementation
