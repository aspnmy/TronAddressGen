#ifndef HPP_HELP
#define HPP_HELP

#include <string>

const std::string g_strHelp = R"(
用法: ./TronAddressGen [选项]

  帮助:
    --help              显示帮助信息

  带参数的模式:
    --matching          匹配输入、文件或单个地址。

  匹配配置:
    --prefix-count      最小前缀匹配数量,默认值为 0
    --suffix-count      最小后缀匹配数量,默认值为 6
    --quit-count        当生成的数量大于此值时退出程序,默认值为 0

  设备控制:
    --skip              跳过由索引给定的设备

  输出控制:
    --output            输出结果的文件
    --post              结果要发布到的 URL

示例:

  ./TronAddressGen --matching profanity.txt
  ./TronAddressGen --matching profanity.txt --skip 1
  ./TronAddressGen --matching profanity.txt --prefix-count 1 --suffix-count 8
  ./TronAddressGen --matching profanity.txt --prefix-count 1 --suffix-count 10 --quit-count 1
  ./TronAddressGen --matching profanity.txt --output result.txt
  ./TronAddressGen --matching profanity.txt --post http://127.0.0.1:9009/api
  ./TronAddressGen --matching TUqEg3dzVEJNQSVW2HY98z5X8SBdhmao8D --prefix-count 2 --suffix-count 4 --quit-count 1

关于:

  TronAddressGen 是一个用于 Tron 的虚荣地址生成器: https://tron.network/
  该软件基于以太坊 profanity 进行了修改: https://github.com/johguse/profanity

  TronAddressGen 分支 opencl_v3
  分支opencl_v3 是用opencl v3版本重构的版本

  [分支opencl_v3 交流 https://t.me/+vPb1g7us8HY3NzRl](https://t.me/+vPb1g7us8HY3NzRl)

  opencl_v3_x64分支是win系统,依赖项为depend/openCL/opencl_x64-windows

  opencl_v3_linux分支是linux系统,依赖项为depend/openCL/opencl_x64-linux

  opencl_v3_osx分支是Darwin系统,依赖项为depend/openCL/opencl_x64-osx

  cuda_x64 分支是专为N卡优化的业务

  本地业务数据准备地址 http://127.0.0.1:9009/api/address 此处保存计算得到的地址数据,使用的时候9009端口不要对外开放,

  米哈同学的miha_opencl_v2 本地调试地址是http://127.0.0.1:7002/api/address

FBI 警告:

  在使用生成的虚荣地址之前,请始终验证它是否与打印的私钥匹配。
  并始终对地址进行多重签名以确保账户安全。
)";
#endif /* HPP_HELP */