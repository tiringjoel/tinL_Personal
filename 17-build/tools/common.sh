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
#TARGET=arm-linux-musl does not work already in gcc-bare

TARGET_ROOT=${BUILD_HOME}/target-root
TC_PREFIX=${BUILD_HOME}/tc

CROSS_COMPILE=${TC_PREFIX}/bin/${TARGET}-
SYSROOT=${TARGET_ROOT}

RESOURCES=${HOME}/resources/

#----------------- toolchain
BINUTILS_SRC=${RESOURCES}/binutils-2.31/
GCC_SRC=${RESOURCES}/gcc-8.2.0/
GMP_SRC=${RESOURCES}/gmp-6.1.2/
MPFR_SRC=${RESOURCES}/mpfr-4.0.1/
MPC_SRC=${RESOURCES}/mpc-1.1.0/

#----------------- u-boot
U_BOOT_SRC=${RESOURCES}/u-boot-2018.09
#----------------- kernel
LINUX_SRC=${RESOURCES}/beaglebone/linux
GLIBC_SRC=${RESOURCES}/glibc-2.28/

#----------------- unix
BUSYBOX_SRC=${RESOURCES}/busybox-1.29.3/
#----------------- unix ssh
ZLIB_SRC=${RESOURCES}/zlib-1.2.11
OPENSSL_SRC=${RESOURCES}/openssl-1.0.2q
OPENSSH_SRC=${RESOURCES}/openssh-7.9p1

#----------------- unix wifi
LIBNL_SRC=${RESOURCES}/libnl-3.4.0
WPA_SUPPLICANT_SRC=${RESOURCES}/wpa_supplicant-2.7


TOYBOX_SRC=${RESOURCES}/toybox-0.7.5

CPUFREQUTILS_SRC=${RESOURCES}/cpufrequtils-008
NET_TOOLS_SRC=${RESOURCES}/net-tools

#OPENSSH_SRC=${RESOURCES}/openssh-7.6p1
#OPENSSH_SRC=${RESOURCES}/openssh-7.1p1
RSYNC_SRC=${RESOURCES}/rsync-3.1.2
MINICOM_SRC=${RESOURCES}/minicom-2.7
FUSE_SRC=${RESOURCES}/fuse-2.9.3
SSHFS_SRC=${RESOURCES}/sshfs-fuse-2.5
GLIB_SRC=${RESOURCES}/glib-2.46.1
IW_SRC=${RESOURCES}/iw-4.9
HOSTAPD_SRC=${RESOURCES}/hostapd-2.6
OPENVPN_SRC=${RESOURCES}/openvpn-2.4.4
OPENCONNECT_SRC=${RESOURCES}/openconnect-7.08
NTP_SRC=${RESOURCES}/ntp-4.2.8p10/
LIBEVENT_SRC=${RESOURCES}/libevent-2.1.8-stable/
#the make command

#-jn the number of the cpu on the host 
MAKE="make -j$(getconf _NPROCESSORS_ONLN)"
echo "MAKE=${MAKE}"
