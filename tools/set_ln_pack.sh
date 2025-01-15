#!/bin/bash
CURRENT_DIR=$(cd "$(dirname "$0")" || exit; pwd) # 当前脚本所在目录
PARENT_DIR=$(dirname "$CURRENT_DIR") # 当前脚本所在目录的上级目录

sudo ln -s   ${CURRENT_DIR}/install_opencl.sh ${PARENT_DIR}/install_opencl.sh

sudo ln -s   ${CURRENT_DIR}/my_triplets ${PARENT_DIR}/vcpkg/my_triplets

sudo ln -s   ${CURRENT_DIR}/vcpkg-configuration.json ${PARENT_DIR}/vcpkg/vcpkg-configuration.json