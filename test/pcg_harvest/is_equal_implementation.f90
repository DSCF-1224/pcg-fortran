submodule (pcg_harvest) is_equal_implementation

    use, intrinsic :: iso_fortran_env

    implicit none

    contains



    module procedure is_equal_int8  ; is_equal = all( harvest%c(:) .eq. harvest%fortran(:) ) ; end procedure
    module procedure is_equal_int16 ; is_equal = all( harvest%c(:) .eq. harvest%fortran(:) ) ; end procedure
    module procedure is_equal_int32 ; is_equal = all( harvest%c(:) .eq. harvest%fortran(:) ) ; end procedure
    module procedure is_equal_int64 ; is_equal = all( harvest%c(:) .eq. harvest%fortran(:) ) ; end procedure

end submodule is_equal_implementation
