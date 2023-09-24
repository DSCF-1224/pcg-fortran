submodule (pcg_harvest) utilities_implementation

    use, intrinsic :: iso_fortran_env

    implicit none

    contains



    module procedure is_ok

        is_ok = (stat .eq. STAT_OK)

    end procedure is_ok

end submodule utilities_implementation
