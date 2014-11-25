#--------------------
#openssl.sh
#(c) H.Buchmann FHNW 2014
#--------------------
#we are in 8-configure
SRC=${PWD}/../resources/openssh-6.7p1
export CFLAGS=--sysroot=${PWD}/target-root
export CC=${PWD}/tc/bin/armv6l-unknown-linux-gnueabihf-gcc
export CFLAGS=--sysroot=${PWD}/target-root
export LDFLAGS=--sysroot=${PWD}/target-root
PREFIX=${PWD}/work
cd build-openssh
${SRC}/configure --disable-strip --prefix=${PREFIX} --host=armv6l-unknown-linux-gnueabihf
#./configure --help
 
