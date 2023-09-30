submodule (pcg_fortran) pcg_initialize_implementation

    implicit none



    integer(int8)  , parameter :: PCG_STATE_MCG_INITIALIZER_8     = int( Z'00000000000000e5', int8  )
    integer(int16) , parameter :: PCG_STATE_MCG_INITIALIZER_16    = int( Z'000000000000a5e5', int16 )
    integer(int32) , parameter :: PCG_STATE_MCG_INITIALIZER_32    = int( Z'00000000d15ea5e5', int32 )
    integer(int64) , parameter :: PCG_STATE_MCG_INITIALIZER_64    = int( Z'cafef00dd15ea5e5', int64 )

    integer(int8)  , parameter :: PCG_STATE_ONESEQ_INITIALIZER_8  = int( Z'00000000000000d7', int8  )
    integer(int16) , parameter :: PCG_STATE_ONESEQ_INITIALIZER_16 = int( Z'00000000000020df', int16 )
    integer(int32) , parameter :: PCG_STATE_ONESEQ_INITIALIZER_32 = int( Z'0000000046b56677', int32 )
    integer(int64) , parameter :: PCG_STATE_ONESEQ_INITIALIZER_64 = int( Z'4d595df4d0f33173', int64 )

    type(pcg_state_setseq_8_type), parameter :: PCG_STATE_SETSEQ_INITIALIZER_8 = &!
        pcg_state_setseq_8_type( &!
        &   state = int(Z'9b', int8) , &!
        &   inc   = int(Z'db', int8)   &!
        )

    type(pcg_state_setseq_16_type), parameter :: PCG_STATE_SETSEQ_INITIALIZER_16 = &!
        pcg_state_setseq_16_type( &!
        &   state = int(Z'e39b', int16) , &!
        &   inc   = int(Z'5bdb', int16)   &!
        )

    type(pcg_state_setseq_32_type), parameter :: PCG_STATE_SETSEQ_INITIALIZER_32 = &!
        pcg_state_setseq_32_type( &!
        &   state = int(Z'ec02d89b', int32) , &!
        &   inc   = int(Z'94b95bdb', int32)   &!
        )

    type(pcg_state_setseq_64_type), parameter :: PCG_STATE_SETSEQ_INITIALIZER_64 = &!
        pcg_state_setseq_64_type( &!
        &   state = int(Z'853c49e6748fea9b', int64) , &!
        &   inc   = int(Z'da3e39cb94b95bdb', int64)   &!
        )



    contains



    module procedure pcg_initialize_mcg_8     ; rng%state = PCG_STATE_MCG_INITIALIZER_8     ; end procedure
    module procedure pcg_initialize_mcg_16    ; rng%state = PCG_STATE_MCG_INITIALIZER_16    ; end procedure
    module procedure pcg_initialize_mcg_32    ; rng%state = PCG_STATE_MCG_INITIALIZER_32    ; end procedure
    module procedure pcg_initialize_mcg_64    ; rng%state = PCG_STATE_MCG_INITIALIZER_64    ; end procedure

    module procedure pcg_initialize_oneseq_8  ; rng%state = PCG_STATE_ONESEQ_INITIALIZER_8  ; end procedure
    module procedure pcg_initialize_oneseq_16 ; rng%state = PCG_STATE_ONESEQ_INITIALIZER_16 ; end procedure
    module procedure pcg_initialize_oneseq_32 ; rng%state = PCG_STATE_ONESEQ_INITIALIZER_32 ; end procedure
    module procedure pcg_initialize_oneseq_64 ; rng%state = PCG_STATE_ONESEQ_INITIALIZER_64 ; end procedure

    module procedure pcg_initialize_unique_8  ; rng%state = PCG_STATE_ONESEQ_INITIALIZER_8  ; end procedure
    module procedure pcg_initialize_unique_16 ; rng%state = PCG_STATE_ONESEQ_INITIALIZER_16 ; end procedure
    module procedure pcg_initialize_unique_32 ; rng%state = PCG_STATE_ONESEQ_INITIALIZER_32 ; end procedure
    module procedure pcg_initialize_unique_64 ; rng%state = PCG_STATE_ONESEQ_INITIALIZER_64 ; end procedure



    module procedure pcg_initialize_setseq_8
        rng%state = PCG_STATE_SETSEQ_INITIALIZER_8%state
        rng%inc   = PCG_STATE_SETSEQ_INITIALIZER_8%inc
    end procedure pcg_initialize_setseq_8



    module procedure pcg_initialize_setseq_16
        rng%state = PCG_STATE_SETSEQ_INITIALIZER_16%state
        rng%inc   = PCG_STATE_SETSEQ_INITIALIZER_16%inc
    end procedure pcg_initialize_setseq_16



    module procedure pcg_initialize_setseq_32
        rng%state = PCG_STATE_SETSEQ_INITIALIZER_32%state
        rng%inc   = PCG_STATE_SETSEQ_INITIALIZER_32%inc
    end procedure pcg_initialize_setseq_32



    module procedure pcg_initialize_setseq_64
        rng%state = PCG_STATE_SETSEQ_INITIALIZER_64%state
        rng%inc   = PCG_STATE_SETSEQ_INITIALIZER_64%inc
    end procedure pcg_initialize_setseq_64

end submodule pcg_initialize_implementation
