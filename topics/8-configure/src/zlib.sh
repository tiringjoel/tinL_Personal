#--------------------
#rsync.sh
#(c) H.Buchmann FHNW 2014
#--------------------
#we are in 8-configure
#your work
PREFIX=${PWD}/work
TARGET=${PWD}/target-root
SRC=${PWD}/../resources/zlib-1.2.8
export CC=${PWD}/tc/bin/armv6l-unknown-linux-gnueabihf-gcc
export CFLAGS=--sysroot=${TARGET}

cd ${SRC}
./configure --prefix=${PREFIX}  

#./configure --help
 
