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
#---------------------
. $(dirname ${0})/config.sh
[[ ! -d kernel ]] &&
{
 mkdir kernel
 [[ ! -f kernel/.config ]] &&
 {
  cp ${CONFIG}/kernel.config kernel/.config
 }
}

[[ -z ${1}  ]] &&
{
 echo "bb.org_defconfig | zImage | dtbs | headers_install"
 exit 0
}

BUILD=${PWD}/kernel
pushd ${KERNEL_SRC} > /dev/null

${MAKE} V=1 O=${BUILD} \
LOADADDR=0x8000 \
ARCH=arm \
CROSS_COMPILE=${CROSS_COMPILE} \
INSTALL_HDR_PATH=${TARGET_ROOT}/usr \
${@}
popd   > /dev/null

ZIMAGE=kernel/arch/arm/boot/zImage
DTB=kernel/arch/arm/boot/dts/am335x-boneblack-wireless.dtb

[[ ! -f ${ZIMAGE} ]] &&
{
echo "------------  no zImage available"
exit 1
}

[[ ! -f ${DTB} ]] &&
{
echo "------------  no devicetree available"
exit 1
}

cp ${ZIMAGE} ${DTB} ${TARGET_ROOT}/boot
