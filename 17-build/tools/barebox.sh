#!/bin/bash
#------------------
#make.sh
#(c) H.Buchmann FHNW 2014
#am335x_mlo_defconfig
#barebox-am33xx-beaglebone-mlo.img
#omap_defconfig
#omap3530_beagle_defconfig
#barebox-am33xx-beaglebone.img
#------------------
#we are in 17-build
. $(dirname ${0})/config.sh  #load common
MAKE=make
BUILD=${PWD}
pushd ${BAREBOX_SRC}
${MAKE} ARCH=arm CROSS_COMPILE=${CROSS_COMPILE} O=${BUILD} V=1 ${@}
popd

