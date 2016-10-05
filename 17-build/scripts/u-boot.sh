#!/bin/bash
#------------------
#make.sh
#(c) H.Buchmann FHNW 2014
# step 1: distclean
#      2: am335x_boneblack_defconfig
#      3: all
#------------------
#we are in 17-build
. scripts/common.sh
[[ ! -d u-boot ]] &&
{
 mkdir u-boot
}
BUILD=$(pwd)/u-boot
pushd ${U_BOOT_SRC}
${MAKE} CROSS_COMPILE=${CROSS_COMPILE} O=${BUILD} ${@}
popd

