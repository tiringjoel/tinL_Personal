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
BINUTILS_SRC=${HOME}/devel/gcc/dist/binutils-2.29/
GCC_SRC=${HOME}/devel/gcc/dist/gcc-7.2.0/

#----------------- the source code
PYTHON_SRC=${RESOURCES}/Python-3.5.2
U_BOOT_SRC=${RESOURCES}/u-boot-2017.09
KERNEL_SRC=${RESOURCES}/beaglebone-black/linux/


EGLIBC_SRC=${RESOURCES}/eglibc/
GLIBC_SRC=${RESOURCES}/glibc-2.26/
MUSL_SRC=${RESOURCES}/musl-1.1.15/

NEWLIB_SRC=${RESOURCES}/newlib-2.2.0-1/

#newest version openssl-1.1.0c dont works for openssl
OPENSSL_SRC=${RESOURCES}/openssl-1.0.2m

BUSYBOX_SRC=${RESOURCES}/busybox-1.27.2/
CPUFREQUTILS_SRC=${RESOURCES}/cpufrequtils-008
NET_TOOLS_SRC=${RESOURCES}/net-tools

OPENSSH_SRC=${RESOURCES}/openssh-7.6p1
#OPENSSH_SRC=${RESOURCES}/openssh-7.1p1
ZLIB_SRC=${RESOURCES}/zlib-1.2.8
RSYNC_SRC=${RESOURCES}/rsync-3.1.2
MINICOM_SRC=${RESOURCES}/minicom-2.7
FUSE_SRC=${RESOURCES}/fuse-2.9.3
SSHFS_SRC=${RESOURCES}/sshfs-fuse-2.5
GLIB_SRC=${RESOURCES}/glib-2.46.1
IW_SRC=${RESOURCES}/iw-4.9
LIBNL_SRC=${RESOURCES}/libnl-3.2.25
WPA_SUPPLICANT_SRC=${RESOURCES}/wpa_supplicant-2.6
HOSTAPD_SRC=${RESOURCES}/hostapd-2.6
OPENVPN_SRC=${RESOURCES}/openvpn-2.4.4
OPENCONNECT_SRC=${RESOURCES}/openconnect-7.08
#the make command

#-jn the number of the cpu on the host 
MAKE="make -j8"

cd build

