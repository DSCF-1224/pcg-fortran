submodule (pcg_fortran) default_increment_implementation

    implicit none
    contains



    module procedure pcg_add_default_increment_8  ; incremented = i + PCG_DEFAULT_INCREMENT_8  ; end procedure
    module procedure pcg_add_default_increment_16 ; incremented = i + PCG_DEFAULT_INCREMENT_16 ; end procedure
    module procedure pcg_add_default_increment_32 ; incremented = i + PCG_DEFAULT_INCREMENT_32 ; end procedure
    module procedure pcg_add_default_increment_64 ; incremented = i + PCG_DEFAULT_INCREMENT_64 ; end procedure

end submodule default_increment_implementation
