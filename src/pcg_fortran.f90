module pcg_fortran

    use, intrinsic :: iso_fortran_env

    implicit none

    private
    public  :: test_pcg_output_rxs_m
    public  :: test_pcg_output_rxs_m_xs
    public  :: test_pcg_output_xsh_rr
    public  :: test_pcg_output_xsh_rs
    public  :: test_pcg_output_xsl_rr
    public  :: test_pcg_output_xsl_rr_rr



    type, abstract :: pcg_state_type

        contains

        procedure(pcg_initialize_abstract), pass(rng), deferred, public :: initialize

    end type pcg_state_type



    type, abstract, extends(pcg_state_type) :: pcg_state_8_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int8), private :: state

    end type pcg_state_8_type



    type, abstract, extends(pcg_state_type) :: pcg_state_16_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int16), private :: state

    end type pcg_state_16_type



    type, abstract, extends(pcg_state_type) :: pcg_state_32_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int32), private :: state

    end type pcg_state_32_type



    type, abstract, extends(pcg_state_type) :: pcg_state_64_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int64), private :: state

    end type pcg_state_64_type



    type, extends(pcg_state_8_type) :: pcg_state_mcg_8_type
    !! Representations mcg variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_mcg_8

    end type pcg_state_mcg_8_type



    type, extends(pcg_state_8_type) :: pcg_state_oneseq_8_type
    !! Representations oneseq variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_oneseq_8

    end type pcg_state_oneseq_8_type



    type, extends(pcg_state_8_type) :: pcg_state_setseq_8_type
    !! Representations setseq variants

        integer(int8), private :: inc

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_setseq_8

    end type pcg_state_setseq_8_type



    type, extends(pcg_state_8_type) :: pcg_state_unique_8_type
    !! Representations unique variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_unique_8

    end type pcg_state_unique_8_type



    type, extends(pcg_state_16_type) :: pcg_state_mcg_16_type
    !! Representations mcg variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_mcg_16

    end type pcg_state_mcg_16_type



    type, extends(pcg_state_16_type) :: pcg_state_oneseq_16_type
    !! Representations oneseq variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_oneseq_16

    end type pcg_state_oneseq_16_type



    type, extends(pcg_state_16_type) :: pcg_state_setseq_16_type
    !! Representations setseq variants

        integer(int16), private :: inc

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_setseq_16

    end type pcg_state_setseq_16_type



    type, extends(pcg_state_16_type) :: pcg_state_unique_16_type
    !! Representations unique variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_unique_16

    end type pcg_state_unique_16_type



    type, extends(pcg_state_32_type) :: pcg_state_mcg_32_type
    !! Representations mcg variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_mcg_32

    end type pcg_state_mcg_32_type



    type, extends(pcg_state_32_type) :: pcg_state_oneseq_32_type
    !! Representations oneseq variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_oneseq_32

    end type pcg_state_oneseq_32_type



    type, extends(pcg_state_32_type) :: pcg_state_setseq_32_type
    !! Representations setseq variants

        integer(int32), private :: inc

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_setseq_32

    end type pcg_state_setseq_32_type



    type, extends(pcg_state_32_type) :: pcg_state_unique_32_type
    !! Representations unique variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_unique_32

    end type pcg_state_unique_32_type



    type, extends(pcg_state_64_type) :: pcg_state_mcg_64_type
    !! Representations mcg variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_mcg_64

    end type pcg_state_mcg_64_type



    type, extends(pcg_state_64_type) :: pcg_state_oneseq_64_type
    !! Representations oneseq variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_oneseq_64

    end type pcg_state_oneseq_64_type



    type, extends(pcg_state_64_type) :: pcg_state_setseq_64_type
    !! Representations setseq variants

        integer(int64), private :: inc

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_setseq_64

    end type pcg_state_setseq_64_type



    type, extends(pcg_state_64_type) :: pcg_state_unique_64_type
    !! Representations unique variants

        contains

        procedure, pass(rng), public :: initialize => pcg_initialize_unique_64

    end type pcg_state_unique_64_type



    !> Static initialization constants
    !> (if you can't call srandom for some bizarre reason).
    interface

        module subroutine pcg_initialize_abstract(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_type), intent(out) :: rng

        end subroutine pcg_initialize_abstract



        module subroutine pcg_initialize_mcg_8(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_8_type), intent(out) :: rng

        end subroutine pcg_initialize_mcg_8



        module subroutine pcg_initialize_oneseq_8(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_8_type), intent(out) :: rng

        end subroutine pcg_initialize_oneseq_8



        module subroutine pcg_initialize_setseq_8(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_8_type), intent(out) :: rng

        end subroutine pcg_initialize_setseq_8



        module subroutine pcg_initialize_unique_8(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_8_type), intent(out) :: rng

        end subroutine pcg_initialize_unique_8



        module subroutine pcg_initialize_mcg_16(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_16_type), intent(out) :: rng

        end subroutine pcg_initialize_mcg_16



        module subroutine pcg_initialize_oneseq_16(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_16_type), intent(out) :: rng

        end subroutine pcg_initialize_oneseq_16



        module subroutine pcg_initialize_setseq_16(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_16_type), intent(out) :: rng

        end subroutine pcg_initialize_setseq_16



        module subroutine pcg_initialize_unique_16(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_16_type), intent(out) :: rng

        end subroutine pcg_initialize_unique_16



        module subroutine pcg_initialize_mcg_32(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_32_type), intent(out) :: rng

        end subroutine pcg_initialize_mcg_32



        module subroutine pcg_initialize_oneseq_32(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_32_type), intent(out) :: rng

        end subroutine pcg_initialize_oneseq_32



        module subroutine pcg_initialize_setseq_32(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_32_type), intent(out) :: rng

        end subroutine pcg_initialize_setseq_32



        module subroutine pcg_initialize_unique_32(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_32_type), intent(out) :: rng

        end subroutine pcg_initialize_unique_32



        module subroutine pcg_initialize_mcg_64(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_64_type), intent(out) :: rng

        end subroutine pcg_initialize_mcg_64



        module subroutine pcg_initialize_oneseq_64(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_64_type), intent(out) :: rng

        end subroutine pcg_initialize_oneseq_64



        module subroutine pcg_initialize_setseq_64(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_64_type), intent(out) :: rng

        end subroutine pcg_initialize_setseq_64



        module subroutine pcg_initialize_unique_64(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_64_type), intent(out) :: rng

        end subroutine pcg_initialize_unique_64

    end interface



    interface pcg_output_rxs_m

        !> Output function: RXS M
        module pure elemental function pcg_output_rxs_m_16_8(state) result(rxs_m)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int8) :: rxs_m

        end function pcg_output_rxs_m_16_8



        !> Output function: RXS M
        module pure elemental function pcg_output_rxs_m_32_16(state) result(rxs_m)

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int16) :: rxs_m

        end function pcg_output_rxs_m_32_16



        !> Output function: RXS M
        module pure elemental function pcg_output_rxs_m_64_32(state) result(rxs_m)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int32) :: rxs_m

        end function pcg_output_rxs_m_64_32

    end interface pcg_output_rxs_m



    interface pcg_output_rxs_m_xs

        !> Output function: RXS M XS
        module pure elemental function pcg_output_rxs_m_xs_8_8(state) result(rxs_m_xs)

            !> A dummy argument for this FUNCTION
            integer(int8), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int8) :: rxs_m_xs

        end function pcg_output_rxs_m_xs_8_8



        !> Output function: RXS M XS
        module pure elemental function pcg_output_rxs_m_xs_16_16(state) result(rxs_m_xs)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int16) :: rxs_m_xs

        end function pcg_output_rxs_m_xs_16_16



        !> Output function: RXS M XS
        module pure elemental function pcg_output_rxs_m_xs_32_32(state) result(rxs_m_xs)

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int32) :: rxs_m_xs

        end function pcg_output_rxs_m_xs_32_32



        !> Output function: RXS M XS
        module pure elemental function pcg_output_rxs_m_xs_64_64(state) result(rxs_m_xs)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int64) :: rxs_m_xs

        end function pcg_output_rxs_m_xs_64_64

    end interface pcg_output_rxs_m_xs



    interface pcg_output_xsh_rr

        !> Output function: XSH RR
        module pure elemental function pcg_output_xsh_rr_16_8(state) result(xsh_rr)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int8) :: xsh_rr

        end function pcg_output_xsh_rr_16_8



        !> Output function: XSH RR
        module pure elemental function pcg_output_xsh_rr_32_16(state) result(xsh_rr)

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int16) :: xsh_rr

        end function pcg_output_xsh_rr_32_16



        !> Output function: XSH RR
        module pure elemental function pcg_output_xsh_rr_64_32(state) result(xsh_rr)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int32) :: xsh_rr

        end function pcg_output_xsh_rr_64_32

    end interface pcg_output_xsh_rr



    interface pcg_output_xsh_rs

        !> Output function: XSH RS
        module pure elemental function pcg_output_xsh_rs_16_8(state) result(xsh_rs)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int8) :: xsh_rs

        end function pcg_output_xsh_rs_16_8



        !> Output function: XSH RS
        module pure elemental function pcg_output_xsh_rs_32_16(state) result(xsh_rs)

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int16) :: xsh_rs

        end function pcg_output_xsh_rs_32_16



        !> Output function: XSH RS
        module pure elemental function pcg_output_xsh_rs_64_32(state) result(xsh_rs)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int32) :: xsh_rs

        end function pcg_output_xsh_rs_64_32

    end interface pcg_output_xsh_rs



    interface pcg_output_xsl_rr

        !> Output function: XSH RS
        module pure elemental function pcg_output_xsl_rr_64_32(state) result(xsl_rr)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int32) :: xsl_rr

        end function pcg_output_xsl_rr_64_32

    end interface pcg_output_xsl_rr



    interface pcg_output_xsl_rr_rr

        !> Output function: XSH RS
        module pure elemental function pcg_output_xsl_rr_rr_64_64(state) result(xsl_rr_rr)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: state

            !> The return value of this FUNCTION
            integer(int64) :: xsl_rr_rr

        end function pcg_output_xsl_rr_rr_64_64

    end interface pcg_output_xsl_rr_rr



    interface pcg_rotr

        !> Rotate helper function
        module pure elemental function pcg_rotr_8(value_, rot) result(rotr)

            !> A dummy argument for this FUNCTION
            integer(int8), intent(in) :: value_

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: rot

            !> The return value of this FUNCTION
            integer(int8) :: rotr

        end function pcg_rotr_8



        !> Rotate helper function
        module pure elemental function pcg_rotr_16(value_, rot) result(rotr)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: value_

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: rot

            !> The return value of this FUNCTION
            integer(int16) :: rotr

        end function pcg_rotr_16



        !> Rotate helper function
        module pure elemental function pcg_rotr_32(value_, rot) result(rotr)

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: value_

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: rot

            !> The return value of this FUNCTION
            integer(int32) :: rotr

        end function pcg_rotr_32

    end interface pcg_rotr



    interface

        !> A SUBROUTINE for a test: `pcg_output_rxs_m`
        module subroutine test_pcg_output_rxs_m
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_output_rxs_m

        !> A SUBROUTINE for a test: `pcg_output_rxs_m_xs`
        module subroutine test_pcg_output_rxs_m_xs
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_output_rxs_m_xs

        !> A SUBROUTINE for a test: `pcg_output_xsh_rs`
        module subroutine test_pcg_output_xsh_rs
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_output_xsh_rs

        !> A SUBROUTINE for a test: `pcg_output_xsh_rr`
        module subroutine test_pcg_output_xsh_rr
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_output_xsh_rr

        !> A SUBROUTINE for a test: `pcg_output_xsl_rr`
        module subroutine test_pcg_output_xsl_rr
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_output_xsl_rr

        !> A SUBROUTINE for a test: `pcg_output_xsl_rr_rr`
        module subroutine test_pcg_output_xsl_rr_rr
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_output_xsl_rr_rr

    end interface

end module pcg_fortran
