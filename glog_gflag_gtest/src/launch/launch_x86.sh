#!/usr/bin/env bash
SCRIPT_PATH="$(
  # shellcheck disable=SC2164
  cd -- "$(dirname "$0")" >/dev/null 2>&1
  pwd -P
)"
PROJ_ROOT="${SCRIPT_PATH}/.."
# shellcheck disable=SC2164
cd "${PROJ_ROOT}"
export LD_LIBRARY_PATH="${PROJ_ROOT}/third_party/lib:${PROJ_ROOT}/lib":${LD_LIBRARY_PATH}
#export GLOG_colorlogtostderr=1
# GLOG_INFO = 0, GLOG_WARNING = 1, GLOG_ERROR = 2, GLOG_FATAL = 3,
#export GLOG_minloglevel=0
#export GLOG_v=4
#export GLOG_alsologtostderr=1

MAIN_RUN_BIN="${PROJ_ROOT}/bin/test_main"
MAIN_RUN_GFLAGS_CONF="${PROJ_ROOT}/config/gflags_x86.conf"
# start binary
${MAIN_RUN_BIN} --flagfile="${MAIN_RUN_GFLAGS_CONF}"
cd -