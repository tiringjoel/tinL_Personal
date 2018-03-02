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
U_BOOT_SRC=${RESOURCES}/u-boot-2017.09
GMP_SRC=${RESOURCES}/gmp-6.1.2
MPFR_SRC=${RESOURCES}/mpfr-4.0.1
MPC_SRC=${RESOURCES}/mpc-1.1.0
BINUTILS_SRC=${HOME}/devel/gcc/dist/binutils-2.29/
GCC_SRC=${HOME}/devel/gcc/dist/gcc-7.3.0/
KERNEL_SRC=${RESOURCES}/beaglebone-black/linux/
GLIBC_SRC=${RESOURCES}/glibc-2.26/
BUSYBOX_SRC=${RESOURCES}/busybox-1.27.2
ZLIB_SRC=${RESOURCES}/zlib-1.2.8              #tar.gz
OPENSSL_SRC=${RESOURCES}/openssl-1.0.2m       #tar.gz
OPENSSH_SRC=${RESOURCES}/openssh-7.6p1
RSYNC_SRC=${RESOURCES}/rsync-3.1.2
U_BOOT_SRC=${RESOURCES}/u-boot-2017.09/
#--------------------------------------- locations here
BUILD_HOME=${PWD}
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


