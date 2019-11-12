#!/bin/bash
#-------------------------------
#lighttpd.sh
#(c) H.Buchmann FHNW 2019
#-------------------------------
. $(dirname ${0})/config.sh


export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
export CXX="${CROSS_COMPILE}g++ --sysroot=${TARGET_ROOT}"
#${PCRE_SRC}/configure --help
#exit 0

${PCRE_SRC}/configure \
 --host=${TARGET} \
 --with-gnu-ld 

${MAKE}
${MAKE} install DESTDIR=${TARGET_ROOT}
