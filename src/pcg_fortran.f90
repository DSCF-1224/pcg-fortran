module pcg_fortran

    use, intrinsic :: iso_c_binding, only: c_loc

    use, intrinsic :: iso_fortran_env

    implicit none

    private

    public  :: pcg_state_mcg_8_type
    public  :: pcg_state_mcg_16_type
    public  :: pcg_state_mcg_32_type
    public  :: pcg_state_mcg_64_type

    public  :: pcg_state_oneseq_8_type
    public  :: pcg_state_oneseq_16_type
    public  :: pcg_state_oneseq_32_type
    public  :: pcg_state_oneseq_64_type

    public  :: pcg_state_setseq_8_type
    public  :: pcg_state_setseq_16_type
    public  :: pcg_state_setseq_32_type
    public  :: pcg_state_setseq_64_type

    public  :: pcg_state_unique_8_type
    public  :: pcg_state_unique_16_type
    public  :: pcg_state_unique_32_type
    public  :: pcg_state_unique_64_type

    public  :: test_pcg_advance
    public  :: test_pcg_output_rxs_m
    public  :: test_pcg_output_rxs_m_xs
    public  :: test_pcg_output_xsh_rr
    public  :: test_pcg_output_xsh_rs
    public  :: test_pcg_output_xsl_rr
    public  :: test_pcg_output_xsl_rr_rr
    public  :: test_pcg_seed
    public  :: test_pcg_step



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

        procedure( pcg_initialize_abstract ), pass(rng), deferred, public  :: initialize
        procedure( pcg_step_abstract       ), pass(rng), deferred, private :: step

    end type pcg_state_type



    type, abstract, extends(pcg_state_type) :: pcg_state_8_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int8), private :: state

        contains

        procedure, nopass, private :: pcg_add_default_increment_8
        procedure, nopass, private :: pcg_multiply_default_multiplier_8

        procedure, pass(rng), private :: pcg_step_for_seeding_8

        procedure(pcg_advance_8_abstract), pass(rng), private, deferred :: advance

        generic, public  :: default_increment  => pcg_add_default_increment_8
        generic, public  :: default_multiplier => pcg_multiply_default_multiplier_8
        generic, private :: step_for_seeding   => pcg_step_for_seeding_8

    end type pcg_state_8_type



    type, abstract, extends(pcg_state_type) :: pcg_state_16_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int16), private :: state

        contains

        procedure, nopass, private :: pcg_add_default_increment_16
        procedure, nopass, private :: pcg_multiply_default_multiplier_16

        procedure, pass(rng), private :: pcg_step_for_seeding_16

        procedure(pcg_advance_16_abstract), pass(rng), private, deferred :: advance

        generic, public  :: default_increment  => pcg_add_default_increment_16
        generic, public  :: default_multiplier => pcg_multiply_default_multiplier_16
        generic, private :: step_for_seeding   => pcg_step_for_seeding_16

    end type pcg_state_16_type



    type, abstract, extends(pcg_state_type) :: pcg_state_32_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int32), private :: state

        contains

        procedure, nopass, private :: pcg_add_default_increment_32
        procedure, nopass, private :: pcg_multiply_default_multiplier_32

        procedure, pass(rng), private :: pcg_step_for_seeding_32

        procedure(pcg_advance_32_abstract), pass(rng), private, deferred :: advance

        generic, public  :: default_increment  => pcg_add_default_increment_32
        generic, public  :: default_multiplier => pcg_multiply_default_multiplier_32
        generic, private :: step_for_seeding   => pcg_step_for_seeding_32

    end type pcg_state_32_type



    type, abstract, extends(pcg_state_type) :: pcg_state_64_type
    !! Representations for the oneseq, mcg, and unique variants

        integer(int64), private :: state

        contains

        procedure, nopass, private :: pcg_add_default_increment_64
        procedure, nopass, private :: pcg_multiply_default_multiplier_64

        procedure, pass(rng), private :: pcg_step_for_seeding_64

        procedure(pcg_advance_64_abstract), pass(rng), private, deferred :: advance

        generic, public  :: default_increment  => pcg_add_default_increment_64
        generic, public  :: default_multiplier => pcg_multiply_default_multiplier_64
        generic, private :: step_for_seeding   => pcg_step_for_seeding_64

    end type pcg_state_64_type



    type, abstract, extends(pcg_state_8_type) :: pcg_state_basic_8_type

        contains

        procedure(pcg_seed_8_abstract), pass(rng), deferred, public :: seed

    end type pcg_state_basic_8_type



    type, abstract, extends(pcg_state_16_type) :: pcg_state_basic_16_type

        contains

        procedure(pcg_seed_16_abstract), pass(rng), deferred, public :: seed

    end type pcg_state_basic_16_type



    type, abstract, extends(pcg_state_32_type) :: pcg_state_basic_32_type

        contains

        procedure(pcg_seed_32_abstract), pass(rng), deferred, public :: seed

    end type pcg_state_basic_32_type



    type, abstract, extends(pcg_state_64_type) :: pcg_state_basic_64_type

        contains

        procedure(pcg_seed_64_abstract), pass(rng), deferred, public :: seed

    end type pcg_state_basic_64_type



    type, extends(pcg_state_basic_8_type) :: pcg_state_mcg_8_type
    !! Representations mcg variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_8_mcg
        procedure, pass(rng), public  :: initialize => pcg_initialize_mcg_8
        procedure, pass(rng), public  :: seed       => pcg_seed_8_mcg
        procedure, pass(rng), private :: step       => pcg_step_8_mcg

    end type pcg_state_mcg_8_type



    type, extends(pcg_state_basic_8_type) :: pcg_state_oneseq_8_type
    !! Representations oneseq variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_8_oneseq
        procedure, pass(rng), public  :: initialize => pcg_initialize_oneseq_8
        procedure, pass(rng), public  :: seed       => pcg_seed_8_oneseq
        procedure, pass(rng), private :: step       => pcg_step_8_oneseq

    end type pcg_state_oneseq_8_type



    type, extends(pcg_state_8_type) :: pcg_state_setseq_8_type
    !! Representations setseq variants

        integer(int8), private :: inc

        contains

        procedure, pass(rng), private :: pcg_seed_8_setseq

        procedure, pass(rng), private :: advance    => pcg_advance_8_setseq
        procedure, pass(rng), public  :: initialize => pcg_initialize_setseq_8
        procedure, pass(rng), private :: step       => pcg_step_8_setseq

        generic, public :: seed => pcg_seed_8_setseq

    end type pcg_state_setseq_8_type



    type, extends(pcg_state_basic_8_type) :: pcg_state_unique_8_type
    !! Representations unique variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_8_unique
        procedure, pass(rng), public  :: initialize => pcg_initialize_unique_8
        procedure, pass(rng), public  :: seed       => pcg_seed_8_unique
        procedure, pass(rng), private :: step       => pcg_step_8_unique

    end type pcg_state_unique_8_type



    type, extends(pcg_state_basic_16_type) :: pcg_state_mcg_16_type
    !! Representations mcg variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_16_mcg
        procedure, pass(rng), public  :: initialize => pcg_initialize_mcg_16
        procedure, pass(rng), public  :: seed       => pcg_seed_16_mcg
        procedure, pass(rng), private :: step       => pcg_step_16_mcg

    end type pcg_state_mcg_16_type



    type, extends(pcg_state_basic_16_type) :: pcg_state_oneseq_16_type
    !! Representations oneseq variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_16_oneseq
        procedure, pass(rng), public  :: initialize => pcg_initialize_oneseq_16
        procedure, pass(rng), public  :: seed       => pcg_seed_16_oneseq
        procedure, pass(rng), private :: step       => pcg_step_16_oneseq

    end type pcg_state_oneseq_16_type



    type, extends(pcg_state_16_type) :: pcg_state_setseq_16_type
    !! Representations setseq variants

        integer(int16), private :: inc

        contains

        procedure, pass(rng), private :: pcg_seed_16_setseq

        procedure, pass(rng), private :: advance    => pcg_advance_16_setseq
        procedure, pass(rng), public  :: initialize => pcg_initialize_setseq_16
        procedure, pass(rng), private :: step       => pcg_step_16_setseq

        generic, public :: seed => pcg_seed_16_setseq

    end type pcg_state_setseq_16_type



    type, extends(pcg_state_basic_16_type) :: pcg_state_unique_16_type
    !! Representations unique variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_16_unique
        procedure, pass(rng), public  :: initialize => pcg_initialize_unique_16
        procedure, pass(rng), public  :: seed       => pcg_seed_16_unique
        procedure, pass(rng), private :: step       => pcg_step_16_unique

    end type pcg_state_unique_16_type



    type, extends(pcg_state_basic_32_type) :: pcg_state_mcg_32_type
    !! Representations mcg variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_32_mcg
        procedure, pass(rng), public  :: initialize => pcg_initialize_mcg_32
        procedure, pass(rng), public  :: seed       => pcg_seed_32_mcg
        procedure, pass(rng), private :: step       => pcg_step_32_mcg

    end type pcg_state_mcg_32_type



    type, extends(pcg_state_basic_32_type) :: pcg_state_oneseq_32_type
    !! Representations oneseq variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_32_oneseq
        procedure, pass(rng), public  :: initialize => pcg_initialize_oneseq_32
        procedure, pass(rng), public  :: seed       => pcg_seed_32_oneseq
        procedure, pass(rng), private :: step       => pcg_step_32_oneseq

    end type pcg_state_oneseq_32_type



    type, extends(pcg_state_32_type) :: pcg_state_setseq_32_type
    !! Representations setseq variants

        integer(int32), private :: inc

        contains

        procedure, pass(rng), private :: pcg_seed_32_setseq

        procedure, pass(rng), private :: advance    => pcg_advance_32_setseq
        procedure, pass(rng), public  :: initialize => pcg_initialize_setseq_32
        procedure, pass(rng), private :: step       => pcg_step_32_setseq

        generic, public :: seed => pcg_seed_32_setseq

    end type pcg_state_setseq_32_type



    type, extends(pcg_state_basic_32_type) :: pcg_state_unique_32_type
    !! Representations unique variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_32_unique
        procedure, pass(rng), public  :: initialize => pcg_initialize_unique_32
        procedure, pass(rng), public  :: seed       => pcg_seed_32_unique
        procedure, pass(rng), private :: step       => pcg_step_32_unique

    end type pcg_state_unique_32_type



    type, extends(pcg_state_basic_64_type) :: pcg_state_mcg_64_type
    !! Representations mcg variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_64_mcg
        procedure, pass(rng), public  :: initialize => pcg_initialize_mcg_64
        procedure, pass(rng), public  :: seed       => pcg_seed_64_mcg
        procedure, pass(rng), private :: step       => pcg_step_64_mcg

    end type pcg_state_mcg_64_type



    type, extends(pcg_state_basic_64_type) :: pcg_state_oneseq_64_type
    !! Representations oneseq variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_64_oneseq
        procedure, pass(rng), public  :: initialize => pcg_initialize_oneseq_64
        procedure, pass(rng), public  :: seed       => pcg_seed_64_oneseq
        procedure, pass(rng), private :: step       => pcg_step_64_oneseq

    end type pcg_state_oneseq_64_type



    type, extends(pcg_state_64_type) :: pcg_state_setseq_64_type
    !! Representations setseq variants

        integer(int64), private :: inc

        contains

        procedure, pass(rng), private :: pcg_seed_64_setseq

        procedure, pass(rng), private :: advance    => pcg_advance_64_setseq
        procedure, pass(rng), public  :: initialize => pcg_initialize_setseq_64
        procedure, pass(rng), private :: step       => pcg_step_64_setseq

        generic, public :: seed => pcg_seed_64_setseq

    end type pcg_state_setseq_64_type



    type, extends(pcg_state_basic_64_type) :: pcg_state_unique_64_type
    !! Representations unique variants

        contains

        procedure, pass(rng), private :: advance    => pcg_advance_64_unique
        procedure, pass(rng), public  :: initialize => pcg_initialize_unique_64
        procedure, pass(rng), public  :: seed       => pcg_seed_64_unique
        procedure, pass(rng), private :: step       => pcg_step_64_unique

    end type pcg_state_unique_64_type



    interface

        module pure elemental function pcg_add_default_increment_8(i) result(incremented)

            !> A dummy argument for this FUNCTION
            integer(int8), intent(in) :: i

            !> The return value of this FUNCTION
            integer(int8) :: incremented

        end function pcg_add_default_increment_8



        module pure elemental function pcg_add_default_increment_16(i) result(incremented)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: i

            !> The return value of this FUNCTION
            integer(int16) :: incremented

        end function pcg_add_default_increment_16



        module pure elemental function pcg_add_default_increment_32(i) result(incremented)

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: i

            !> The return value of this FUNCTION
            integer(int32) :: incremented

        end function pcg_add_default_increment_32



        module pure elemental function pcg_add_default_increment_64(i) result(incremented)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: i

            !> The return value of this FUNCTION
            integer(int64) :: incremented

        end function pcg_add_default_increment_64

    end interface



    !> Functions to advance the underlying LCG,
    !> one version for each size and each style.
    !> These functions are considered semi-private.
    !> There is rarely a good reason to call them directly.
    interface

        module elemental subroutine pcg_advance_8_abstract(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_8_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: delta

        end subroutine pcg_advance_8_abstract



        module elemental subroutine pcg_advance_8_mcg(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_8_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: delta

        end subroutine pcg_advance_8_mcg



        module elemental subroutine pcg_advance_8_oneseq(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_8_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: delta

        end subroutine pcg_advance_8_oneseq



        module elemental subroutine pcg_advance_8_setseq(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_8_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: delta

        end subroutine pcg_advance_8_setseq



        module elemental subroutine pcg_advance_8_unique(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_8_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: delta

        end subroutine pcg_advance_8_unique



        module elemental subroutine pcg_advance_16_abstract(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_16_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: delta

        end subroutine pcg_advance_16_abstract



        module elemental subroutine pcg_advance_16_mcg(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_16_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: delta

        end subroutine pcg_advance_16_mcg



        module elemental subroutine pcg_advance_16_oneseq(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_16_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: delta

        end subroutine pcg_advance_16_oneseq



        module elemental subroutine pcg_advance_16_setseq(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_16_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: delta

        end subroutine pcg_advance_16_setseq



        module elemental subroutine pcg_advance_16_unique(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_16_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: delta

        end subroutine pcg_advance_16_unique



        module elemental subroutine pcg_advance_32_abstract(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_32_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: delta

        end subroutine pcg_advance_32_abstract



        module elemental subroutine pcg_advance_32_mcg(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_32_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: delta

        end subroutine pcg_advance_32_mcg



        module elemental subroutine pcg_advance_32_oneseq(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_32_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: delta

        end subroutine pcg_advance_32_oneseq



        module elemental subroutine pcg_advance_32_setseq(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_32_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: delta

        end subroutine pcg_advance_32_setseq



        module elemental subroutine pcg_advance_32_unique(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_32_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: delta

        end subroutine pcg_advance_32_unique



        module elemental subroutine pcg_advance_64_abstract(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_64_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: delta

        end subroutine pcg_advance_64_abstract



        module elemental subroutine pcg_advance_64_mcg(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_64_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: delta

        end subroutine pcg_advance_64_mcg



        module elemental subroutine pcg_advance_64_oneseq(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_64_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: delta

        end subroutine pcg_advance_64_oneseq



        module elemental subroutine pcg_advance_64_setseq(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_64_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: delta

        end subroutine pcg_advance_64_setseq



        module elemental subroutine pcg_advance_64_unique(rng, delta)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_64_type), target, intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: delta

        end subroutine pcg_advance_64_unique

    end interface



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




    !> Functions to seed the RNG state,
    !> one version for each size and each style.
    !> Unlike the step functions,
    !> regular users can and should call these functions.
    interface

        module subroutine pcg_seed_8_abstract(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_basic_8_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: init_state

        end subroutine pcg_seed_8_abstract



        module subroutine pcg_seed_8_mcg(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_8_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: init_state

        end subroutine pcg_seed_8_mcg



        module subroutine pcg_seed_8_oneseq(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_8_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: init_state

        end subroutine pcg_seed_8_oneseq



        module subroutine pcg_seed_8_unique(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_8_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: init_state

        end subroutine pcg_seed_8_unique

    end interface




    !> Functions to seed the RNG state,
    !> one version for each size and each style.
    !> Unlike the step functions,
    !> regular users can and should call these functions.
    interface

        module subroutine pcg_seed_16_abstract(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_basic_16_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: init_state

        end subroutine pcg_seed_16_abstract



        module subroutine pcg_seed_16_mcg(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_16_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: init_state

        end subroutine pcg_seed_16_mcg



        module subroutine pcg_seed_16_oneseq(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_16_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: init_state

        end subroutine pcg_seed_16_oneseq



        module subroutine pcg_seed_16_unique(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_16_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: init_state

        end subroutine pcg_seed_16_unique

    end interface




    !> Functions to seed the RNG state,
    !> one version for each size and each style.
    !> Unlike the step functions,
    !> regular users can and should call these functions.
    interface

        module subroutine pcg_seed_32_abstract(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_basic_32_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: init_state

        end subroutine pcg_seed_32_abstract



        module subroutine pcg_seed_32_mcg(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_32_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: init_state

        end subroutine pcg_seed_32_mcg



        module subroutine pcg_seed_32_oneseq(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_32_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: init_state

        end subroutine pcg_seed_32_oneseq



        module subroutine pcg_seed_32_unique(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_32_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: init_state

        end subroutine pcg_seed_32_unique

    end interface




    !> Functions to seed the RNG state,
    !> one version for each size and each style.
    !> Unlike the step functions,
    !> regular users can and should call these functions.
    interface

        module subroutine pcg_seed_64_abstract(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_basic_64_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: init_state

        end subroutine pcg_seed_64_abstract



        module subroutine pcg_seed_64_mcg(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_64_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: init_state

        end subroutine pcg_seed_64_mcg



        module subroutine pcg_seed_64_oneseq(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_64_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: init_state

        end subroutine pcg_seed_64_oneseq



        module subroutine pcg_seed_64_unique(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_64_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: init_state

        end subroutine pcg_seed_64_unique

    end interface




    !> Functions to seed the RNG state,
    !> one version for each size and each style.
    !> Unlike the step functions,
    !> regular users can and should call these functions.
    interface

        module subroutine pcg_seed_8_setseq(rng, init_state, init_seq)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_8_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: init_state

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in), optional :: init_seq

        end subroutine pcg_seed_8_setseq



        module subroutine pcg_seed_16_setseq(rng, init_state, init_seq)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_16_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: init_state

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in), optional :: init_seq

        end subroutine pcg_seed_16_setseq



        module subroutine pcg_seed_32_setseq(rng, init_state, init_seq)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_32_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: init_state

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in), optional :: init_seq

        end subroutine pcg_seed_32_setseq



        module subroutine pcg_seed_64_setseq(rng, init_state, init_seq)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_64_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: init_state

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in), optional :: init_seq

        end subroutine pcg_seed_64_setseq

    end interface



    !> Functions to advance the underlying LCG,
    !> one version for each size and each style.
    !> These functions are considered semi-private.
    !> There is rarely a good reason to call them directly.
    interface

        module subroutine pcg_step_abstract(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_type), intent(inout), target :: rng

        end subroutine pcg_step_abstract



        module subroutine pcg_step_8_mcg(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_8_type), intent(inout), target :: rng

        end subroutine pcg_step_8_mcg



        module subroutine pcg_step_8_oneseq(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_8_type), intent(inout), target :: rng

        end subroutine pcg_step_8_oneseq



        module subroutine pcg_step_8_setseq(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_8_type), intent(inout), target :: rng

        end subroutine pcg_step_8_setseq



        module subroutine pcg_step_8_unique(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_8_type), intent(inout), target :: rng

        end subroutine pcg_step_8_unique



        module subroutine pcg_step_16_mcg(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_16_type), intent(inout), target :: rng

        end subroutine pcg_step_16_mcg



        module subroutine pcg_step_16_oneseq(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_16_type), intent(inout), target :: rng

        end subroutine pcg_step_16_oneseq



        module subroutine pcg_step_16_setseq(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_16_type), intent(inout), target :: rng

        end subroutine pcg_step_16_setseq



        module subroutine pcg_step_16_unique(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_16_type), intent(inout), target :: rng

        end subroutine pcg_step_16_unique



        module subroutine pcg_step_32_mcg(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_32_type), intent(inout), target :: rng

        end subroutine pcg_step_32_mcg



        module subroutine pcg_step_32_oneseq(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_32_type), intent(inout), target :: rng

        end subroutine pcg_step_32_oneseq



        module subroutine pcg_step_32_setseq(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_32_type), intent(inout), target :: rng

        end subroutine pcg_step_32_setseq



        module subroutine pcg_step_32_unique(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_32_type), intent(inout), target :: rng

        end subroutine pcg_step_32_unique



        module subroutine pcg_step_64_mcg(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_mcg_64_type), intent(inout), target :: rng

        end subroutine pcg_step_64_mcg



        module subroutine pcg_step_64_oneseq(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_oneseq_64_type), intent(inout), target :: rng

        end subroutine pcg_step_64_oneseq



        module subroutine pcg_step_64_setseq(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_setseq_64_type), intent(inout), target :: rng

        end subroutine pcg_step_64_setseq



        module subroutine pcg_step_64_unique(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_unique_64_type), intent(inout), target :: rng

        end subroutine pcg_step_64_unique

    end interface



    !> Functions to advance the underlying LCG,
    !> one version for each size and each style.
    !> These functions are considered semi-private.
    !> There is rarely a good reason to call them directly.
    interface

        module subroutine pcg_step_for_seeding_8(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_8_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int8), intent(in) :: init_state

        end subroutine pcg_step_for_seeding_8



        module subroutine pcg_step_for_seeding_16(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_16_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int16), intent(in) :: init_state

        end subroutine pcg_step_for_seeding_16



        module subroutine pcg_step_for_seeding_32(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_32_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: init_state

        end subroutine pcg_step_for_seeding_32



        module subroutine pcg_step_for_seeding_64(rng, init_state)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_64_type), intent(inout) :: rng

            !> A dummy argument for this SUBROUTINE
            integer(int64), intent(in) :: init_state

        end subroutine pcg_step_for_seeding_64

    end interface



    !> Multi-step advance functions (jump-ahead, jump-back)
    !> The method used here is based on Brown,
    !> "Random Number Generation with Arbitrary Stride,",
    !> Transactions of the American Nuclear Society (Nov. 1994).
    !> The algorithm is very similar to fast exponentiation.
    !> Even though delta is an unsigned integer,
    !> we can pass a signed integer to go backwards,
    !> it just goes "the long way round".
    interface pcg_advance_lcg

        module pure elemental function pcg_advance_lcg_8(state, init_delta, init_cur_mult, init_cur_plus) result(pcg_lcg)

            !> A dummy argument for this FUNCTION
            integer(int8), intent(in) :: state

            !> A dummy argument for this FUNCTION
            integer(int8), intent(in) :: init_delta

            !> A dummy argument for this FUNCTION
            integer(int8), intent(in) :: init_cur_mult

            !> A dummy argument for this FUNCTION
            integer(int8), intent(in) :: init_cur_plus

            !> The return value of this FUNCTION
            integer(int8) :: pcg_lcg

        end function pcg_advance_lcg_8



        module pure elemental function pcg_advance_lcg_16(state, init_delta, init_cur_mult, init_cur_plus) result(pcg_lcg)

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: state

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: init_delta

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: init_cur_mult

            !> A dummy argument for this FUNCTION
            integer(int16), intent(in) :: init_cur_plus

            !> The return value of this FUNCTION
            integer(int16) :: pcg_lcg

        end function pcg_advance_lcg_16



        module pure elemental function pcg_advance_lcg_32(state, init_delta, init_cur_mult, init_cur_plus) result(pcg_lcg)

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: state

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: init_delta

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: init_cur_mult

            !> A dummy argument for this FUNCTION
            integer(int32), intent(in) :: init_cur_plus

            !> The return value of this FUNCTION
            integer(int32) :: pcg_lcg

        end function pcg_advance_lcg_32



        module pure elemental function pcg_advance_lcg_64(state, init_delta, init_cur_mult, init_cur_plus) result(pcg_lcg)

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: state

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: init_delta

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: init_cur_mult

            !> A dummy argument for this FUNCTION
            integer(int64), intent(in) :: init_cur_plus

            !> The return value of this FUNCTION
            integer(int64) :: pcg_lcg

        end function pcg_advance_lcg_64

    end interface pcg_advance_lcg



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

        !> A SUBROUTINE for a test: `pcg_*_*_advance_r`
        module subroutine test_pcg_advance
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_advance

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



        !> A SUBROUTINE for a test: `pcg_*_*_srandom_r`
        module subroutine test_pcg_seed(rng)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_type), intent(inout) :: rng

        end subroutine test_pcg_seed

        !> A SUBROUTINE for a test: `pcg_step_*_*`
        module subroutine test_pcg_step
        ! There is no dummy arugment for this SUBROUTINE
        end subroutine test_pcg_step

    end interface



    interface

        module subroutine generate_output_file_name(rng, file_name)

            !> A dummy argument for this SUBROUTINE
            class(pcg_state_type), intent(in) :: rng

            !> A dummy argument for this SUBROUTINE
            character(len=*), intent(inout) :: file_name

        end subroutine generate_output_file_name

    end interface

end module pcg_fortran
