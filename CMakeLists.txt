#
# This file was genared by ./proj2cmake and will be overwritten on it's next run!
# Please put all configurations in the cmake_conf/*.cmake files.
#

cmake_minimum_required(VERSION 3.25)

PROJECT(TronAddressGen)
# 指定工具链文件
set(CMAKE_TOOLCHAIN_FILE /root/TronAddressGen/vcpkg/scripts/buildsystems/vcpkg.cmake)
INCLUDE("${TronAddressGen_SOURCE_DIR}/cmake_conf/TronAddressGen.cmake")



INCLUDE("TronAddressGen.cmake")

ADD_EXECUTABLE(TronAddressGen
            ${TronAddressGen_SRC})

TARGET_LINK_LIBRARIES(TronAddressGen
            ${TronAddressGen_DEPS}
            ${TronAddressGen_ADDITIONAL_DEPS}
            ${SOLUTION_APP_DEPS}
            ${SOLUTION_GENERAL_DEPS})

