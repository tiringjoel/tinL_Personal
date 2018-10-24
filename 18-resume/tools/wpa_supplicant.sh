#!/bin/bash
#---------------------------
#wpa_supplicant.sh
#(c) H.Buchmann FHNW 2017
# use install tarhet too
#---------------------------
. $(dirname ${0})/config.sh
WPA_SUPPLICANT=$(basename ${WPA_SUPPLICANT_SRC})
echo ${PWD}


[[ ! -d ${WPA_SUPPLICANT} ]] && { tar -xf ${WPA_SUPPLICANT_SRC}.tar.gz -C . ; }
cd ${WPA_SUPPLICANT}/wpa_supplicant
[[ ! -f .config ]] && 
 {
  WPA_CONFIG=defconfig
  if [[ -f  ${CONFIG}/wpa_supplicant.config ]]
   then WPA_CONFIG=${CONFIG}/wpa_supplicant.config
  fi
  cp ${WPA_CONFIG} .config ; 
 }
##MAKE=make
#
${MAKE} V=1 \
CC=${CROSS_COMPILE}gcc \
EXTRA_CFLAGS="--sysroot=${TARGET_ROOT}" \
LDFLAGS="--sysroot=${TARGET_ROOT}"  \
DESTDIR=${TARGET_ROOT} \
LIBDIR=/lin \
BINDIR=/sbin \
INCDIR=/usr/include \
${@}

