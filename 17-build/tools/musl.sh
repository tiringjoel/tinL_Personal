#!/bin/bash
#-----------------------
#musl
#(c) H.Buchmann FHNW 2017
#see EGLIBC.cross
#-----------------------
. $(dirname ${0})/common.sh  #load common
BUILD_DIR=musl

[[ ! -d ${BUILD_DIR} ]] && { mkdir ${BUILD_DIR}; }

export CFLAGS="--sysroot=${SYSROOT} -O2"
export CC=${TC_PREFIX}/bin/${TARGET}-gcc
PATH=${TC_PREFIX}/bin:${PATH}
cd ${BUILD_DIR}

#${MUSL_SRC}/configure --help
#exit 0

${MUSL_SRC}/configure \
       --target=${TARGET} \
       --prefix=/usr
${MAKE} 
${MAKE} DESTDIR=${TARGET_ROOT} install

#------------------ TODO adapt tools/gcc.sh
cd ${TARGET_ROOT}/lib
ln -sf /usr/lib/libc.so ld-linux-armhf.so.3
