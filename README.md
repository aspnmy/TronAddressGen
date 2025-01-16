# TronAddressGen 分支 opencl_v3

- 分支opencl_v3 是用opencl v3版本重构的版本

-  [分支opencl_v3 交流 https://t.me/+vPb1g7us8HY3NzRl](https://t.me/+vPb1g7us8HY3NzRl)

- opencl_v3_x64分支是win系统，依赖项为depend/openCL/opencl_x64-windows

- opencl_v3_linux分支是linux系统，依赖项为depend/openCL/opencl_x64-linux

- opencl_v3_osx分支是Darwin系统，依赖项为depend/openCL/opencl_x64-osx


## 分支 opencl_v3 安装工具使用说明



### 快速使用opencl_v3工具链

- 直接在tools目录下运行,即可自动配置完成

```bash
bash set_ln_pack.sh

```

### 手动配置opencl_v3工具链

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


### 多平台交叉编译配置自定义 Triplet

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
### 分支 opencl_v3 做了啥

- [✔] 分支 opencl_v3重新用2024年v3的代码重构
- [✔] 分支 opencl_v3支持多平台交叉编译，可以编译成x64_x86、linux、arm、arm64、苹果系统
- [✔] 分支 opencl_v3 支持webUI方式读取数据
- [✔] 分支 opencl_v3 支持以数据库的形式存取数据

### 如何自己编译 分支 opencl_v3

- 分支 opencl_v3 是直接使用cmake进行交叉编译的，使用install_opencl.sh脚本安装以后构建cmake文件可以一次性编译所有版本的程序

- 推荐使用debian v12.7进行编译



## TronAddressGen 分支 miha_opencl_v2

- 克隆自作者米哈
- 作者 米哈( [@MrMiHa](https://t.me/MrMiHa) )是一个苦逼程序员，不是煤场奴工，有问题别太理直气壮的跑来下命令。
- 讨论群组是 : https://t.me/DeveloperTeamGroup 欢迎加入后玩耍
- 随意Fork，记得保留`关于`的内容。
- 感谢 `profanity-tron` 原作者。
![image](https://github.com/user-attachments/assets/954ff206-c121-45ea-bdc1-813536402516)


### 分支 miha_opencl_v2 做了啥

- [x] 移除了一些网络相关的代码
- [x] 重新从官方编译生成了OpenCL
- [x] 重制了一个干净的VS2022的工程
- [x] 准备做点汉化



### 为啥做

群里有人又傻乎乎的找某站买了工具。

辛苦跑了几天，美滋滋的用起来了10位8靓号。

一段时间，都没啥问题

直到，他的账号超过了10kU



### 如何自己编译 miha_opencl_v2

1. 下载一个visual studio 2022 ，社区版就行
2. 双击SLN文件
3. 切换编译目标为 Release
4. 生成
5. 代码目录下的x64目录内，release下，会有一个 `TronAddressGen.exe` 
6. 在命令行下，执行 `TronAddressGen.exe --help` 查看帮助。是的，别傻BB的双击。科普计算机基础操作，从我做起
7. 跑吧

```
D:\WorkSpace\TronAddressGen\x64\Release>TronAddressGen.exe --matching TUvvo588wF97jjiBb1Hsqao2ZfhdMrMiHa --suffix-count 6 --quit-count 10
Devices:
  GPU-0: NVIDIA GeForce RTX 2080 Ti, 23621992448 bytes available, 68 compute units (precompiled = yes)

OpenCL:
  Context creating ...Done
  Binary kernel loading...Done
  Program building ...Done

Initializing:
  Should be no longer than 1 minute...
  GPU-0 initialized ...Done
  Initialization time: 2 seconds

Running...
  Before using a generated vanigity address, always verify that it matches the printed private key.
  Please make sure the program you are running is download from: https://github.com/GG4mida/profanity-tron
  And always multi-sign the address to ensure account security.

  Time:    84s Private: bcf1df97e951d2f086f79c31053b90dacd428a10c9c2cbe718ffbe3759b9564d Address:TXdaW81a6xm96DrM5uL2DkBWCL6pMrMiHa
  Time:   170s Private: bcf1df97e922b4e986f79c31053b90dacd428a10c9c2cbe718ffbe3759b96371 Address:TGzBHMukoFRY8c12ZRCHbnNhStQ7MrMiHa
  Time:   236s Private: bcf1df97e91f5e6686f79c31053b90dacd428a10c9c2cbe718ffbe3759b96d7c Address:TGi5GpXjmSLe6e8JgawGV4KrxzV3MrMiHa
  Time:   366s Private: bcf1df97e91f230a86f79c31053b90dacd428a10c9c2cbe718ffbe3759b9815c Address:TXdNGuaFm8pyBwP56tEimgWxgpaNMrMiHa
  Time:   444s Private: bcf1df97e93cc15b86f79c31053b90dacd428a10c9c2cbe718ffbe3759b98d56 Address:TAUihyLBvdBwCKUrGdJuN6z1jbQ1MrMiHa
^Ctal: 164.891 MH/s - GPU0: 164.891 MH/s
```

## 参考资料：

- [如何编译opencl](https://vcpkg.link/ports/opencl)





