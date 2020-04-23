#!/bin/bash
#-------------------------------
#lighttpd.sh
#(c) H.Buchmann FHNW 2020
#create pem
# openssl req -x509 -newkey rsa:4096 -keyout key.pem -nodes -out cert.pem -days 365
#-------------------------------
. $(dirname ${0})/config.sh


export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
#${LIGHTTPD_SRC}/configure --help

#exit 0

${LIGHTTPD_SRC}/configure \
 --host=${TARGET} \
 --without-bzip2 \
 --without-pcre \
 --with-sysroot=${TARGET_ROOT} \
 --with-openssl="/usr/lib"
 

${MAKE}

${MAKE} install DESTDIR=${TARGET_ROOT}
