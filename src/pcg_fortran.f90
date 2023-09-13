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



    !> Equal to `77U`
    integer(int8), parameter, private :: PCG_DEFAULT_INCREMENT_8 = int(Z'4D', int8)

    !> Equal to `47989U`
    integer(int16), parameter, private :: PCG_DEFAULT_INCREMENT_16 = int(Z'BB75', int16)
    
    !> Equal to `2891336453U`
    integer(int32), parameter, private :: PCG_DEFAULT_INCREMENT_32 = int(Z'AC564B05', int32)
    
    !> Equal to `1442695040888963407ULL`
    integer(int64), parameter, private :: PCG_DEFAULT_INCREMENT_64 = int(Z'14057B7EF767814F', int64)



    !> Equal to `141U`
    integer(int8), parameter, private :: PCG_DEFAULT_MULTIPLIER_8 = int(Z'8D', int8)
    
    !> Equal to `12829U`
    integer(int16), parameter, private :: PCG_DEFAULT_MULTIPLIER_16 = int(Z'321D', int16)
    
    !> Equal to `747796405U`
    integer(int32), parameter, private :: PCG_DEFAULT_MULTIPLIER_32 = int(Z'2C9277B5', int32)
    
    !> Equal to `6364136223846793005ULL`
    integer(int64), parameter, private :: PCG_DEFAULT_MULTIPLIER_64 = int(Z'5851F42D4C957F2D', int64)



    type, abstract :: pcg_state_type

        contains

        procedure(pcg_initialize_abstract), pass(rng), deferred, public :: initialize

    end type pcg_state_type



    type, abstract, extends(pcg_state_type) :: pcg_state_8_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int8), private :: state

        contains

        procedure, nopass, private :: pcg_multiply_default_multiplier_8

        generic, public :: pcg_default_multiplier => pcg_multiply_default_multiplier_8

    end type pcg_state_8_type



    type, abstract, extends(pcg_state_type) :: pcg_state_16_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int16), private :: state

        contains

        procedure, nopass, private :: pcg_multiply_default_multiplier_16

        generic, public :: pcg_default_multiplier => pcg_multiply_default_multiplier_16

    end type pcg_state_16_type



    type, abstract, extends(pcg_state_type) :: pcg_state_32_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int32), private :: state

        contains

        procedure, nopass, private :: pcg_multiply_default_multiplier_32

        generic, public :: pcg_default_multiplier => pcg_multiply_default_multiplier_32

    end type pcg_state_32_type



    type, abstract, extends(pcg_state_type) :: pcg_state_64_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int64), private :: state

        contains

        procedure, nopass, private :: pcg_multiply_default_multiplier_64

        generic, public :: pcg_default_multiplier => pcg_multiply_default_multiplier_64

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



    interface

        module pure elemental function pcg_multiply_default_multiplier_8(i) result(multiplied)

            !> A dummy argument for this FUNCTION
            integer(int8), intent(in) :: i

            !> The return value of this FUNCTION
            integer(int8) :: multiplied

        end function pcg_multiply_default_multiplier_8



        module pure elemental function pcg_multiply_default_multiplier_16(i) result(multiplied)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: i

            !> The return value of this FUNCTION
            integer(int16) :: multiplied

        end function pcg_multiply_default_multiplier_16



        module pure elemental function pcg_multiply_default_multiplier_32(i) result(multiplied)

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: i

            !> The return value of this FUNCTION
            integer(int32) :: multiplied

        end function pcg_multiply_default_multiplier_32



        module pure elemental function pcg_multiply_default_multiplier_64(i) result(multiplied)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: i

            !> The return value of this FUNCTION
            integer(int64) :: multiplied

        end function pcg_multiply_default_multiplier_64

    end interface



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
