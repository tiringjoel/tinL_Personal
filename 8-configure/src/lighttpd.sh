#--------------------
#lighttpd.sh
#(c) H.Buchmann FHNW 2014
#--------------------
#we are in 8-configure
PREFIX=${PWD}/work
TARGET=${PWD}/target-root
LIGHTTPD=${PWD}/../resources/lighttpd-1.4.35/
export CC=${PWD}/tc/bin/armv6l-unknown-linux-gnueabihf-gcc
export CFLAGS=--sysroot=${TARGET}
cd lighttpd-build
${LIGHTTPD}/configure --prefix=${PREFIX}  --host=armv6l-unknown-linux-gnueabihf
#./configure --help
 
