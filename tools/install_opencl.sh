#!/bin/bash

git_vcpkg(){
    git clone https://github.com/microsoft/vcpkg.git
    cd vcpkg
    
    # 禁用 vcpkg 遥测
    bash bootstrap-vcpkg.sh -disableMetrics

    install_opencl "$@"
}

install_opencl() {
    # 更新包列表并安装必要的软件包
    sudo apt-get update
    sudo apt-get install -y curl zip unzip tar pkg-config build-essential

    # 安装 vcpkg 并集成
    ./vcpkg integrate install

    # 提示用户如何在 CMake 项目中使用 vcpkg 工具链文件
    echo "已为此 vcpkg 根目录应用用户范围内的集成。"
    echo 'CMake 项目应使用:"-DCMAKE_TOOLCHAIN_FILE=/root/TronAddressGen/vcpkg/scripts/buildsystems/vcpkg.cmake"'

    # 检测平台并安装 OpenCL
    case "$1" in
        arm)
            ./vcpkg install opencl:arm64-linux
            ;;
        x64)
           export VCPKG_CMAKE_SYSTEM_NAME=Windows
           source ~/.bashrc
           ./vcpkg install opencl:x64-windows
           ;;    
        *)
            case "$(uname -s)" in
                Linux)
                    export VCPKG_CMAKE_SYSTEM_NAME=Linux
                    source ~/.bashrc
                    ./vcpkg install opencl:x64-linux
                    ;;
                Darwin)
                    ./vcpkg install opencl:x64-osx
                    ;;
                CYGWIN*|MINGW32*|MSYS*|MINGW*)
                    export VCPKG_CMAKE_SYSTEM_NAME=Windows
                    source ~/.bashrc
                    ./vcpkg install opencl:x64-windows
                    ;;
                *)
                    echo "未知平台:$(uname -s)"
                    exit 1
                    ;;
            esac
            ;;
    esac

    # 提示用户如何在 CMake 项目中使用 OpenCL
    echo "opencl 提供 CMake 目标:"
    echo ""
    echo "  find_package(OpenCL CONFIG REQUIRED)"
    echo ""
    echo "  # Khronos OpenCL ICD Loader"
    echo "  target_link_libraries(main PRIVATE OpenCL::OpenCL)"
    echo ""
    echo "  # Khronos OpenCL 头文件和 C++ 绑定"
    echo "  target_link_libraries(main PRIVATE OpenCL::Headers)"
    echo "  target_link_libraries(main PRIVATE OpenCL::HeadersCpp)"
    echo ""
    echo "  # OpenCL 实用程序库和 C++ 绑定"
    echo "  target_link_libraries(main PRIVATE OpenCL::Utils)"
    echo "  target_link_libraries(main PRIVATE OpenCL::UtilsCpp)"
    echo ""
    echo "opencl 提供 pkg-config 模块:"
    echo ""
    echo "  # Khronos OpenCL ICD Loader"
    echo "  OpenCL"
    echo ""
    echo "  # Khronos OpenCL 头文件和 C++ 绑定"
    echo "  OpenCL-Headers"
    echo "  OpenCL-CLHPP"
    echo ""
    echo "此软件包仅是 OpenCL SDK。要实际运行 OpenCL 代码，您还需要安装一个实现。"
    echo ""
    echo "  Windows:实现通常随您的 CPU/GPU 供应商的驱动程序一起提供。"
    echo "  Linux:实现可以从您的发行版仓库安装或手动安装。"
    echo "  Apple:请咨询您的发行版供应商了解 OpenCL 支持的状态:"
    echo "           https://support.apple.com/en-us/HT202823"
}

main (){
    git_vcpkg "$@"
}

main "$@"