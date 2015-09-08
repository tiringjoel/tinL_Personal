#---------------------
#kernel.sh
#(c) H.Buchmann FHNW 2015
# kernel.sh args
# args 
#  bcmrpi_defconfig
#  menuconfig
#  zImage
#  headers_install
#---------------------
. scripts/common.sh
[[ ! -d kernel ]] &&
{
 mkdir kernel
}
BUILD=${PWD}/kernel
cd ${KERNEL_SRC}
START=$(date '+%s')
#MAKE='make'
${MAKE} V=0 O=${BUILD} \
ARCH=arm \
CROSS_COMPILE=${CROSS_COMPILE} \
INSTALL_HDR_PATH=${TARGET_ROOT}/usr \
${@}
END=$(date '+%s')
echo "----------------------- diff $((END-START))"

