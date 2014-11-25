#--------------------
#sox.sh
#(c) H.Buchmann FHNW 2014
#--------------------
#we are in 8-configure
PREFIX=${PWD}/work
TARGET=${PWD}/target-root
export CC=${PWD}/tc/bin/armv6l-unknown-linux-gnueabihf-gcc
export CFLAGS=--sysroot=${TARGET}
OPENSSL=${PWD}/../resources/openssl-1.0.1j
cd build-openssl
${OPENSSL}/configure --prefix=${PREFIX}  --host=armv6l-unknown-linux-gnueabihf
#./configure --help
 
