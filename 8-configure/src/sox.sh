#--------------------
#sox.sh
#(c) H.Buchmann FHNW 2014
#--------------------
#we are in 8-configure
PREFIX=${PWD}/work
TARGET=${PWD}/target-root
export CC=${PWD}/tc/bin/armv6l-unknown-linux-gnueabihf-gcc
export CFLAGS=--sysroot=${TARGET}
SOX=${PWD}/../resources/sox-14.4.1
cd build-sox
${SOX}/configure --prefix=${PREFIX}  --host=armv6l-unknown-linux-gnueabihf
#./configure --help
 
