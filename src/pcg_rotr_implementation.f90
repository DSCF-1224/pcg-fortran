submodule (pcg_fortran) pcg_rorr_implementation

    implicit none
    contains



    module procedure pcg_rotr_8
        rotr = ior( shiftr(value_, rot), shiftl( value_, iand(-rot, 7_int16) ) )
    end procedure pcg_rotr_8



    module procedure pcg_rotr_16
        rotr = ior( shiftr(value_, rot), shiftl( value_, iand(-rot, 15_int32) ) )
    end procedure pcg_rotr_16

end submodule pcg_rorr_implementation
