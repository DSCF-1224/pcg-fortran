submodule (pcg_fortran) pcg_support_implementation

    implicit none
    contains



    module procedure generate_output_file_name

        select type(rng)

            type is( pcg_state_mcg_8_type     ); file_name(1:) = 'mcg_8'
            type is( pcg_state_mcg_16_type    ); file_name(1:) = 'mcg_16'
            type is( pcg_state_mcg_32_type    ); file_name(1:) = 'mcg_32'
            type is( pcg_state_mcg_64_type    ); file_name(1:) = 'mcg_64'

            type is( pcg_state_oneseq_8_type  ); file_name(1:) = 'oneseq_8'
            type is( pcg_state_oneseq_16_type ); file_name(1:) = 'oneseq_16'
            type is( pcg_state_oneseq_32_type ); file_name(1:) = 'oneseq_32'
            type is( pcg_state_oneseq_64_type ); file_name(1:) = 'oneseq_64'

            type is( pcg_state_setseq_8_type  ); file_name(1:) = 'setseq_8'
            type is( pcg_state_setseq_16_type ); file_name(1:) = 'setseq_16'
            type is( pcg_state_setseq_32_type ); file_name(1:) = 'setseq_32'
            type is( pcg_state_setseq_64_type ); file_name(1:) = 'setseq_64'

            type is( pcg_state_unique_8_type  ); file_name(1:) = 'unique_8'
            type is( pcg_state_unique_16_type ); file_name(1:) = 'unique_16'
            type is( pcg_state_unique_32_type ); file_name(1:) = 'unique_32'
            type is( pcg_state_unique_64_type ); file_name(1:) = 'unique_64'

        end select

        file_name(1:) = './' // trim( file_name(1:) ) // '.dat'


    end procedure generate_output_file_name

end submodule pcg_support_implementation
