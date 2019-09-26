#!/bin/bash
#---------------------------
#iw.sh
#(c) H.Buchmann FHNW 2017
#---------------------------
. $(dirname ${0})/config.sh
tar -xvf ${IW_SRC}.tar.xz --strip-components=1 -C .
cd $(basename ${IW_SRC})
export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
${MAKE}
${MAKE} PREFIX=${TARGET_ROOT}/usr install
