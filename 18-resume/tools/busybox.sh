#!/bin/bash
#--------------------
#busybox.sh
#(c) H.Buchmann FHNW 2018
# busybox.sh args
#args 
# help
# menuconfig
# busybox
# install
# see kernel.sh
#--------------------
#we are in build
. $(dirname ${0})/config.sh
BUSYBOX=${PWD}/busybox
[[ ! -d busybox ]] && 
{ 
 mkdir busybox; 
 [[ -e ${CONFIG}/busybox.config ]] &&
 {
  cp ${CONFIG}/busybox.config ${BUSYBOX}/.config
 }
}
cd ${BUSYBOX_SRC}
#MAKE=make
${MAKE} CONFIG_SYSROOT=${TARGET_ROOT} \
CONFIG_PREFIX=${TARGET_ROOT} \
CROSS_COMPILE=${CROSS_COMPILE} V=1 O=${BUSYBOX} ${@}

