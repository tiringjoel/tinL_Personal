#!/bin/bash
#---------------------------
#iw.sh
#(c) H.Buchmann FHNW 2017
#---------------------------
. $(dirname ${0})/common.sh
[[ ! -d iw-4.9 ]] && 
{
 tar -xf ${IW_SRC}.tar.xz -C .
}

cd iw-4.9
export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
#${MAKE}
${MAKE} PREFIX=${SYSROOT}/usr install
