#!/bin/bash
#-----------------------
#libnl
#(c) H.Buchmann FHNW 2015
#see EGLIBC.cross
#-----------------------
. $(dirname ${0})/common.sh
[[ ! -d libnl ]] && { mkdir libnl; }
export CFLAGS="--sysroot=${SYSROOT} -O2"
export CPPFLAGS="--sysroot=${SYSROOT}"
export CC=${TC_PREFIX}/bin/${TARGET}-gcc

cd libnl
#${LIBNL_SRC}/configure --help
${LIBNL_SRC}/configure \
    --prefix=${SYSROOT}/usr \
    --host=${TARGET}
${MAKE} 
${MAKE} install 
