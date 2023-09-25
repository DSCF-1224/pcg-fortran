program test

    use, intrinsic :: iso_fortran_env

    use, non_intrinsic :: pcg_c_interface
    use, non_intrinsic :: pcg_fortran
    use, non_intrinsic :: pcg_harvest

    implicit none



    !> A PARAMETER for this PROGRAM
    !> The size of an array of pseudorandom numbers
    integer(int32), parameter :: HARVEST_SIZE = 10 ** 5



    if ( .not. test_pcg_mcg_16_rxs_m_8_random_r()     )  print *, 'Failed: pcg_mcg_16_rxs_m_8_random_r'
    if ( .not. test_pcg_oneseq_16_rxs_m_8_random_r()  )  print *, 'Failed: pcg_oneseq_16_rxs_m_8_random_r'
    if ( .not. test_pcg_setseq_16_rxs_m_8_random_r()  )  print *, 'Failed: pcg_setseq_16_rxs_m_8_random_r'
    if ( .not. test_pcg_unique_16_rxs_m_8_random_r()  )  print *, 'Failed: pcg_unique_16_rxs_m_8_random_r'

    if ( .not. test_pcg_mcg_32_rxs_m_16_random_r()    )  print *, 'Failed: pcg_mcg_32_rxs_m_16_random_r'
    if ( .not. test_pcg_oneseq_32_rxs_m_16_random_r() )  print *, 'Failed: pcg_oneseq_32_rxs_m_16_random_r'
    if ( .not. test_pcg_setseq_32_rxs_m_16_random_r() )  print *, 'Failed: pcg_setseq_32_rxs_m_16_random_r'
    if ( .not. test_pcg_unique_32_rxs_m_16_random_r() )  print *, 'Failed: pcg_unique_32_rxs_m_16_random_r'

    if ( .not. test_pcg_mcg_64_rxs_m_32_random_r()    )  print *, 'Failed: pcg_mcg_64_rxs_m_32_random_r'
    if ( .not. test_pcg_oneseq_64_rxs_m_32_random_r() )  print *, 'Failed: pcg_oneseq_64_rxs_m_32_random_r'
    if ( .not. test_pcg_setseq_64_rxs_m_32_random_r() )  print *, 'Failed: pcg_setseq_64_rxs_m_32_random_r'
    if ( .not. test_pcg_unique_64_rxs_m_32_random_r() )  print *, 'Failed: pcg_unique_64_rxs_m_32_random_r'

    print *, 'Finished successfully'



    contains



    function test_pcg_mcg_16_rxs_m_8_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_mcg_16_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int8_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_mcg_16_rxs_m_8_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_mcg_16_rxs_m_8_random_r



    function test_pcg_oneseq_16_rxs_m_8_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_oneseq_16_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int8_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_oneseq_16_rxs_m_8_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_oneseq_16_rxs_m_8_random_r



    function test_pcg_setseq_16_rxs_m_8_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_setseq_16_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int8_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_setseq_16_rxs_m_8_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_setseq_16_rxs_m_8_random_r



    function test_pcg_unique_16_rxs_m_8_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_unique_16_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int8_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_unique_16_rxs_m_8_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_unique_16_rxs_m_8_random_r



    function test_pcg_mcg_32_rxs_m_16_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_mcg_32_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int16_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_mcg_32_rxs_m_16_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_mcg_32_rxs_m_16_random_r



    function test_pcg_oneseq_32_rxs_m_16_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_oneseq_32_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int16_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_oneseq_32_rxs_m_16_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_oneseq_32_rxs_m_16_random_r



    function test_pcg_setseq_32_rxs_m_16_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_setseq_32_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int16_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_setseq_32_rxs_m_16_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_setseq_32_rxs_m_16_random_r



    function test_pcg_unique_32_rxs_m_16_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_unique_32_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int16_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_unique_32_rxs_m_16_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_unique_32_rxs_m_16_random_r



    function test_pcg_mcg_64_rxs_m_32_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_mcg_64_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int32_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_mcg_64_rxs_m_32_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_mcg_64_rxs_m_32_random_r



    function test_pcg_oneseq_64_rxs_m_32_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_oneseq_64_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int32_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_oneseq_64_rxs_m_32_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_oneseq_64_rxs_m_32_random_r



    function test_pcg_setseq_64_rxs_m_32_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_setseq_64_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int32_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_setseq_64_rxs_m_32_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_setseq_64_rxs_m_32_random_r



    function test_pcg_unique_64_rxs_m_32_random_r() result(stat)

        !> The return value of this FUNCTION
        logical :: stat



        !> A variable for this SUBROUTINE
        type(pcg_state_unique_64_type) :: rng
    
        !> A variable for this SUBROUTINE
        !> Store the reference pseudorandom numbers
        !> generated by the original implementation / this library
        type(pcg_harvest_int32_type) :: harvest
    


        !> A support variable for this SUBROUTINE
        integer(int32) :: iter



        call harvest%reallocate_fields(HARVEST_SIZE)

        call pcg_unique_64_rxs_m_32_random_r_by_c( HARVEST_SIZE, harvest%c(:) )
    
        call rng%initialize()
    
        do iter = 1_int32, HARVEST_SIZE
            call rng%random_number_rxs_m(harvest%fortran(iter))
        end do
    
        stat = harvest%is_equal()

    end function test_pcg_unique_64_rxs_m_32_random_r

end program test
