#!/bin/bash
#--------------------
#busybox.sh
#(c) H.Buchmann FHNW 2015
# busybox.sh args
#args 
# help
# menuconfig
# busybox
# install
# see kernel.sh
#--------------------
#we are in build
. $(dirname ${0})/common.sh
BUILD=${PWD}/busybox
[[ ! -d ${BUILD} ]] && 
{ 
 mkdir ${BUILD}; 
}
cd ${BUSYBOX_SRC}
#MAKE=make
${MAKE} CONFIG_SYSROOT=${SYSROOT} CONFIG_PREFIX=${SYSROOT} CROSS_COMPILE=${CROSS_COMPILE} V=1 O=${BUILD} ${@}

