#!/usr/bin/env bash

PLAT_VENDOER=x86_64-ubuntu-linux-gcc9.3.0

##############################################
# read meta file and to confirm the dependency.
glog_version=`python3 cicd/version_get.py glog_version`
software_version=`python3 cicd/version_get.py software_version`
if [ $GIT_USER_PLATFORM ];then
  compile_person=$GIT_USER_PLATFORM
else
  compile_person=`python3 cicd/version_get.py compile_person`
fi
echo "[META][INFO]: glog          : $glog_version"
echo "[META][INFO]: software      : $software_version"
echo "[META][INFO]: compile person: $compile_person"
##############################################

cur_time=$(date "+%Y-%m-%d %H:%M:%S")
build_info_str=${software_version}
build_info_str+=" ${cur_time}"

function compile () {
  CURDIR=$(pwd)
  SUBDIRNAME="build_x86_ubuntu"
  DIRNAME=${CURDIR}/${SUBDIRNAME}
  if [ ! -d ${DIRNAME} ]; then
    mkdir ${DIRNAME}
  else
    echo "${DIRNAME} exists"
  fi
  cd ${DIRNAME} || exit
  fullpath=$(pwd)
  cmake \
    -DARCH_PLAT_VENDOR=${PLAT_VENDOER} \
    -DCMAKE_INSTALL_PREFIX="${fullpath}/output" \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DGLOG_VERSION="${glog_version}" \
    -DSOFTWARE_VERSION="$software_version" \
    -DCOMPILE_PERSON="$compile_person" \
    -DBUILD_INFO_STR="$build_info_str" \
    ..
  make -j8 && make install
  cd -
}
function incr () {
  CURDIR=$(pwd)
  SUBDIRNAME="build_x86_ubuntu"
  DIRNAME=${CURDIR}/${SUBDIRNAME}
  if [ ! -d ${DIRNAME} ]; then
    mkdir ${DIRNAME}
  else
    echo "${DIRNAME} exists"
  fi
  cd ${DIRNAME} || exit
  make -j8 && make install
  cd -
}

if [ $# -eq 0 ];
then
   compile
else
   incr
fi
