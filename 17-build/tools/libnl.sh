#!/bin/bash
#-----------------------
#libnl
#(c) H.Buchmann FHNW 2015
#see EGLIBC.cross
#-----------------------
. $(dirname ${0})/config.sh
export CFLAGS="--sysroot=${TARGET_ROOT} -O2"
export CPPFLAGS="--sysroot=${TARGET_ROOT}"
export CC=${CROSS_COMPILE}gcc

cd libnl
${LIBNL_SRC}/configure --help
${LIBNL_SRC}/configure \
    --prefix=${TARGET_ROOT}/usr \
    --host=${TARGET}
${MAKE} 
${MAKE} install 
