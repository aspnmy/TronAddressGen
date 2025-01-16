#
# This file was genared by ./proj2cmake and will be overwritten on it's next run!
# Please put all configurations in the cmake_conf/*.cmake files.
#

cmake_minimum_required(VERSION 3.0)

PROJECT(TronAddressGen)
# 设置 OpenCL 版本
add_definitions(-DCL_TARGET_OPENCL_VERSION=300)
# 设置构建类型
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Choose the type of build, options are: Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif()
# 按平台配置工具链
if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
# 使用相对位置 兼容性更好
    set(CMAKE_TOOLCHAIN_FILE "vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE FILEPATH "Toolchain file" FORCE)
endif()

INCLUDE("${TronAddressGen_SOURCE_DIR}/cmake_conf/TronAddressGen.cmake")

INCLUDE("TronAddressGen.cmake")

ADD_EXECUTABLE(TronAddressGen
            ${TronAddressGen_SRC})
# 使用相对位置 兼容性更好
set(OpenCL_INCLUDE_DIR "depend/openCL/opencl_x64-linux/include")
set(OpenCL_LIBRARY_DIR "depend/openCL/opencl_x64-linux/lib")

# 输出调试信息
message(STATUS "OpenCL include directory: ${OpenCL_INCLUDE_DIR}")
message(STATUS "OpenCL library directory: ${OpenCL_LIBRARY_DIR}")

include_directories(${OpenCL_INCLUDE_DIR})
link_directories(${OpenCL_LIBRARY_DIR})

TARGET_LINK_LIBRARIES(TronAddressGen
            ${TronAddressGen_DEPS}
            ${TronAddressGen_ADDITIONAL_DEPS}
            ${SOLUTION_APP_DEPS}
            ${SOLUTION_GENERAL_DEPS}
            OpenCL
)