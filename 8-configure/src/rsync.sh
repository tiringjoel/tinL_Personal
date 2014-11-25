#--------------------
#rsync.sh
#(c) H.Buchmann FHNW 2014
#--------------------
#we are in 8-configure
PREFIX=${PWD}/work
TARGET=${PWD}/target-root
RSYNC=${PWD}/../resources/rsync-3.1.1/
export CC=${PWD}/tc/bin/armv6l-unknown-linux-gnueabihf-gcc
export CFLAGS=--sysroot=${TARGET}

cd build-rsync
${RSYNC}/configure --prefix=${PREFIX}  --host=armv6l-unknown-linux-gnueabihf
#./configure --help
 
