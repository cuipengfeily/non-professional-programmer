# 这个目录下主要是glog, gflags和gtest的使用示例代码
# 一. 简单介绍glog, gflags和gtest
## 1.[glog](https://github.com/google/glog)
(1) 比较好的参考链接  
[How To Use Google Logging Library (glog)](https://rpg.ifi.uzh.ch/docs/glog.html)  
(2) 打印示例
```
I20240417 14:47:49.329761 1042517 test_main.cpp:100] info log.
W20240417 14:47:49.329761 1042517 test_main.cpp:100] warn log.
E20240417 14:47:49.329761 1042517 test_main.cpp:100] error log.
```
## 2.[gflags](https://github.com/gflags/gflags)
(1) 比较好的参考链接:  
 [How To Use gflags (formerly Google Commandline Flags)](https://gflags.github.io/gflags/)  
 [从编译到运行，轻松学会gflags库](https://zhuanlan.zhihu.com/p/369214077)  
(2) 命令行示例
```
# 使用了gflags的app可以通过--help选项查看帮助信息
./bin/test_main --help
```
```
# 显示结果如下
  Flags from /home/cpf/Dev/git/use_google/src/flags.cpp:
    -test_enable_statistics_run (enable statistics function to run) type: int32
      default: 0
    -test_log_dir (log dir) type: string default: "./"
    -test_log_name (log file name) type: string default: "my_log_name"
    -test_set_statistics_cycle_time (set statistics cycle time, unit is ms)
      type: uint64 default: 10000
```
## 3.[gtest](https://github.com/google/googletest)
(1) 比较好的参考链接  
[Google Test Primer](https://google.github.io/googletest/primer.html)  
[google test 之 TEST_F详解](https://www.cnblogs.com/tommy-weng/p/17798589.html)  
(2) 运行示例
```
[==========] Running 4 tests from 2 test suites.
[----------] Global test environment set-up.
[----------] 2 tests from add
[ RUN      ] add.nagative
```
# 二. 示例代码编译和运行
## 0. 准备<font color=#ff0000>(提前准备好编译好的库,待更新)</font>
```
# 代码使用CPM从指定拉取目录/mnt/nfs/pkg/中拉取的glog,gflags和gtest库
# 因此需要提前将编译好的glog, gflags和gtest库放到/mnt/nfs/pkg/目录中
# 具体请参考extern_dep.cmake文件的内容
```
## 1. 编译
```
git clone git@github.com:cuipengfeily/non-professional-programmer.git
cd non-professional-programmer/glog_gflag_gtest/
# 执行如下脚本之后会安装到build_x86_ubuntu/output目录下
bash cicd/build_x86_ubuntu.sh
```
## 2. 运行
```
cd build_x86_ubuntu/output/
# 运行示例
bash launch/launch_x86.sh
```
```
Run the main ...
SOFTWARE VERSION: v0.0.1
COMPILE_PERSON  : man
test glog start!!!!!!!!!!!!!!!!!

LOG(INFO):

LOG_IF(WARNING,...):

LOG_EVERY_N(ERROR,3):
E20240417 14:47:49.329761 1042517 test_main.cpp:100] My dear 3, I'm a silly bird, this is 1 time run
E20240417 14:47:49.329876 1042517 test_main.cpp:100] My dear 3, I'm a silly bird, this is 4 time run
E20240417 14:47:49.329905 1042517 test_main.cpp:100] My dear 3, I'm a silly bird, this is 7 time run
E20240417 14:47:49.329933 1042517 test_main.cpp:100] My dear 3, I'm a silly bird, this is 10 time run

DEFINE_string():
test glog over!!!!!!!!!!!!!!!!!!
test gtest start:
build info str: v0.0.1 2024-04-17 14:47:40
[==========] Running 4 tests from 2 test suites.
[----------] Global test environment set-up.
[----------] 2 tests from add
[ RUN      ] add.nagative
************************* Single API add(int, int) when return a negative number test *************************
[       OK ] add.nagative (0 ms)
[ RUN      ] add.positive
************************* Single API add(int, int) when return a positive number test *************************
[       OK ] add.positive (0 ms)
[----------] 2 tests from add (0 ms total)

[----------] 2 tests from FooTest
================================== run before first case ==================================
[ RUN      ] FooTest.test_a
--------------------------------------- SetUp() ---------------------------------------
#################################  Test the add(hexadecimal, decimal)  #################################
/home/cpf/Dev/git/use_google/src/test_main.cpp:59: Failure
Expected equality of these values:
  2
  add(0x7ffffff, 1)
    Which is: 134217728
------------------------------------- TearDown() -------------------------------------
[  FAILED  ] FooTest.test_a (0 ms)
[ RUN      ] FooTest.test_b
--------------------------------------- SetUp() ---------------------------------------
#################################  Test the add(decimal, decimal)  #################################
------------------------------------- TearDown() -------------------------------------
[       OK ] FooTest.test_b (0 ms)
================================== run after last case ==================================
[----------] 2 tests from FooTest (0 ms total)

[----------] Global test environment tear-down
[==========] 4 tests from 2 test suites ran. (0 ms total)
[  PASSED  ] 3 tests.
[  FAILED  ] 1 test, listed below:
[  FAILED  ] FooTest.test_a

 1 FAILED TEST
```
