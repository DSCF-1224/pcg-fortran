# How to run (each command)
# $ ./reset_build.sh
# $ cd b*
# $ time cmake -DCMAKE_BUILD_TYPE=Debug/Relase ..
# $ time make ..
# $ time build/test.exe
# $ cd -
# $ ./exe_diff.sh

# How to run (1 line)
# $ ./reset_build.sh && cd b* && time cmake -DCMAKE_BUILD_TYPE=Debug .. && time make && time ./test.exe && cd - && ./exe_diff.sh
# $ ./reset_build.sh && cd b* && time cmake -DCMAKE_BUILD_TYPE=Release .. && time make && time ./test.exe && cd - && ./exe_diff.sh

cmake_minimum_required(VERSION 3.0)

enable_language(Fortran C)
project(test.exe Fortran)

set(CMAKE_C_COMPILER               "gcc")
set(CMAKE_Fortran_COMPILER         "gfortran")
set(CMAKE_Fortran_FLAGS            "-ffree-line-length-none -fimplicit-none -pedantic -std=f2008 -Wall -Werror -Wextra")
set(CMAKE_Fortran_FLAGS_DEBUG      "-fbacktrace -fbounds-check -g -O0")
set(CMAKE_Fortran_FLAGS_RELEASE    "-O2")
set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/fortran-modules)



include_directories(../../reference)



if (NOT (EXISTS ${CMAKE_Fortran_MODULE_DIRECTORY}/pcg_fortran))
    add_subdirectory(
		${CMAKE_CURRENT_SOURCE_DIR}/../../src
		${CMAKE_Fortran_MODULE_DIRECTORY}/pcg_fortran
	)
endif()



if (NOT (EXISTS ${CMAKE_Fortran_MODULE_DIRECTORY}/pcg_harvest))
    add_subdirectory(
		${CMAKE_CURRENT_SOURCE_DIR}/../pcg_harvest
		${CMAKE_Fortran_MODULE_DIRECTORY}/pcg_harvest
	)
endif()



add_executable(${PROJECT_NAME}
    ${CMAKE_CURRENT_SOURCE_DIR}/../../reference/pcg-advance-8.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../../reference/pcg-output-8.c
    ${CMAKE_CURRENT_SOURCE_DIR}/../../reference/pcg-rngs-8.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/pcg_c_interface.c
    ${CMAKE_CURRENT_SOURCE_DIR}/src/pcg_c_interface.f90
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.f90
)


target_link_libraries( ${PROJECT_NAME} PRIVATE _pcg_fortran_lib )
target_link_libraries( ${PROJECT_NAME} PRIVATE _pcg_harvest_lib )

# EOF
