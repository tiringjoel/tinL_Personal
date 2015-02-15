#--------------------
#openssh.sh
#(c) H.Buchmann FHNW 2014
#--------------------
#we are in 8-configure
SRC=${PWD}/../resources/openssh-6.7p1
export CC=${PWD}/../12-toolchain/tc/bin/armv6l-unknown-linux-gnueabihf-gcc
SYSROOT=${HOME}/mount/yocto/poky/build/tmp/sysroots/raspberrypi/
export CFLAGS=--sysroot=${SYSROOT}
export LDFLAGS=--sysroot=${SYSROOT}
PREFIX=${PWD}/work
cd build-openssh
${SRC}/configure --disable-strip \
--prefix=${PREFIX} \
--host=armv6l-unknown-linux-gnueabihf
#./configure --help
 
