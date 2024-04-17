#cmake version number
cmake_minimum_required(VERSION 3.5)  

#project name
project(google_pkg_test)  

#add header file search path: the directory where the current CMakeList.txt is located
include_directories(  
        ${CMAKE_CURRENT_SOURCE_DIR}
)

#build a static library for gflags
add_library(flags STATIC
        flags.cpp
        )
 #link the library gflags to the target library file flags
target_link_libraries(flags
        gflags
        )

# lib
# do not install the static library
# install(TARGETS
#         flags
#         LIBRARY DESTINATION lib
#         ARCHIVE DESTINATION lib
#         RUNTIME DESTINATION bin
#         INCLUDES DESTINATION .
#         )

add_executable(test_main  #Build a binary executable krider_repo_learning_main
        test_main.cpp
        )

#link the library flags glog to the target bin application file test_main
target_link_libraries(test_main
        PRIVATE
        # local library
        flags
        
        # google library
        glog
        gtest
        )

# binary
install(TARGETS
        test_main
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/config/
        DESTINATION config
        FILES_MATCHING PATTERN "*.conf" PATTERN "*.xml" PATTERN "*.txt" PATTERN "*.yaml" PATTERN "*.json"
        )

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/launch/
        DESTINATION launch
        FILES_MATCHING PATTERN "*.sh"
        )

