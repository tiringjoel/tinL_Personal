#!/bin/bash
#------------------
#make.sh
#(c) H.Buchmann FHNW 2014
# step 1: distclean
#      2: am335x_boneblack_defconfig
#      3: all
#------------------
#we are in 17-build
. $(dirname ${0})/common.sh  #load common
BUILD=${PWD}/u-boot
[[ ! -d ${BUILD} ]] &&
{
 mkdir ${BUILD}
}
pushd ${U_BOOT_SRC}
${MAKE} CROSS_COMPILE=${CROSS_COMPILE} O=${BUILD} V=1 ${@}
popd

