cmake_minimum_required(VERSION 3.14)  #Version number
project(google_pkg_test_all)  #Project name

if (NOT (DEFINED ARCH_PLAT_VENDOR))
    # default for linux
    set(ARCH_PLAT_VENDOR x86_64-ubuntu-linux-gcc9.3.0)
endif ()

if (DEFINED SOFTWARE_VERSION)
    add_definitions(-DSOFTWARE_VERSION="${SOFTWARE_VERSION}")
endif ()
if (DEFINED COMPILE_PERSON)
    add_definitions(-DCOMPILE_PERSON="${COMPILE_PERSON}")
endif ()

message("config types: ${CMAKE_CONFIGURATION_TYPES}")
# default use cxx11
set(CXX_STD "11" CACHE STRING "C++ standard")
set(CPLUSPLUS_VER "c++${CXX_STD}")

set(CMAKE_CXX_STANDARD ${CXX_STD})
set(CMAKE_CXX_FLAGS_DEBUG "-fPIC -O0 -g -Wall")
set(CMAKE_CXX_FLAGS_RELEASE "-fPIC -O2 -Wall")
set(CMAKE_POSITION_INDEPENDENT_CODE true)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=${CPLUSPLUS_VER} -fPIC -fno-omit-frame-pointer")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")

if (ENABLE_ASAN)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fsanitize=address -fsanitize-recover=address -lasan")
endif ()

if (${CMAKE_BUILD_TYPE} MATCHES "Debug")
    message(STATUS "CMAKE_BUILD_TYPE Debug")
    set(CMAKE_BUILD_TYPE Debug)
endif ()

# include third party lib
if (${ARCH_PLAT_VENDOR} MATCHES "x86_64-ubuntu-linux-gcc9.3.0")
    message(STATUS "BUILD_TYPE: x86_64-ubuntu-linux-gcc9.3.0")
endif ()
if (${ARCH_PLAT_VENDOR} MATCHES "aarch64-ubuntu-linux-gcc7.5.0")
    message(STATUS "BUILD_TYPE: aarch64-ubuntu-linux-gcc7.5.0")
endif ()

if (NOT (DEFINED BUILD_INFO_STR))
    set(BUILD_INFO_STR none)
endif ()
add_definitions(-DBUILD_INFO_STR="${BUILD_INFO_STR}")
message(STATUS "*** build info str: ${BUILD_INFO_STR} ***")

# add module files extern_dep.cmake
# this file will get all the dependencies
include(extern_dep.cmake)

# add a source directory
add_subdirectory(src)