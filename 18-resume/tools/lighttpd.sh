#!/bin/bash
#-------------------------------
#lighttpd.sh
#(c) H.Buchmann FHNW 2019
#-------------------------------
. $(dirname ${0})/config.sh


export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
#${LIGHTTPD_SRC}/configure --help

#exit 0

${LIGHTTPD_SRC}/configure \
 --host=${TARGET} \
 --without-bzip2 \
 --without-pcre 

${MAKE}

${MAKE} install DESTDIR=${TARGET_ROOT}
