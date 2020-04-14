#!/bin/bash
#---------------------
#kernel.sh
#(c) H.Buchmann FHNW 2018
# kernel.sh args
#----------------------
# beaglebone
# bb.org_defconfig
# zImage :kernel
# dtbs   :devicetree
# headers_install: for glibc
#---------------------
. $(dirname ${0})/config.sh

[[ -z ${1}  ]] &&
{
 echo "bb.org_defconfig | zImage | dtbs  | headers_install"
 exit 0
}

BUILD=${PWD}
pushd ${KERNEL_SRC} > /dev/null
${MAKE} V=1 O=${BUILD} \
LOADADDR=0x8000 \
ARCH=arm \
CROSS_COMPILE=${CROSS_COMPILE} \
INSTALL_HDR_PATH=${TARGET_ROOT}/usr \
${@}
err=${?}
popd   > /dev/null


[[ ${err} != 0 ]] &&
{
 echo "errors in manufacturing"
 exit 1
}

[[ ${1} = zImage ]] &&
{
 [[  -f ${ZIMAGE} ]] &&
 {
  [[ ! -d ${TARGET_ROOT} ]] &&
  {
   mkdir ${TARGET_ROOT}
  }
  [[ ! -d ${TARGET_ROOT}/boot ]] &&
  {
   mkdir ${TARGET_ROOT}/boot
  }
  
  cp ${ZIMAGE} ${TARGET_ROOT}/boot
 }
}

[[ ${1} = dtbs ]] &&
{
 [[  -f ${ZIMAGE} ]] &&
 {
  cp ${DTB} ${TARGET_ROOT}/boot
 }
}

