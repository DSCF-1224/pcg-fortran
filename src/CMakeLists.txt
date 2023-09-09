add_library(
    _pcg_fortran_lib
    STATIC
    ${CMAKE_CURRENT_SOURCE_DIR}/pcg_fortran.f90
    ${CMAKE_CURRENT_SOURCE_DIR}/pcg_output_xsh_rs_implementation.f90
)
