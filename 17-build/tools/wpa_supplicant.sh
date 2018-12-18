#!/bin/bash
#---------------------------
#wpa_supplicant.sh
#(c) H.Buchmann FHNW 2017
# use install target too
#---------------------------
. $(dirname ${0})/common.sh
BUILD=${PWD}/wpa_supplicant

[[ ! -d ${BUILD} ]] && 
{
 mkdir ${BUILD}
 tar -xzf ${WPA_SUPPLICANT_SRC}.tar.gz --strip-components=1 -C ${BUILD}
}


cd ${BUILD}/wpa_supplicant
[[ ! -f .config ]] && 
 {
  WPA_CONFIG=defconfig
  if [[ -f  ${CONFIG}/wpa_supplicant.config ]]
   then WPA_CONFIG=${CONFIG}/wpa_supplicant.config
  fi
  cp ${WPA_CONFIG} .config ; 
 }
#MAKE=make

${MAKE} V=1 \
CC=${CROSS_COMPILE}gcc \
EXTRA_CFLAGS="--sysroot=${SYSROOT}" \
LDFLAGS="--sysroot=${SYSROOT}"  \
DESTDIR=${SYSROOT} \
LIBDIR=/lin \
BINDIR=/sbin \
INCDIR=/usr/include \
${@}

