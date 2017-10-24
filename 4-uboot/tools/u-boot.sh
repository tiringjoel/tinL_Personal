#!/bin/bash
#------------------
#u-boot.sh wrapper  to u-boot make
#(c) H.Buchmann FHNW 2014
# step 1: distclean
#      2: am335x_boneblack_defconfig
#      3: all
# we are in 4-uboot
#------------------
#we are in 17-build
#------------------------ adapt to your needs
U_BOOT_SRC=${PWD}/../resources/u-boot-2017.09/
TC=${PWD}/tc/bin/
MAKE="make -j8"
#------------------------ done

PREFIX=arm-linux-gnueabihf-
CROSS_COMPILE=${TC}/${PREFIX}
BUILD=$(pwd)/build

pushd ${U_BOOT_SRC}
${MAKE} CROSS_COMPILE=${CROSS_COMPILE} O=${BUILD} V=1 ${@}
popd

