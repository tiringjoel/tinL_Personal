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

TARGET=arm-fhnw-linux-gnueabi
TARGET_ROOT=${BUILD_HOME}/target-root
TC_PREFIX=${BUILD_HOME}/tc

CROSS_COMPILE=${TC_PREFIX}/bin/${TARGET}-
SYSROOT=${TARGET_ROOT}
#----------------- the source code
RESOURCES=${BUILD_HOME}/../resources/
KERNEL_SRC=${RESOURCES}/linux/
BINUTILS_SRC=${RESOURCES}/binutils-2.25
GCC_SRC=${RESOURCES}/gcc-5-20150329
EGLIBC_SRC=${RESOURCES}/eglibc-2.19/
BUSYBOX_SRC=${RESOURCES}/busybox-1.23.2/
OPENSSH_SRC=${RESOURCES}/openssh-6.7p1
OPENSSL_SRC=${RESOURCES}/openssl-1.0.2a
ZLIB_SRC=${RESOURCES}/zlib-1.2.8
FUSE_SRC=${RESOURCES}/fuse-2.9.3
SSHFS_SRC=${RESOURCES}/sshfs-fuse-2.5

#the make command
#-jn the number of the cpu on the host 
MAKE="make -j6"

cd build

