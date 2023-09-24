submodule (pcg_harvest) allocate_fields_implementation

    use, intrinsic :: iso_fortran_env

    implicit none

    contains



    module procedure allocate_fields_int8

        associate( errmsg => harvest%errmsg )
        associate( stat   => harvest%stat   )

            allocate( harvest%c(harvest_size) , stat=stat, errmsg=errmsg )
            if ( .not. is_ok(stat) ) return

            allocate( harvest%fortran (harvest_size) , stat=stat, errmsg=errmsg )

        end associate
        end associate

    end procedure allocate_fields_int8



    module procedure allocate_fields_int16

        associate( errmsg => harvest%errmsg )
        associate( stat   => harvest%stat   )

            allocate( harvest%c(harvest_size) , stat=stat, errmsg=errmsg )
            if ( .not. is_ok(stat) ) return

            allocate( harvest%fortran (harvest_size) , stat=stat, errmsg=errmsg )

        end associate
        end associate

    end procedure allocate_fields_int16



    module procedure allocate_fields_int32

        associate( errmsg => harvest%errmsg )
        associate( stat   => harvest%stat   )

            allocate( harvest%c(harvest_size) , stat=stat, errmsg=errmsg )
            if ( .not. is_ok(stat) ) return

            allocate( harvest%fortran (harvest_size) , stat=stat, errmsg=errmsg )

        end associate
        end associate

    end procedure allocate_fields_int32



    module procedure allocate_fields_int64

        associate( errmsg => harvest%errmsg )
        associate( stat   => harvest%stat   )

            allocate( harvest%c(harvest_size) , stat=stat, errmsg=errmsg )
            if ( .not. is_ok(stat) ) return

            allocate( harvest%fortran (harvest_size) , stat=stat, errmsg=errmsg )

        end associate
        end associate

    end procedure allocate_fields_int64

end submodule allocate_fields_implementation
