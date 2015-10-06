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
#----------------- toolchain
GCC_SRC=${HOME}/devel/gcc/dist/gcc-5.2.0/
BINUTILS_SRC=${HOME}/devel/gcc/dist/binutils-2.25/

#----------------- the source code
RESOURCES=${BUILD_HOME}/../resources/
EGLIBC_SRC=${RESOURCES}/eglibc/
OPENSSL_SRC=${RESOURCES}/openssl-1.0.2a
KERNEL_SRC=${RESOURCES}/beaglebone-black/linux/
BUSYBOX_SRC=${RESOURCES}/busybox-1.23.2/


OPENSSH_SRC=${RESOURCES}/openssh-7.1p1
ZLIB_SRC=${RESOURCES}/zlib-1.2.8
FUSE_SRC=${RESOURCES}/fuse-2.9.3
SSHFS_SRC=${RESOURCES}/sshfs-fuse-2.5
GLIB_SRC=${RESOURCES}/glib-2.44.0
#the make command

#-jn the number of the cpu on the host 
MAKE="make -j4"

cd build

