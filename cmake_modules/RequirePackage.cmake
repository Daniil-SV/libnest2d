
set(RP_REPOSITORY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external CACHE STRING "Package repository location")
set(RP_BINARY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external CACHE STRING "Package repository location")

macro(require_package RP_ARGS_PACKAGE)    
    set(options REQUIRED QUIET)
    set(oneValueArgs "VERSION")
    set(multiValueArgs "")
    cmake_parse_arguments(RP_ARGS 
        "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(NOT RP_FORCE_DOWNLOADING)
        find_package(${RP_ARGS_PACKAGE} ${RP_ARGS_VERSION} QUIET ${RP_ARGS_UNPARSED_ARGUMENTS})
    endif()
    
    if(NOT ${RP_ARGS_PACKAGE}_FOUND)
        message("Downloading ${RP_ARGS_PACKAGE} using FetchContent...")
        add_subdirectory(${RP_REPOSITORY_DIR}/${RP_ARGS_PACKAGE} ${RP_ARGS_PACKAGE}) 
        # download_package(${RP_ARGS_PACKAGE} ${RP_ARGS_VERSION} ${_QUIET} ${_REQUIRED} ${RP_ARGS_UNPARSED_ARGUMENTS} )
    endif()
    
endmacro()
