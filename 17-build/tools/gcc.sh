#!/bin/bash
#-----------------------
#gcc.sh build
#(c) H.Buchmann FHNW 2015
#gcc for kernel
#-----------------------
. $(dirname ${0})/common.sh
BUILD=${PWD}/gcc
#-------------------- we are in build
[[ ! -d ${BUID} ]] && mkdir ${BUILD}
cd ${BUILD}

#${GCC_SRC}/configure --help
#exit 0
${GCC_SRC}/configure \
 --prefix=${TC_PREFIX} \
 --with-gmp=${TC_PREFIX} \
 --with-mpfr=${TC_PREFIX} \
 --with-mpc-include=${TC_PREFIX}/include \
 --with-mpc-lib=${TC_PREFIX}/lib \
 --target=${TARGET} \
 --disable-nls \
 --disable-werror \
 --enable-threads \
 --enable-languages=c,c++\
 --with-sysroot=${TARGET_ROOT} \
 --disable-nls \
 --disable-libssp \
 --disable-lto \
 --enable-clocale=generic \
 --enable-shared \
 --disable-host-shared \
 --disable-multilib \
 --disable-libgomp \
 --disable-libmudflap \
 --with-float=hard \
 --with-arch=armv7-a \
 --with-fpu=vfpv3-d16 \
 CPP=/usr/bin/cpp

# --with-arch=armv7-a 

${MAKE}
${MAKE} install

