#!/bin/bash
#---------------------------
#zlib
#(c) H.Buchmann FHNW 2018
#---------------------------
. $(dirname ${0})/config.sh


tar -xvf ${ZLIB_SRC}.tar.gz --strip-components=1 -C .

export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
./configure \
--prefix=${TARGET_ROOT} \
--includedir=${TARGET_ROOT}/usr/include 

${MAKE}
${MAKE} install
