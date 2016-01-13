#--------------------
#common.sh
#(c) H.Buchmann FHNW 2015
#--------------------
# we are in 17-build

SIGNATURE=.4dd6df53-9da5-4819-bbfe-a2b578594228
[[ ! -f ${SIGNATURE} ]] &&
{
 echo " your are not in BUILD_HOME"
 exit 1
}

BUILD_HOME=${PWD}
CONFIG=${PWD}/config

TARGET=arm-linux-gnueabihf
TARGET_ROOT=${BUILD_HOME}/target-root
TC_PREFIX=${BUILD_HOME}/tc

CROSS_COMPILE=${TC_PREFIX}/bin/${TARGET}-
SYSROOT=${TARGET_ROOT}

RESOURCES=${BUILD_HOME}/../resources/

#----------------- toolchain
BINUTILS_SRC=${RESOURCES}/binutils-2.25/
GCC_SRC=${HOME}/devel/gcc/dist/gcc-5.3.0/

#----------------- the source code
KERNEL_SRC=${RESOURCES}/beaglebone-black/linux/
U_BOOT_SRC=${RESOURCES}/u-boot

EGLIBC_SRC=${RESOURCES}/eglibc/
GLIBC_SRC=${RESOURCES}/glibc-2.22/
NEWLIB_SRC=${RESOURCES}/newlib-2.2.0-1/
OPENSSL_SRC=${RESOURCES}/openssl-1.0.2a/

BUSYBOX_SRC=${RESOURCES}/busybox-1.24.1/
CPUFREQUTILS_SRC=${RESOURCES}/cpufrequtils-008
NET_TOOLS_SRC=${RESOURCES}/net-tools

OPENSSH_SRC=${RESOURCES}/openssh-7.1p1
ZLIB_SRC=${RESOURCES}/zlib-1.2.8
FUSE_SRC=${RESOURCES}/fuse-2.9.3
SSHFS_SRC=${RESOURCES}/sshfs-fuse-2.5
GLIB_SRC=${RESOURCES}/glib-2.46.1
#the make command

#-jn the number of the cpu on the host 
MAKE="make -j8"

cd build

