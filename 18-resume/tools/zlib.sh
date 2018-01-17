#!/bin/bash
#---------------------------
#zlib
#(c) H.Buchmann FHNW 2018
#---------------------------
. $(dirname ${0})/config.sh

[[ ! -f ${ZLIB_SRC}.tar.gz ]] &&
{
 echo "${ZLIB_SRC} target does not exist"
 exit 1
}


[[ ! -d zlib ]] && 
{
 mkdir zlib
 tar -xzvf ${ZLIB_SRC}.tar.gz --strip-components=1 -C zlib
}

cd zlib
export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
./configure \
--prefix=${TARGET_ROOT} \
--includedir=${TARGET_ROOT}/usr/include 

${MAKE}
${MAKE} install
