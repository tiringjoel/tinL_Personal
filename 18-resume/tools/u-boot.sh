#!/bin/bash
#------------------
#make.sh
#(c) H.Buchmann FHNW 2014
# step 1: distclean
#      2: socfpga_de1_soc_defconfig
#      3: all
#------------------
#we are in 17-build
. $(dirname ${0})/config.sh  #load common
[[ ! -d u-boot ]] &&
{
 mkdir u-boot
}
#MAKE=make
BUILD=$(pwd)/u-boot
pushd ${U_BOOT_SRC}
${MAKE} CROSS_COMPILE=${CROSS_COMPILE} O=${BUILD} V=1 ${@}
popd


echo "dd if=u-boot-with-spl.sfp of=partition a2 of sd-card"
