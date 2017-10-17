#!/bin/bash
#---------------------
#kernel.sh
#(c) H.Buchmann FHNW 2015
# kernel.sh args/target
# important targets
#   bb.org_defconfig
#   zImage
#   dtbs
#   distclean 
#   clean
# make.sh help
#---------------------
#we are in 5-kernel
. config/config.sh
cd ${LINUX_SRC}
${MAKE} V=1 O=${BUILD} \
ARCH=arm \
CROSS_COMPILE=${CROSS_COMPILE} \
INSTALL_MOD_PATH=${MODULES} \
${@}
