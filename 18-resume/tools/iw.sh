#!/bin/bash
#---------------------------
#iw.sh
#(c) H.Buchmann FHNW 2017
#---------------------------
. $(dirname ${0})/config.sh

BUILD=${PWD}/$(basename ${IW_SRC})
[[ ! -d ${BUILD} ]] && 
{
 tar -xf ${IW_SRC}.tar.gz -C .
}
cd $(basename ${IW_SRC})
export CC="${CROSS_COMPILE}gcc --sysroot=${TARGET_ROOT}"
${MAKE}
${MAKE} PREFIX=${TARGET_ROOT}/usr install
