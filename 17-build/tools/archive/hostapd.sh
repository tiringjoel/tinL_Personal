#!/bin/bash
#---------------------------
#hostapd.sh
#(c) H.Buchmann FHNW 2017
# use install target too
#---------------------------
. $(dirname ${0})/common.sh
HOSTAPD=$(basename ${HOSTAPD_SRC})
[[ ! -d ${HOSTAPD} ]] && { tar -xf ${HOSTAPD_SRC}.tar.gz -C . ; }
cd ${HOSTAPD}/hostapd
[[ ! -f .config ]] && 
 {
  HOSTAPD_CONFIG=defconfig
  if [[ -f  ${CONFIG}/hostapd.config ]]
   then HOSTAPD_CONFIG=${CONFIG}/hostapd.config
  fi
  cp ${HOSTAPD_CONFIG} .config ; 
 }

${MAKE} V=1 \
CC=${CROSS_COMPILE}gcc \
EXTRA_CFLAGS="--sysroot=${SYSROOT}" \
LDFLAGS="--sysroot=${SYSROOT}"  \
DESTDIR=${SYSROOT} \
LIBDIR=/lin \
BINDIR=/sbin \
INCDIR=/usr/include \
${@}

