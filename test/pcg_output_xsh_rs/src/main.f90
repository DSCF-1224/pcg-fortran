program test

    use,     intrinsic :: iso_fortran_env
    use, non_intrinsic :: pcg_fortran

    implicit none

    print * , compiler_version()
    print * , compiler_options()

end program test
