#!/bin/bash
#------------------------
#openconnect
#(c) H.Buchmann FHNW 2017
#------------------------
. $(dirname ${0})/common.sh
[[ ! -d openconnect ]] && mkdir openconnect

cd openconnect

${OPENCONNECT_SRC}/configure --help

export CC="${CROSS_COMPILE}gcc --sysroot=${SYSROOT}"
${OPENCONNECT_SRC}/configure \
--host=${TARGET} \
--prefix=/ \
--build=x86_64-unknown-linux-gnu \
--without-gnutls

MAKE=make
${MAKE} V=1
#${MAKE} install
