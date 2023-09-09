submodule (pcg_fortran) pcg_rorr_implementation

    implicit none
    contains



    module procedure pcg_rotr_16_8

        rotr = int( ior( shiftr(value_, rot), shiftl( value_, iand(-rot, 7_int16) ) ), int8 )

    end procedure pcg_rotr_16_8

end submodule pcg_rorr_implementation
