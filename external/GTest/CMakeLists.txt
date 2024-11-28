include(FetchContent)

set(BUILD_GTEST OFF)
set(BUILD_GMOCK OFF)
FetchContent_Declare(
    GTest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG release-1.10.0
)
FetchContent_MakeAvailable(GTest)

add_library(GTest::GTest ALIAS GTest)