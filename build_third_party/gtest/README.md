

# 编译安装gtest库
## 一. 概要
Google Test，通常称为gtest
由Google开发的开源C++测试框架
用于编写和运行测试用例
支持多种测试类型，包括单元测试、性能测试以及可选项参数化测试。
## 二. 功能
gtest的一些主要特点：
自动化：允许自动化测试，可以轻松地集成到持续集成/持续部署（CI/CD）流程中。
断言库：提供丰富的断言宏，用于验证测试用例的预期结果。
测试过滤：允许运行特定的测试集合，或者排除某些测试。
自动化测试输出：生成的测试结果可以被机器解析，方便自动化处理。
线程安全：设计为线程安全，可以在多线程环境中使用。
丰富的测试类型：支持各种测试类型，包括但不限于典型单元测试和死亡测试（death test）。
参数化测试：允许用参数化的方式编写测试，可以为一个测试用例提供多种输入。

地位
Google Test 在C++测试领域占有重要地位，它是最流行的C++测试框架之一。由于以下原因，gtest 被广泛采用：

由Google开发：作为由Google维护的开源项目，它具有较高的可信度和社区支持。
易于使用：gtest 的API设计简洁直观，易于学习和使用。
跨平台：支持多种操作系统，包括Windows、Linux和macOS。
与构建系统兼容：可以与多种构建系统（如Make、CMake等）无缝集成。

## 三. 编译
[代码仓库](https://github.com/google/googletest) 
### 1. 下载源码
```shell
git clone -b release-1.10.0 https://github.com/google/googletest.git
# 或者直接在页面下载
```
### 2. 编译
```shell
cd googletest
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX="./output" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON ..
make -j8 && make install
```
### 3. 产出包结构
```
xxx@xxx:~/Dev/git/googletest/build_x86_ubuntu$ tree output/
output/
├── include
│   ├── gmock
│   │   ├── gmock-actions.h
│   │   ├── gmock-cardinalities.h
│   │   ├── gmock-function-mocker.h
│   │   ├── gmock-generated-actions.h
│   │   ├── gmock-generated-actions.h.pump
│   │   ├── gmock-generated-function-mockers.h
│   │   ├── gmock-generated-function-mockers.h.pump
│   │   ├── gmock-generated-matchers.h
│   │   ├── gmock-generated-matchers.h.pump
│   │   ├── gmock.h
│   │   ├── gmock-matchers.h
│   │   ├── gmock-more-actions.h
│   │   ├── gmock-more-matchers.h
│   │   ├── gmock-nice-strict.h
│   │   ├── gmock-spec-builders.h
│   │   └── internal
│   │       ├── custom
│   │       │   ├── gmock-generated-actions.h
│   │       │   ├── gmock-generated-actions.h.pump
│   │       │   ├── gmock-matchers.h
│   │       │   ├── gmock-port.h
│   │       │   └── README.md
│   │       ├── gmock-internal-utils.h
│   │       ├── gmock-port.h
│   │       └── gmock-pp.h
│   └── gtest
│       ├── gtest-death-test.h
│       ├── gtest.h
│       ├── gtest-matchers.h
│       ├── gtest-message.h
│       ├── gtest-param-test.h
│       ├── gtest_pred_impl.h
│       ├── gtest-printers.h
│       ├── gtest_prod.h
│       ├── gtest-spi.h
│       ├── gtest-test-part.h
│       ├── gtest-typed-test.h
│       └── internal
│           ├── custom
│           │   ├── gtest.h
│           │   ├── gtest-port.h
│           │   ├── gtest-printers.h
│           │   └── README.md
│           ├── gtest-death-test-internal.h
│           ├── gtest-filepath.h
│           ├── gtest-internal.h
│           ├── gtest-param-util.h
│           ├── gtest-port-arch.h
│           ├── gtest-port.h
│           ├── gtest-string.h
│           ├── gtest-type-util.h
│           └── gtest-type-util.h.pump
└── lib
    ├── cmake
    │   └── GTest
    │       ├── GTestConfig.cmake
    │       ├── GTestConfigVersion.cmake
    │       ├── GTestTargets.cmake
    │       └── GTestTargets-release.cmake
    ├── libgmock_main.so
    ├── libgmock.so
    ├── libgtest_main.so
    ├── libgtest.so
    └── pkgconfig
        ├── gmock_main.pc
        ├── gmock.pc
        ├── gtest_main.pc
        └── gtest.pc

11 directories, 59 files
```
### 4. 打包
将include和lib目录打包成一个文件gflags-2.2.2.tgz后,
可以将打包好的文件放到本地目录下通过CMake的CPM拉取本地文件使用
也可以上传到http文件服务器,然后通过CMake的CPM拉取http服务器上的文件使用
```shell
cd googletest/build_x86_ubuntu/output
tar -zcf googletest-1.10.0.tgz include lib
scp ./glog-0.6.0.tgz user@10.31.1.102:/mnt/nfs/pkgs/
```