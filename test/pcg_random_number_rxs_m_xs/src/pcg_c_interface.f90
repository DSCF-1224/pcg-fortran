module pcg_c_interface

    use, intrinsic :: iso_c_binding, only: c_int8_t, c_int16_t, c_int32_t

    implicit none

    private

    public  :: pcg_oneseq_8_rxs_m_xs_8_random_r_by_c
    public  :: pcg_setseq_8_rxs_m_xs_8_random_r_by_c

    public  :: pcg_oneseq_16_rxs_m_xs_16_random_r_by_c
    public  :: pcg_setseq_16_rxs_m_xs_16_random_r_by_c
    public  :: pcg_unique_16_rxs_m_xs_16_random_r_by_c

    public  :: pcg_oneseq_32_rxs_m_xs_32_random_r_by_c
    public  :: pcg_setseq_32_rxs_m_xs_32_random_r_by_c
    public  :: pcg_unique_32_rxs_m_xs_32_random_r_by_c



    interface

        subroutine pcg_oneseq_8_rxs_m_xs_8_random_r_core(harvest_size, harvest) bind(C, name="signed_pcg_oneseq_8_rxs_m_xs_8_random_r")

            use, intrinsic :: iso_c_binding, only: c_int8_t, c_int32_t

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(in), value :: harvest_size

            !> A dummy argument for this SUBROUTINE
            integer(c_int8_t), intent(inout) :: harvest(harvest_size)

        end subroutine pcg_oneseq_8_rxs_m_xs_8_random_r_core



        subroutine pcg_setseq_8_rxs_m_xs_8_random_r_core(harvest_size, harvest) bind(C, name="signed_pcg_setseq_8_rxs_m_xs_8_random_r")

            use, intrinsic :: iso_c_binding, only: c_int8_t, c_int32_t

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(in), value :: harvest_size

            !> A dummy argument for this SUBROUTINE
            integer(c_int8_t), intent(inout) :: harvest(harvest_size)

        end subroutine pcg_setseq_8_rxs_m_xs_8_random_r_core

    end interface



    interface

        subroutine pcg_oneseq_16_rxs_m_xs_16_random_r_core(harvest_size, harvest) bind(C, name="signed_pcg_oneseq_16_rxs_m_xs_16_random_r")

            use, intrinsic :: iso_c_binding, only: c_int16_t, c_int32_t

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(in), value :: harvest_size

            !> A dummy argument for this SUBROUTINE
            integer(c_int16_t), intent(inout) :: harvest(harvest_size)

        end subroutine pcg_oneseq_16_rxs_m_xs_16_random_r_core



        subroutine pcg_setseq_16_rxs_m_xs_16_random_r_core(harvest_size, harvest) bind(C, name="signed_pcg_setseq_16_rxs_m_xs_16_random_r")

            use, intrinsic :: iso_c_binding, only: c_int16_t, c_int32_t

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(in), value :: harvest_size

            !> A dummy argument for this SUBROUTINE
            integer(c_int16_t), intent(inout) :: harvest(harvest_size)

        end subroutine pcg_setseq_16_rxs_m_xs_16_random_r_core



        subroutine pcg_unique_16_rxs_m_xs_16_random_r_core(harvest_size, harvest) bind(C, name="signed_pcg_unique_16_rxs_m_xs_16_random_r")

            use, intrinsic :: iso_c_binding, only: c_int16_t, c_int32_t

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(in), value :: harvest_size

            !> A dummy argument for this SUBROUTINE
            integer(c_int16_t), intent(inout) :: harvest(harvest_size)

        end subroutine pcg_unique_16_rxs_m_xs_16_random_r_core

    end interface



    interface

        subroutine pcg_oneseq_32_rxs_m_xs_32_random_r_core(harvest_size, harvest) bind(C, name="signed_pcg_oneseq_32_rxs_m_xs_32_random_r")

            use, intrinsic :: iso_c_binding, only: c_int32_t, c_int32_t

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(in), value :: harvest_size

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(inout) :: harvest(harvest_size)

        end subroutine pcg_oneseq_32_rxs_m_xs_32_random_r_core



        subroutine pcg_setseq_32_rxs_m_xs_32_random_r_core(harvest_size, harvest) bind(C, name="signed_pcg_setseq_32_rxs_m_xs_32_random_r")

            use, intrinsic :: iso_c_binding, only: c_int32_t, c_int32_t

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(in), value :: harvest_size

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(inout) :: harvest(harvest_size)

        end subroutine pcg_setseq_32_rxs_m_xs_32_random_r_core



        subroutine pcg_unique_32_rxs_m_xs_32_random_r_core(harvest_size, harvest) bind(C, name="signed_pcg_unique_32_rxs_m_xs_32_random_r")

            use, intrinsic :: iso_c_binding, only: c_int32_t, c_int32_t

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(in), value :: harvest_size

            !> A dummy argument for this SUBROUTINE
            integer(c_int32_t), intent(inout) :: harvest(harvest_size)

        end subroutine pcg_unique_32_rxs_m_xs_32_random_r_core

    end interface



    contains



    subroutine pcg_oneseq_8_rxs_m_xs_8_random_r_by_c(harvest_size, harvest)

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(in), value :: harvest_size

        !> A dummy argument for this SUBROUTINE
        integer(c_int8_t), intent(inout) :: harvest(harvest_size)

        call pcg_oneseq_8_rxs_m_xs_8_random_r_core( harvest_size, harvest(:) )

    end subroutine pcg_oneseq_8_rxs_m_xs_8_random_r_by_c



    subroutine pcg_setseq_8_rxs_m_xs_8_random_r_by_c(harvest_size, harvest)

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(in), value :: harvest_size

        !> A dummy argument for this SUBROUTINE
        integer(c_int8_t), intent(inout) :: harvest(harvest_size)

        call pcg_setseq_8_rxs_m_xs_8_random_r_core( harvest_size, harvest(:) )

    end subroutine pcg_setseq_8_rxs_m_xs_8_random_r_by_c



    subroutine pcg_oneseq_16_rxs_m_xs_16_random_r_by_c(harvest_size, harvest)

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(in), value :: harvest_size

        !> A dummy argument for this SUBROUTINE
        integer(c_int16_t), intent(inout) :: harvest(harvest_size)

        call pcg_oneseq_16_rxs_m_xs_16_random_r_core( harvest_size, harvest(:) )

    end subroutine pcg_oneseq_16_rxs_m_xs_16_random_r_by_c



    subroutine pcg_setseq_16_rxs_m_xs_16_random_r_by_c(harvest_size, harvest)

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(in), value :: harvest_size

        !> A dummy argument for this SUBROUTINE
        integer(c_int16_t), intent(inout) :: harvest(harvest_size)

        call pcg_setseq_16_rxs_m_xs_16_random_r_core( harvest_size, harvest(:) )

    end subroutine pcg_setseq_16_rxs_m_xs_16_random_r_by_c



    subroutine pcg_unique_16_rxs_m_xs_16_random_r_by_c(harvest_size, harvest)

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(in), value :: harvest_size

        !> A dummy argument for this SUBROUTINE
        integer(c_int16_t), intent(inout) :: harvest(harvest_size)

        call pcg_unique_16_rxs_m_xs_16_random_r_core( harvest_size, harvest(:) )

    end subroutine pcg_unique_16_rxs_m_xs_16_random_r_by_c



    subroutine pcg_oneseq_32_rxs_m_xs_32_random_r_by_c(harvest_size, harvest)

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(in), value :: harvest_size

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(inout) :: harvest(harvest_size)

        call pcg_oneseq_32_rxs_m_xs_32_random_r_core( harvest_size, harvest(:) )

    end subroutine pcg_oneseq_32_rxs_m_xs_32_random_r_by_c



    subroutine pcg_setseq_32_rxs_m_xs_32_random_r_by_c(harvest_size, harvest)

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(in), value :: harvest_size

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(inout) :: harvest(harvest_size)

        call pcg_setseq_32_rxs_m_xs_32_random_r_core( harvest_size, harvest(:) )

    end subroutine pcg_setseq_32_rxs_m_xs_32_random_r_by_c



    subroutine pcg_unique_32_rxs_m_xs_32_random_r_by_c(harvest_size, harvest)

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(in), value :: harvest_size

        !> A dummy argument for this SUBROUTINE
        integer(c_int32_t), intent(inout) :: harvest(harvest_size)

        call pcg_unique_32_rxs_m_xs_32_random_r_core( harvest_size, harvest(:) )

    end subroutine pcg_unique_32_rxs_m_xs_32_random_r_by_c

end module pcg_c_interface
