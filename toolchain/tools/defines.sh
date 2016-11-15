#------------------------
#defines.sh
#(c) H.Buchmann FHNW 2015
#------------------------
GCC_VERSION=6.2.0
GCC_SRC=${HOME}/devel/gcc/dist/gcc-${GCC_VERSION}
BINUTILS_VERSION=2.24
BINUTILS_SRC=${HOME}/devel/gcc/dist/binutils-${BINUTILS_VERSION}

TARGET=arm-linux-gnueabihf
TC_HOME=${PWD}/tc
SYSROOT=${PWD}/root-fs
MAKE="make -j8"
DISTRO=beaglebone-black-toolchain-64bit-${GCC_VERSION}
