cmake_minimum_required(VERSION 3.8.0)

if(DEFINED ENV{VCPKG_ROOT} AND NOT DEFINED CMAKE_TOOLCHAIN_FILE)
  set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
      CACHE STRING "")
endif()

project(sqlite4java)

set(CMAKE_C_STANDARD 11)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

if(MSVC)
  set(CompilerFlags
          CMAKE_CXX_FLAGS
          CMAKE_CXX_FLAGS_DEBUG
          CMAKE_CXX_FLAGS_RELEASE
          CMAKE_CXX_FLAGS_MINSIZEREL
          CMAKE_CXX_FLAGS_RELWITHDEBINFO
          CMAKE_C_FLAGS
          CMAKE_C_FLAGS_DEBUG
          CMAKE_C_FLAGS_RELEASE
          CMAKE_C_FLAGS_MINSIZEREL
          CMAKE_C_FLAGS_RELWITHDEBINFO
          )
  foreach(CompilerFlag ${CompilerFlags})
      string(REPLACE "/MD" "/MT" ${CompilerFlag} "${${CompilerFlag}}")
      set(${CompilerFlag} "${${CompilerFlag}}" CACHE STRING "msvc compiler flags" FORCE)
  endforeach()
endif()

if(MSVC)
    add_definitions(-D_WIN32_WINNT=0x0601)
endif()

find_package(JNI REQUIRED)
find_package(sqlite3 CONFIG REQUIRED)

INCLUDE_DIRECTORIES(${JAVA_INCLUDE_PATH})
INCLUDE_DIRECTORIES(${JAVA_INCLUDE_PATH2})

file(GLOB_RECURSE SRC_FILES "native/*.h" "native/*.c" "swig/*.h" "swig/*.c")

add_library(sqlite4java SHARED ${SRC_FILES})

target_link_libraries(sqlite4java PRIVATE sqlite3)