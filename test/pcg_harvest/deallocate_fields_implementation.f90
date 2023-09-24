submodule (pcg_harvest) deallocate_fields_implementation

    use, intrinsic :: iso_fortran_env

    implicit none

    contains



    module procedure deallocate_fields_int8

        associate( errmsg => harvest%errmsg )
        associate( stat   => harvest%stat   )

            if ( allocated(harvest%c) ) then
                deallocate(harvest%c, stat=stat, errmsg=errmsg)
                if ( .not. is_ok(stat) ) return
            end if
    
            if ( allocated(harvest%fortran) ) then
                deallocate(harvest%fortran, stat=stat, errmsg=errmsg)
            end if

        end associate
        end associate

    end procedure deallocate_fields_int8




    module procedure deallocate_fields_int16

        associate( errmsg => harvest%errmsg )
        associate( stat   => harvest%stat   )

            if ( allocated(harvest%c) ) then
                deallocate(harvest%c, stat=stat, errmsg=errmsg)
                if ( .not. is_ok(stat) ) return
            end if
    
            if ( allocated(harvest%fortran) ) then
                deallocate(harvest%fortran, stat=stat, errmsg=errmsg)
            end if

        end associate
        end associate

    end procedure deallocate_fields_int16



    module procedure deallocate_fields_int32

        associate( errmsg => harvest%errmsg )
        associate( stat   => harvest%stat   )

            if ( allocated(harvest%c) ) then
                deallocate(harvest%c, stat=stat, errmsg=errmsg)
                if ( .not. is_ok(stat) ) return
            end if
    
            if ( allocated(harvest%fortran) ) then
                deallocate(harvest%fortran, stat=stat, errmsg=errmsg)
            end if

        end associate
        end associate

    end procedure deallocate_fields_int32



    module procedure deallocate_fields_int64

        associate( errmsg => harvest%errmsg )
        associate( stat   => harvest%stat   )

            if ( allocated(harvest%c) ) then
                deallocate(harvest%c, stat=stat, errmsg=errmsg)
                if ( .not. is_ok(stat) ) return
            end if
    
            if ( allocated(harvest%fortran) ) then
                deallocate(harvest%fortran, stat=stat, errmsg=errmsg)
            end if

        end associate
        end associate

    end procedure deallocate_fields_int64



end submodule deallocate_fields_implementation
