#!/usr/bin/env bash

set -e

imagename=dockeros

cwd=$(pwd)

#buildroot_version=2013.11
#buildroot_url=http://buildroot.uclibc.org/downloads/buildroot-${buildroot_version}.tar.bz2
#buildroot_dir=${cwd}/buildroot-${buildroot_version}

buildroot_dir=${cwd}/buildroot

if [[ ! -d ${buildroot_dir} ]]
then
  hg clone git://git.buildroot.net/buildroot
  #curl ${buildroot_url} | tar jx

  cp defconfig ${buildroot_dir}/configs/${imagename}_defconfig
  cp kconfig ${buildroot_dir}/configs/${imagename}_kconfig
  cd ${buildroot_dir} && make ${imagename}_defconfig && make
  cd ${cwd}
else
  # Probably just doing a rebuild
  cp defconfig ${buildroot_dir}/configs/${imagename}_defconfig
  cp kconfig ${buildroot_dir}/configs/${imagename}_kconfig
  cd ${buildroot_dir}
  make ${imagename}_defconfig && make
  cd ${cdir}
fi
