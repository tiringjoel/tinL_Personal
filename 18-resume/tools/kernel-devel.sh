#!/bin/bash
#--------------------
#kernel-devel.sh
#(c) H.Buchmann FHNW 2018
#---------------------
. $(dirname ${0})/config.sh
#we are in build

function from_kernel_build_dir()
{
[[ -d ${KERNEL_BUILD}/${1} ]] &&
 {
  mkdir -p ${KERNEL_DEVEL}/${1}
 }
 rsync -av ${RSYNC_EXCLUDE} ${KERNEL_BUILD}/${1}/ \
          ${KERNEL_DEVEL}/${1}/
}

function from_kernel_build_file()
{
 mkdir -p ${KERNEL_DEVEL}/$(dirname ${1})
 cp ${KERNEL_BUILD}/${1} ${KERNEL_DEVEL}/${1}
}

function from_kernel_src() 
{
 install ${KERNEL_SRC}/${1}/${2} ${KERNEL_DEVEL}/${1} 
}

[[ ! -d ${KERNEL_DEVEL} ]] &&
{
 mkdir ${KERNEL_DEVEL}
}
RSYNC_EXCLUDE="\
 --exclude=.git \
 --exclude=*.c\
 --exclude=drivers\
 --exclude=Documentation\
 --exclude=arch\
 --exclude=tools"

#copy from kernel source
rsync -av ${RSYNC_EXCLUDE}\
          ${KERNEL_SRC}/ ${KERNEL_DEVEL}/

mkdir -p ${KERNEL_DEVEL}/arch/arm
rsync -av ${RSYNC_EXCLUDE} ${KERNEL_SRC}/arch/arm/ ${KERNEL_DEVEL}/arch/arm/
#copy from kernel build

from_kernel_build_dir  arch/arm/include/generated/
from_kernel_build_dir  include/generated/
from_kernel_build_dir  include/config/        
from_kernel_build_file scripts/mod/modpost
from_kernel_build_file scripts/recordmcount
from_kernel_build_file .config
from_kernel_build_file Module.symvers
from_kernel_build_file scripts/basic/fixdep
from_kernel_src scripts *.c
from_kernel_src scripts/basic *.c

#Module.symvers
#./resources/beaglebone-black/linux/scripts/*.c
#../resources/beaglebone-black/linux/scripts/basic/*.
#build/kernel/scripts/basic/fixdep

