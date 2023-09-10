submodule (pcg_fortran) pcg_output_xsl_rr_rr_implementation

    implicit none



    integer(int64), parameter :: MASK_64 = int(Z'00000000FFFFFFFF', kind=8)



    contains



    module procedure pcg_output_xsl_rr_rr_64_64

        integer(int32) :: high
        integer(int32) :: low
        integer(int32) :: new_high
        integer(int32) :: new_low_32
        integer(int64) :: new_low_64

        high = int(shiftr(state, 32), int32)
        low  = int(       state     , int32)

        new_low_32 = pcg_rotr( ieor(high, low), shiftr(state, 59)                   )
        new_high   = pcg_rotr( high           , int(iand(new_low_32, 31_int32), int64) )

        new_low_64 = iand( MASK_64, int(new_low_32, int64) )

        xsl_rr_rr = ior( shiftl(int(new_high, int64), 32), new_low_64 )

    end procedure pcg_output_xsl_rr_rr_64_64



    module procedure test_pcg_output_xsl_rr_rr
        call test_pcg_output_xsl_rr_rr_64_64
    end procedure test_pcg_output_xsl_rr_rr



    subroutine test_pcg_output_xsl_rr_rr_64_64

        !> A local variable for this SUBROUTINE
        !> The input value for the target of this test
        integer(int64) :: state

        !> A local variable for this SUBROUTINE
        !> The device number to output the result of this test
        integer :: write_unit

        ! open the file to save the result of this test
        open( &!
            newunit = write_unit    , &!
            file    = './64_64.dat' , &!
            action  = 'write'       , &!
            status  = 'replace'       &!
        )

        ! write the results of this test
        state = 1_int64

        do

            write(write_unit, '(I0,1X,I0)') &!
            &   state, &!
            &   pcg_output_xsl_rr_rr(state)

            if (state .lt. 0_int64) exit

            state = state + state

        end do

        ! close the used file
        close(write_unit)

    end subroutine test_pcg_output_xsl_rr_rr_64_64

end submodule pcg_output_xsl_rr_rr_implementation
