
# 编译安装glog日志库
## 一. 概要
Google 开发的开源日志库
C++ 语言编写
专为大规模分布式系统设计
## 二. 功能
glog 提供了丰富的日志功能，包括但不限于：
多级别的日志输出：支持从 FATAL（致命错误）到 INFO（信息）等不同级别的日志。
日志滚动：可以根据文件大小自动滚动日志文件，避免单个日志文件过大。
线程安全：glog 保证了在多线程环境下的日志操作是线程安全的。
日志缓冲：可以在后台缓冲日志，减少对性能的影响。
日志格式：支持自定义日志格式。
日志过滤：可以设置日志的过滤级别，控制日志输出的详细程度。
性能：glog 被设计为高性能，尽量减少对程序运行性能的影响。
## 三. 编译
[代码仓库](https://github.com/google/glog) 
### 1. 下载源码
```shell
git clone -b v0.6.0 https://github.com/google/glog.git
# 或者直接在页面下载
```
### 2. 编译
```shell
cd glog
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX="./output" -DCMAKE_BUILD_TYPE=Release ..
make -j8 && make install
```
### 3. 产出包结构
```
xxx@xxx:~/Dev/git/glog/build_x86_ubuntu$ tree output/
output/
├── include
│   └── glog
│       ├── export.h
│       ├── logging.h
│       ├── log_severity.h
│       ├── platform.h
│       ├── raw_logging.h
│       ├── stl_logging.h
│       └── vlog_is_on.h
└── lib
    ├── cmake
    │   └── glog
    │       ├── glog-config.cmake
    │       ├── glog-config-version.cmake
    │       ├── glog-modules.cmake
    │       ├── glog-targets.cmake
    │       └── glog-targets-release.cmake
    ├── libglog.so -> libglog.so.1
    ├── libglog.so.0.6.0
    ├── libglog.so.1 -> libglog.so.0.6.0
    └── pkgconfig
        └── libglog.pc

6 directories, 16 files
```
### 4. 打包
将include和lib目录打包成一个文件gflags-2.2.2.tgz后,
可以将打包好的文件放到本地目录下通过CMake的CPM拉取本地文件使用
也可以上传到http文件服务器,然后通过CMake的CPM拉取http服务器上的文件使用
```shell
cd glog/build_x86_ubuntu/output
tar -zcf glog-0.6.0.tgz include lib
scp ./glog-0.6.0.tgz user@10.31.1.102:/mnt/nfs/pkgs/
```