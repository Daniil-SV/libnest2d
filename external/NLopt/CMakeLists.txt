include(FetchContent)

set(NLOPT_PYTHON OFF)
set(NLOPT_OCTAVE OFF)
set(NLOPT_MATLAB OFF)
set(NLOPT_GUILE OFF)
set(NLOPT_SWIG OFF)
set(NLOPT_TESTS OFF)
FetchContent_Declare(
    NLopt
    GIT_REPOSITORY https://github.com/stevengj/nlopt.git
    GIT_TAG v2.9.1
)
FetchContent_MakeAvailable(NLopt)

add_library(NLopt::nlopt ALIAS nlopt)