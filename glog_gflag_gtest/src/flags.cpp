#include "flags.h"

DEFINE_string(test_log_name, "my_log_name", "log file name");
DEFINE_string(test_log_dir, "./", "log dir");

DEFINE_int32(test_enable_statistics_run, 0, "enable statistics function to run");
DEFINE_uint64(test_set_statistics_cycle_time, 10000, "set statistics cycle time, unit is ms");
