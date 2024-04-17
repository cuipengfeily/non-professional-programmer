
#include <memory>
#include <iostream>
#include <string>
#include <thread>
#include <chrono>

#include "glog/logging.h"
#include "gtest/gtest.h"
#include "flags.h"

using namespace std;

int add(int a, int b)
{
  return a + b;
}

TEST(add, nagative)
{
  std::cout << "************************* Single API add(int, int) when return a negative number test *************************" << endl;
  EXPECT_EQ(-3, add(-2, -1));
  EXPECT_EQ(-2, add(-3, 1));
}

TEST(add, positive)
{
  std::cout << "************************* Single API add(int, int) when return a positive number test *************************" << endl;
  EXPECT_EQ(1, add(2, -1));
  EXPECT_EQ(2, add(3, -1));
}

class FooTest : public ::testing::Test
{
protected:
  FooTest() {}
  ~FooTest() override {}
  static void SetUpTestSuite()
  {
    std::cout << "================================== run before first case ==================================" << endl;
  }
  static void TearDownTestSuite()
  {
    std::cout << "================================== run after last case ==================================" << endl;
  }
  void SetUp() override
  {
    std::cout << "--------------------------------------- SetUp() ---------------------------------------" << endl;
  }
  void TearDown() override
  {
    std::cout << "------------------------------------- TearDown() -------------------------------------" << endl;
  }
};

TEST_F(FooTest, test_a)
{
  std::cout << "#################################  Test the add(hexadecimal, decimal)  #################################" << endl;
  EXPECT_EQ(2, add(0x7ffffff, 1));
}

TEST_F(FooTest, test_b)
{
  std::cout << "#################################  Test the add(decimal, decimal)  #################################" << endl;
  EXPECT_EQ(1, add(1, 0));
}

int main(int argc, char **argv)
{
  std::cout << "Run the main ..." << endl;
  std::cout << "SOFTWARE VERSION: " << SOFTWARE_VERSION << std::endl;
  std::cout << "COMPILE_PERSON  : " << COMPILE_PERSON << std::endl;

  google::ParseCommandLineFlags(&argc, &argv, false);
  // FLAGS_logtostderr = 1;   //output to stderr

  FLAGS_log_dir = FLAGS_test_log_dir;
  auto log_destination = FLAGS_log_dir + FLAGS_test_log_name;
  const std::string &infolog = FLAGS_test_log_name;
  google::SetLogSymlink(google::GLOG_INFO, infolog.c_str());
  google::SetLogSymlink(google::GLOG_WARNING, infolog.c_str());
  google::SetLogSymlink(google::GLOG_ERROR, infolog.c_str());

  google::InitGoogleLogging(argv[0]);

  cout << "test glog start!!!!!!!!!!!!!!!!!" << endl
       << endl;

  cout << "LOG(INFO):" << endl;
  LOG(INFO) << "My dear 1, I'm a silly bird";
  cout << endl;

  cout << "LOG_IF(WARNING,...):" << endl;
  LOG_IF(WARNING, true) << "My dear 2, I'm a silly bird";
  cout << endl;

  cout << "LOG_EVERY_N(ERROR,3):" << endl;
  for (int i = 0; i < 10; i++)
  {
    LOG_EVERY_N(ERROR, 3) << "My dear 3, I'm a silly bird, this is " << google::COUNTER << " time run";
  }
  cout << endl;

  cout << "DEFINE_string():" << endl;

  cout << "test glog over!!!!!!!!!!!!!!!!!!" << endl;

  std::cout << "test gtest start:" << endl;

  ::testing::FLAGS_gtest_filter = "*";

  ::testing::InitGoogleTest(&argc, argv);

  std::cout << "build info str: " << BUILD_INFO_STR << endl;

  return RUN_ALL_TESTS(); /* start to run the case of gtest function */
}