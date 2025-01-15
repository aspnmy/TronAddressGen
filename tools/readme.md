# 安装工具使用说明

## 工具链使用说明

- 先在项目根目录上 使用软链接命令，将install_opencl.sh 链接到根目录上

```bash
#!/bin/bash
CURRENT_DIR=$(cd "$(dirname "$0")" || exit; pwd) # 当前脚本所在目录
PARENT_DIR=$(dirname "$CURRENT_DIR") # 当前脚本所在目录的上级目录

sudo ln -s  ${PARENT_DIR}/install_opencl.sh ${CURRENT_DIR}/install_opencl.sh

```

- 然后在根目录上运行 install_opencl.sh

```bash

bash install_opencl.sh

```

- 等待opencl组件安装完成 按照提示 配置链接库


## 多平台交叉编译配置自定义 Triplet

- 然后使用软链接将本目录下的 自定义 Triplet 链接到vcpkg/下

```bash
#!/bin/bash
CURRENT_DIR=$(cd "$(dirname "$0")" || exit; pwd) # 当前脚本所在目录
PARENT_DIR=$(dirname "$CURRENT_DIR") # 当前脚本所在目录的上级目录

sudo ln -s  ${PARENT_DIR}/vcpkg/my_triplets ${CURRENT_DIR}/my_triplets

```

- 然后软链接配置文件

```bash
sudo ln -s   ${CURRENT_DIR}/vcpkg-configuration.json ${PARENT_DIR}/vcpkg/vcpkg/vcpkg-configuration.json

```

## 快速使用

- 直接在tools目录下运行,即可自动配置完成

```bash
bash set_ln_pack.sh

```