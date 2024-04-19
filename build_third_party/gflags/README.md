

# 编译安装gflags命令行参数库
## 一. 概要
由Google开发，用于定义命令行参数
C++ 语言编写
专为大规模分布式系统设计
## 二. 功能
gflags的一些主要特点：
自动化：自动生成命令行参数的帮助信息和文档。
类型安全：支持多种类型的命令行参数，如整数、浮点数、字符串和布尔值。
线程安全：gflags 提供了线程安全的访问和修改命令行参数的机制。
持久化：支持将命令行参数的值持久化到文件中，并在程序启动时重新加载。
易用性：通过宏定义简化了命令行参数的声明和使用。
兼容性：gflags 与多种操作系统兼容，包括Linux、macOS和Windows。
## 三. 编译
[代码仓库](https://github.com/gflags/gflags) 
[官方安装参考手册](https://github.com/gflags/gflags/blob/master/INSTALL.md)
### 1. 下载源码
```shell
git clone -b v2.2.2 https://github.com/gflags/gflags.git
# 或者直接在页面下载
```
### 2. 编译
```shell
cd glog
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX="./output" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON ..
make -j8 && make install
```
### 3. 产出包内容
```
xxx@xxx:~/Dev/git/gflags/build_x86_ubuntu$ tree output/
output/
├── bin
│   └── gflags_completions.sh
├── include
│   └── gflags
│       ├── gflags_completions.h
│       ├── gflags_declare.h
│       ├── gflags_gflags.h
│       └── gflags.h
└── lib
    ├── cmake
    │   └── gflags
    │       ├── gflags-config.cmake
    │       ├── gflags-config-version.cmake
    │       ├── gflags-nonamespace-targets.cmake
    │       ├── gflags-nonamespace-targets-release.cmake
    │       ├── gflags-targets.cmake
    │       └── gflags-targets-release.cmake
    ├── libgflags_nothreads.so -> libgflags_nothreads.so.2.2
    ├── libgflags_nothreads.so.2.2 -> libgflags_nothreads.so.2.2.2
    ├── libgflags_nothreads.so.2.2.2
    ├── libgflags.so -> libgflags.so.2.2
    ├── libgflags.so.2.2 -> libgflags.so.2.2.2
    ├── libgflags.so.2.2.2
    └── pkgconfig
        └── gflags.pc

7 directories, 18 files
```
### 4. 打包
将include和lib目录打包成一个文件gflags-2.2.2.tgz后,
可以将打包好的文件放到本地目录下通过CMake的CPM拉取本地文件使用
也可以上传到http文件服务器,然后通过CMake的CPM拉取http服务器上的文件使用
```shell
cd gflags/build_x86_ubuntu/output
tar -zcf gflags-2.2.2.tgz include lib bin
scp ./gflags-2.2.2.tgz user@10.31.1.102:/mnt/nfs/pkgs/
```