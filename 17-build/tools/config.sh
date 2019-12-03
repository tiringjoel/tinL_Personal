#--------------------
#common.sh
#(c) H.Buchmann FHNW 2018
#--------------------
# we are in 17-build
SIGNATURE=.c64f747e-8bd8-4992-80a5-3e4bfa8fd500
[[ ! -f ${SIGNATURE} ]] &&
{
 echo " your are not in BUILD_HOME"
 exit 1
}
#--------------------------------------- locations of the resources
RESOURCES=/opt/resources
BINUTILS_SRC=${RESOURCES}/binutils-2.33.1/
GCC_SRC=${RESOURCES}/gcc-9.2.0/
MUSL_SRC=${RESOURCES}/musl-1.1.24/
KERNEL_SRC=${RESOURCES}/beaglebone/linux/
GLIBC_SRC=${RESOURCES}/glibc-2.30/
ZLIB_SRC=${RESOURCES}/zlib-1.2.11              #tar.gz
OPENSSL_SRC=${RESOURCES}/openssl-1.0.2t
OPENSSH_SRC=${RESOURCES}/openssh-8.1p1

BAREBOX_SRC=${RESOURCES}/barebox-2019.11.0
GMP_SRC=${RESOURCES}/gmp-6.1.2
MPFR_SRC=${RESOURCES}/mpfr-4.0.1
MPC_SRC=${RESOURCES}/mpc-1.1.0
BUSYBOX_SRC=${RESOURCES}/busybox-1.31.1

#OPENSSL_SRC=${RESOURCES}/openssl-1.1.1       #tar.gz
IW_SRC=${RESOURCES}/iw-5.3                 #tar.xz
LIBNL_SRC=${RESOURCES}/libnl-3.4.0
RSYNC_SRC=${RESOURCES}/rsync-3.1.2
U_BOOT_SRC=${RESOURCES}/u-boot/
WPA_SUPPLICANT_SRC=${RESOURCES}/wpa_supplicant-2.9
LIGHTTPD_SRC=${RESOURCES}/lighttpd-1.4.54
NTP_SRC=${RESOURCES}/ntp-4.2.8p13
LIBEVENT_SRC=${RESOURCES}/libevent-2.1.11-stable
NANO_SRC=${RESOURCES}/nano-4.5
NCURSES_SRC=${RESOURCES}/ncurses-6.1
PCRE_SRC=${RESOURCES}/pcre-8.43
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
SCRIPT=$(basename ${0})
BUILD_DIR=${SCRIPT%.sh}
cd build
[[ ! -d ${BUILD_DIR} ]] && mkdir ${BUILD_DIR}
cd ${BUILD_DIR} 

