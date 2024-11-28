include(FetchContent)

set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)

if (BUILD_SHARED_LIBS)
    set(TARGET tbb)
    set(TBB_BUILD_STATIC OFF)
    set(TBB_BUILD_SHARED ON)
else()
    set(TARGET tbb_static)
    set(TBB_BUILD_STATIC ON)
    set(TBB_BUILD_SHARED OFF)
endif()

set(TBB_BUILD_TESTS OFF)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_DEBUG_POSTFIX _debug)
FetchContent_Declare(
    TBB
    URL "https://github.com/wjakob/tbb/archive/a0dc9bf76d0120f917b641ed095360448cabc85b.tar.gz"
    URL_HASH SHA256=0545cb6033bd1873fcae3ea304def720a380a88292726943ae3b9b207f322efe
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
)
FetchContent_MakeAvailable(TBB)

add_library(TBB::tbb ALIAS ${TARGET})
target_include_directories(
    ${TARGET} PUBLIC 
    ${tbb_SOURCE_DIR}/include
)