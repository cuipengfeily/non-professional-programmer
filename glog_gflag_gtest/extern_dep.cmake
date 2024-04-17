include(cmake/CPM.cmake)

# glog
CPMAddPackage(
        NAME glog
        URL http://10.31.1.173/pkg/glog-0.6.0.tgz
)
include_directories(${glog_SOURCE_DIR}/include)
link_directories(${glog_SOURCE_DIR}/lib)
install(DIRECTORY ${glog_SOURCE_DIR}/lib
        DESTINATION third_party
        FILES_MATCHING PATTERN "*.so*"
        )

# gflags
CPMAddPackage(
        NAME gflags
        URL http://10.31.1.173/pkg/gflags-2.2.2.tgz
        # URL /mnt/nfs/pkg/gflags-2.2.2.tgz
)
include_directories(${gflags_SOURCE_DIR}/include)
link_directories(${gflags_SOURCE_DIR}/lib)
install(DIRECTORY ${gflags_SOURCE_DIR}/lib
        DESTINATION third_party
        FILES_MATCHING PATTERN "*.so*"
        )

# gtest
CPMAddPackage(
        NAME gtest
        URL http://10.31.1.173/pkg/googletest-1.10.0.tgz
)
include_directories(${gtest_SOURCE_DIR}/include)
link_directories(${gtest_SOURCE_DIR}/lib)
install(DIRECTORY ${gtest_SOURCE_DIR}/lib
        DESTINATION third_party
        FILES_MATCHING PATTERN "*.so*"
        )