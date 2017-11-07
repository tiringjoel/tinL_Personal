#!/bin/bash
#------------------------
#openvpn
#(c) H.Buchmann FHNW 2015
# depends on zlib
#------------------------
. $(dirname ${0})/common.sh
[[ ! -d openvpn ]] && mkdir openvpn

cd openvpn

#${OPENVPN_SRC}/configure --help
#exit 0

export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
${OPENVPN_SRC}/configure \
--host=${TARGET} \
--prefix=/ \
--build=x86_64-unknown-linux-gnu \
--disable-lzo  \
--disable-lz4 \
--disable-plugin-auth-pam

#remove check-config from makefile
${MAKE} 
${MAKE} install DESTDIR=${SYSROOT}
