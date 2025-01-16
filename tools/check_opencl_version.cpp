#include <CL/cl.h>
#include <iostream>
#include <vector>

int main() {
    cl_uint numPlatforms;
    clGetPlatformIDs(0, nullptr, &numPlatforms);

    std::vector<cl_platform_id> platforms(numPlatforms);
    clGetPlatformIDs(numPlatforms, platforms.data(), nullptr);

    for (cl_uint i = 0; i < numPlatforms; ++i) {
        cl_platform_id platform = platforms[i];
        size_t size;
        clGetPlatformInfo(platform, CL_PLATFORM_VERSION, 0, nullptr, &size);
        std::vector<char> version(size);
        clGetPlatformInfo(platform, CL_PLATFORM_VERSION, size, version.data(), nullptr);
        std::cout << "平台 " << i << " 的版本信息: " << version.data() << std::endl;
    }

    return 0;
}