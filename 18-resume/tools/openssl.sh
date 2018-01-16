#!/bin/bash
#------------------------
#openssl
#(c) H.Buchmann FHNW 2018
# depends on zlib
#------------------------
. $(dirname ${0})/config.sh


[[ ! -d openssl ]] &&
{
 mkdir openssl
 tar -xvf ${OPENSSL_SRC}.tar.gz --strip-components=1 -C openssl
}
cd openssl

export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
export AS=${CROSS_COMPILE}as
./Configure linux-elf no-asm shared --prefix=${TARGET_ROOT}/usr
${MAKE}
${MAKE} install
