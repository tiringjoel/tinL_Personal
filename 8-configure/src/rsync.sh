#--------------------
#rsync.sh
#(c) H.Buchmann FHNW 2014
#--------------------
#we are in 8-configure
BUILD=build-rsync
SRC=${PWD}/../resources/rsync-3.1.1
PREFIX=${PWD}/work
TARGET_ROOT=${PWD}/target-root
#if [[ ! -d ${BUILD} ]]
#  then mkdir ${BUILD}
#fi

export CC=${PWD}/tc/bin/armv6l-unknown-linux-gnueabihf-gcc
export CFLAGS=--sysroot=${TARGET_ROOT}

[[ ! -d ${BUILD} ]] && mkdir ${BUILD}
echo "absolute src-path='${SRC}'s"

cd ${BUILD}
${SRC}/configure --prefix=${PREFIX} --host=armv6l-unknown-linux-gnueabihf
#${SRC}/configure --help


 
