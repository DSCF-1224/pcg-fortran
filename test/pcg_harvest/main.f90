module pcg_harvest

    use, intrinsic :: iso_fortran_env

    implicit none



    private
    public  :: pcg_harvest_int8_type
    public  :: pcg_harvest_int16_type
    public  :: pcg_harvest_int32_type
    public  :: pcg_harvest_int64_type



    type, abstract :: pcg_harvest_abstract_type

        !> A field of this TYPE
        !> retain the return value: `STAT`
        !> from `ALLOCATE` / `DEALLOCATE` statement
        integer, private ::stat

        !> A field of this TYPE
        !> retain the return value: `ERRMSG`
        !> from `ALLOCATE` / `DEALLOCATE` statement
        character(len=256), private :: errmsg

        contains

        procedure, private :: display_stat
        procedure, public  :: reallocate_fields

        procedure(   allocate_fields_abstract ), pass, private, deferred ::   allocate_fields
        procedure( deallocate_fields_abstract ), pass, private, deferred :: deallocate_fields

        procedure( is_equal_abstract ), pass, public, deferred :: is_equal

    end type pcg_harvest_abstract_type



    type, extends(pcg_harvest_abstract_type) :: pcg_harvest_int8_type

        integer(int8), allocatable, public, dimension(:) :: c
        integer(int8), allocatable, public, dimension(:) :: fortran

        contains

        procedure, private ::   allocate_fields =>   allocate_fields_int8
        procedure, private :: deallocate_fields => deallocate_fields_int8

        procedure, public  :: is_equal          => is_equal_int8

    end type pcg_harvest_int8_type



    type, extends(pcg_harvest_abstract_type) :: pcg_harvest_int16_type

        integer(int16), allocatable, public, dimension(:) :: c
        integer(int16), allocatable, public, dimension(:) :: fortran

        contains

        procedure, private ::   allocate_fields =>   allocate_fields_int16
        procedure, private :: deallocate_fields => deallocate_fields_int16

        procedure, public  :: is_equal          => is_equal_int16

    end type pcg_harvest_int16_type



    type, extends(pcg_harvest_abstract_type) :: pcg_harvest_int32_type

        integer(int32), allocatable, public, dimension(:) :: c
        integer(int32), allocatable, public, dimension(:) :: fortran

        contains

        procedure, private ::   allocate_fields =>   allocate_fields_int32
        procedure, private :: deallocate_fields => deallocate_fields_int32

        procedure, public  :: is_equal          => is_equal_int32

    end type pcg_harvest_int32_type



    type, extends(pcg_harvest_abstract_type) :: pcg_harvest_int64_type

        integer(int64), allocatable, public, dimension(:) :: c
        integer(int64), allocatable, public, dimension(:) :: fortran

        contains

        procedure, private ::   allocate_fields =>   allocate_fields_int64
        procedure, private :: deallocate_fields => deallocate_fields_int64

        procedure, public  :: is_equal          => is_equal_int64

    end type pcg_harvest_int64_type



    !> A PARAMETER for this MODULE
    !> `ALLOCATE` / `DEALLOCATE` returns this value
    !> if the statement had executed successfully
    integer, private, parameter :: STAT_OK = 0



    interface

        module pure elemental function is_equal_abstract(harvest) result(is_equal)

            !> A dummy argument for this FUNCTION
            class(pcg_harvest_abstract_type), intent(in) :: harvest

            !> The return value of this FUNCTION
            logical :: is_equal

        end function is_equal_abstract



        module pure elemental function is_equal_int8(harvest) result(is_equal)

            !> A dummy argument for this FUNCTION
            class(pcg_harvest_int8_type), intent(in) :: harvest

            !> The return value of this FUNCTION
            logical :: is_equal

        end function is_equal_int8



        module pure elemental function is_equal_int16(harvest) result(is_equal)

            !> A dummy argument for this FUNCTION
            class(pcg_harvest_int16_type), intent(in) :: harvest

            !> The return value of this FUNCTION
            logical :: is_equal

        end function is_equal_int16



        module pure elemental function is_equal_int32(harvest) result(is_equal)

            !> A dummy argument for this FUNCTION
            class(pcg_harvest_int32_type), intent(in) :: harvest

            !> The return value of this FUNCTION
            logical :: is_equal

        end function is_equal_int32



        module pure elemental function is_equal_int64(harvest) result(is_equal)

            !> A dummy argument for this FUNCTION
            class(pcg_harvest_int64_type), intent(in) :: harvest

            !> The return value of this FUNCTION
            logical :: is_equal

        end function is_equal_int64

    end interface



    interface

        module pure elemental function is_ok(stat)

            !> A dummy argument for this FUNCTION
            integer, intent(in) :: stat

            !> The return value of this FUNCTION
            logical :: is_ok

        end function is_ok
        
    end interface



    interface

        module subroutine allocate_fields_abstract(harvest, harvest_size)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_abstract_type), intent(inout) :: harvest

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: harvest_size

        end subroutine allocate_fields_abstract



        module subroutine allocate_fields_int8(harvest, harvest_size)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_int8_type), intent(inout) :: harvest

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: harvest_size

        end subroutine allocate_fields_int8



        module subroutine allocate_fields_int16(harvest, harvest_size)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_int16_type), intent(inout) :: harvest

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: harvest_size

        end subroutine allocate_fields_int16



        module subroutine allocate_fields_int32(harvest, harvest_size)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_int32_type), intent(inout) :: harvest

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: harvest_size

        end subroutine allocate_fields_int32



        module subroutine allocate_fields_int64(harvest, harvest_size)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_int64_type), intent(inout) :: harvest

            !> A dummy argument for this SUBROUTINE
            integer(int32), intent(in) :: harvest_size

        end subroutine allocate_fields_int64

    end interface



    interface

        module subroutine deallocate_fields_abstract(harvest)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_abstract_type), intent(inout) :: harvest

        end subroutine deallocate_fields_abstract



        module subroutine deallocate_fields_int8(harvest)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_int8_type), intent(inout) :: harvest

        end subroutine deallocate_fields_int8



        module subroutine deallocate_fields_int16(harvest)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_int16_type), intent(inout) :: harvest

        end subroutine deallocate_fields_int16



        module subroutine deallocate_fields_int32(harvest)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_int32_type), intent(inout) :: harvest

        end subroutine deallocate_fields_int32



        module subroutine deallocate_fields_int64(harvest)

            !> A dummy argument for this SUBROUTINE
            class(pcg_harvest_int64_type), intent(inout) :: harvest

        end subroutine deallocate_fields_int64

    end interface



    contains



    subroutine display_stat(harvest)

        !> A dummy argument for this SUBROUTINE
        class(pcg_harvest_abstract_type), intent(in) :: harvest

        write( unit=error_unit, fmt='("stat   :",1X,I0)' )      harvest%stat
        write( unit=error_unit, fmt='("errmsg :",1X,A )' ) trim(harvest%errmsg)

    end subroutine display_stat



    subroutine reallocate_fields(harvest, harvest_size)

        !> A dummy argument for this SUBROUTINE
        class(pcg_harvest_abstract_type), intent(inout) :: harvest

        !> A dummy argument for this SUBROUTINE
        integer(int32), intent(in) :: harvest_size



        call harvest%deallocate_fields()

        if ( .not. is_ok(harvest%stat) ) then
            call harvest%display_stat()
            error stop
        end if



        call harvest%allocate_fields(harvest_size)

        if ( .not. is_ok(harvest%stat) ) then
            call harvest%display_stat()
            error stop
        end if

    end subroutine reallocate_fields

end module pcg_harvest
