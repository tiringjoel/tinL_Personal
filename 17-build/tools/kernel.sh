#!/bin/bash
#---------------------
#kernel.sh
#(c) H.Buchmann FHNW 2018
# kernel.sh args/target
# important targets
#   bb.org_defconfig
#   zImage
#   dtbs
#   headers_install
#   distclean 
#   clean
#   help
#---------------------
#we are in 17-build
. $(dirname ${0})/common.sh
BUILD=${PWD}/kernel
[[ ! -d ${BUILD} ]] &&
{
 mkdir ${BUILD}
}
cd ${LINUX_SRC}
${MAKE} V=1 O=${BUILD} \
ARCH=arm \
CROSS_COMPILE=${CROSS_COMPILE} \
INSTALL_MOD_PATH=${MODULES} \
INSTALL_HDR_PATH=${TARGET_ROOT}/usr \
${@}

