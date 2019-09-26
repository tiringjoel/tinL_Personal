#!/bin/bash
#---------------------------
#wpa_supplicant.sh
#(c) H.Buchmann FHNW 2017
# use install tarhet too
#---------------------------
. $(dirname ${0})/config.sh
#tar -xvf ${WPA_SUPPLICANT_SRC}.tar.gz --strip-components=1 -C .
cd wpa_supplicant

#[[ ! -f .config ]] && 
# {
#  WPA_CONFIG=defconfig
#  if [[ -f  ${CONFIG}/wpa_supplicant.config ]]
#   then WPA_CONFIG=${CONFIG}/wpa_supplicant.config
#  fi
#  cp ${WPA_CONFIG} .config ; 
# }
#MAKE=make

${MAKE} V=1 \
CC=${CROSS_COMPILE}gcc \
EXTRA_CFLAGS="--sysroot=${TARGET_ROOT}" \
LDFLAGS="--sysroot=${TARGET_ROOT}"  \
DESTDIR=${TARGET_ROOT} \
LIBDIR=/lin \
BINDIR=/sbin \
INCDIR=/usr/include \
${@}

