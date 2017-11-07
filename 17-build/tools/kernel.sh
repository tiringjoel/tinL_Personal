#!/bin/bash
#---------------------
#kernel.sh
#(c) H.Buchmann FHNW 2015
# kernel.sh args
# args 
#  socfpga_defconfig 
#  menuconfig
#  dtbs devicetree
#  zImage
#  headers_install
#  help
#----------------------
# beaglebone
# bb.org_defconfig
# zImage :kernel
# dtbs   :devicetree
#---------------------
. $(dirname ${0})/common.sh
[[ ! -d kernel ]] &&
{
 mkdir kernel
 [[ ! -f kernel/.config ]] &&
 {
  cp ${CONFIG}/kernel.config kernel/.config
 }
}
BUILD=${PWD}/kernel
cd ${KERNEL_SRC}
START=$(date '+%s')
#MAKE='make'
${MAKE} V=1 O=${BUILD} \
LOADADDR=0x8000 \
ARCH=arm \
CROSS_COMPILE=${CROSS_COMPILE} \
INSTALL_HDR_PATH=${TARGET_ROOT}/usr \
${@}
END=$(date '+%s')
echo "----------------------- diff $((END-START))"

