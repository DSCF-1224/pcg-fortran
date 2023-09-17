program test

    use, intrinsic :: iso_fortran_env

    use, non_intrinsic :: pcg_fortran, only: test_pcg_seed

    implicit none

    print * , compiler_version()
    print * , compiler_options()

    call test_pcg_seed

end program test
