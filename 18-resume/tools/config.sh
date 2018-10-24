#--------------------
#common.sh
#(c) H.Buchmann FHNW 2018
#--------------------
# we are in 18-resume
SIGNATURE=.62052326-ceda-4944-85e9-b8353c8c1d72
[[ ! -f ${SIGNATURE} ]] &&
{
 echo " your are not in BUILD_HOME"
 exit 1
}
#--------------------------------------- locations of the resources
RESOURCES=${PWD}/../resources
GMP_SRC=${RESOURCES}/gmp-6.1.2
MPFR_SRC=${RESOURCES}/mpfr-4.0.1
MPC_SRC=${RESOURCES}/mpc-1.1.0
BINUTILS_SRC=${HOME}/devel/gcc/dist/binutils-2.31/
GCC_SRC=${HOME}/devel/gcc/dist/gcc-8.2.0/
KERNEL_SRC=${RESOURCES}/beaglebone-black/linux/
GLIBC_SRC=${RESOURCES}/glibc-2.28/
BUSYBOX_SRC=${RESOURCES}/busybox-1.29.3
ZLIB_SRC=${RESOURCES}/zlib-1.2.8              #tar.gz
#OPENSSL_SRC=${RESOURCES}/openssl-1.1.1       #tar.gz
IW_SRC=${RESOURCES}/iw-4.14                   #tar.gz
LIBNL_SRC=${RESOURCES}/libnl-3.4.0
OPENSSL_SRC=${RESOURCES}/openssl-1.0.2m
OPENSSH_SRC=${RESOURCES}/openssh-7.8p1
RSYNC_SRC=${RESOURCES}/rsync-3.1.2
U_BOOT_SRC=${RESOURCES}/u-boot/
WPA_SUPPLICANT_SRC=${RESOURCES}/wpa_supplicant-2.6
#--------------------------------------- locations here
BUILD_HOME=${PWD}
KERNEL_BUILD=${PWD}/build/kernel
KERNEL_DEVEL=${PWD}/kernel-devel

TARGET=arm-linux-gnueabihf
TARGET_ROOT=${PWD}/target-root
TC=${PWD}/tc
CONFIG=${PWD}/config
CROSS_COMPILE=${TC}/bin/${TARGET}-

#--------------------------------------- kernel
ZIMAGE=${PWD}/build/kernel/arch/arm/boot/zImage
#DTB=${PWD}/build/kernel/arch/arm/boot/dts/socfpga_cyclone5_de0_sockit.dtb
DTB=${PWD}/build/kernel/arch/arm/boot/dts/am335x-boneblack-wireless.dtb



#--------------------------------------- the make command
MAKE="make -j $(getconf _NPROCESSORS_ONLN)"

cd build


