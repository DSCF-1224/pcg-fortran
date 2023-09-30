submodule (pcg_fortran) pcg_seed_setseq_implementation

    implicit none
    contains



    module procedure pcg_seed_8_setseq
        rng%state = 0_int8
        rng%inc   = ior(shiftl(init_seq, 1), 1_int8)
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_8_setseq



    module procedure pcg_seed_16_setseq
        rng%state = 0_int16
        rng%inc   = ior(shiftl(init_seq, 1), 1_int16)
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_16_setseq



    module procedure pcg_seed_32_setseq
        rng%state = 0_int32
        rng%inc   = ior(shiftl(init_seq, 1), 1_int32)
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_32_setseq



    module procedure pcg_seed_64_setseq
        rng%state = 0_int64
        rng%inc   = ior(shiftl(init_seq, 1), 1_int64)
        call rng%step_for_seeding(init_state)
    end procedure pcg_seed_64_setseq

end submodule pcg_seed_setseq_implementation
