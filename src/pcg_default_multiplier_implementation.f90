submodule (pcg_fortran) pcg_default_multiplier_implementation

    implicit none
    contains



    module procedure pcg_multiply_default_multiplier_8  ; multiplied = i * PCG_DEFAULT_MULTIPLIER_8  ; end procedure
    module procedure pcg_multiply_default_multiplier_16 ; multiplied = i * PCG_DEFAULT_MULTIPLIER_16 ; end procedure
    module procedure pcg_multiply_default_multiplier_32 ; multiplied = i * PCG_DEFAULT_MULTIPLIER_32 ; end procedure
    module procedure pcg_multiply_default_multiplier_64 ; multiplied = i * PCG_DEFAULT_MULTIPLIER_64 ; end procedure

end submodule pcg_default_multiplier_implementation
