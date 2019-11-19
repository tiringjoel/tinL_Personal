#!/bin/bash
#-----------------------
#musl
#(c) H.Buchmann FHNW 2019
#not yet working
#-----------------------
. $(dirname ${0})/config.sh  #load common

export CFLAGS="--sysroot=${SYSROOT} -O2"
export CC=${TC}/bin/${TARGET}-gcc
PATH=${TC}/bin:${PATH}

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
