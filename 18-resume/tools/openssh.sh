#!/bin/bash
#------------------------
#openssh
#(c) H.Buchmann FHNW 2018
# depends on zlib
#------------------------
. $(dirname ${0})/config.sh
[[ ! -d openssh ]] && mkdir openssh

cd openssh


export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
${OPENSSH_SRC}/configure \
--host=${TARGET} \
--prefix=/ \
--build=x86_64-unknown-linux-gnu \
--disable-strip \
--disable-option-checking \
--with-sandbox=seccomp_filter \
--without-stackprotect 

#remove check-config from makefile
${MAKE} 
${MAKE} install DESTDIR=${TARGET_ROOT}
