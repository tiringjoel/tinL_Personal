#!/bin/bash
#------------------
#u-boot.sh
#(c) H.Buchmann FHNW 2015
# step 1: distclean
#      2: am335x_boneblack_defconfig
#      3: all
# useful tags
#      help
#      menuconfig
#------------------
#we are in 19-minimal-distro
#configure for your needs
U_BOOT_SRC=$(pwd)/../resources/u-boot/
CROSS_COMPILE=$(pwd)/tc/bin/arm-linux-gnueabihf-
BUILD=$(pwd)/build/u-boot
MAKE="make -j8"
[[ ! -d ${BUILD} ]] &&
{
 mkdir -p ${BUILD}
}
pushd ${U_BOOT_SRC}
${MAKE} V=1 CROSS_COMPILE=${CROSS_COMPILE} O=${BUILD} ${@}
popd

