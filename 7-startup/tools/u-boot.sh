#!/bin/bash
#------------------
#make.sh
#(c) H.Buchmann FHNW 2014
# step 1: distclean
#      2: am335x_boneblack_defconfig
#      3: all
# important files found in u-boot
# MLO:        second state bootloader
# u-boot.img: the u-boot code
#------------------
#we are in 7-startup
STARTUP_HOME=${PWD}

#where is the source
U_BOOT_SRC=${STARTUP_HOME}/../resources/u-boot-2016.07

#the toolchain
TARGET=arm-linux-gnueabihf
TC_PREFIX=${STARTUP_HOME}/tc
CROSS_COMPILE=${TC_PREFIX}/bin/${TARGET}-

#how to make
MAKE="make -j8"

[[ ! -d u-boot ]] &&
{
 mkdir u-boot
}
BUILD=${STARTUP_HOME}/u-boot
pushd ${U_BOOT_SRC}
${MAKE} CROSS_COMPILE=${CROSS_COMPILE} O=${BUILD} ${@}
popd

