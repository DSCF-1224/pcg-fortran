submodule (pcg_fortran) pcg_advance_lcg_implementation

    implicit none
    contains



    module procedure pcg_advance_lcg_8

        !> A local variable for this FUNCTION
        integer(int8) :: acc_mult

        !> A local variable for this FUNCTION
        integer(int8) :: acc_plus

        !> A local variable for this FUNCTION
        integer(int8) :: cur_mult

        !> A local variable for this FUNCTION
        integer(int8) :: cur_plus

        !> A local variable for this FUNCTION
        integer(int8) :: delta



        acc_mult = 1_int8
        acc_plus = 0_int8
        cur_mult = init_cur_mult
        cur_plus = init_cur_plus
        delta    = init_delta

        do while (delta .ne. 0_int8)

            if ( btest(delta, 0) ) then
                acc_mult = acc_mult * cur_mult
                acc_plus = acc_plus * cur_mult + cur_plus
            end if

            cur_plus = (cur_mult + 1_int8) * cur_plus
            cur_mult = cur_mult * cur_mult
            delta    = shiftr(delta, 1)

        end do

        pcg_lcg = acc_mult * state + acc_plus

    end procedure pcg_advance_lcg_8



    module procedure pcg_advance_lcg_16

        !> A local variable for this FUNCTION
        integer(int16) :: acc_mult

        !> A local variable for this FUNCTION
        integer(int16) :: acc_plus

        !> A local variable for this FUNCTION
        integer(int16) :: cur_mult

        !> A local variable for this FUNCTION
        integer(int16) :: cur_plus

        !> A local variable for this FUNCTION
        integer(int16) :: delta



        acc_mult = 1_int16
        acc_plus = 0_int16
        cur_mult = init_cur_mult
        cur_plus = init_cur_plus
        delta    = init_delta

        do while (delta .ne. 0_int16)

            if ( btest(delta, 0) ) then
                acc_mult = acc_mult * cur_mult
                acc_plus = acc_plus * cur_mult + cur_plus
            end if

            cur_plus = (cur_mult + 1_int16) * cur_plus
            cur_mult = cur_mult * cur_mult
            delta    = shiftr(delta, 1)

        end do

        pcg_lcg = acc_mult * state + acc_plus

    end procedure pcg_advance_lcg_16



    module procedure pcg_advance_lcg_32

        !> A local variable for this FUNCTION
        integer(int32) :: acc_mult

        !> A local variable for this FUNCTION
        integer(int32) :: acc_plus

        !> A local variable for this FUNCTION
        integer(int32) :: cur_mult

        !> A local variable for this FUNCTION
        integer(int32) :: cur_plus

        !> A local variable for this FUNCTION
        integer(int32) :: delta



        acc_mult = 1_int32
        acc_plus = 0_int32
        cur_mult = init_cur_mult
        cur_plus = init_cur_plus
        delta    = init_delta

        do while (delta .ne. 0_int32)

            if ( btest(delta, 0) ) then
                acc_mult = acc_mult * cur_mult
                acc_plus = acc_plus * cur_mult + cur_plus
            end if

            cur_plus = (cur_mult + 1_int32) * cur_plus
            cur_mult = cur_mult * cur_mult
            delta    = shiftr(delta, 1)

        end do

        pcg_lcg = acc_mult * state + acc_plus

    end procedure pcg_advance_lcg_32

end submodule pcg_advance_lcg_implementation
