#!/bin/bash
#-----------------------
#musl
#(c) H.Buchmann FHNW 2017
#see EGLIBC.cross
#-----------------------
. $(dirname ${0})/common.sh  #load common
[[ ! -d musl ]] && { mkdir musl; }

export CFLAGS="--sysroot=${SYSROOT} -O2"
export CC=${TC_PREFIX}/bin/${TARGET}-gcc
PATH=${TC_PREFIX}/bin:${PATH}
cd musl
#${MUSL_SRC}/configure --help

#${MUSL_SRC}/configure \
#	--target=${TARGET} \
#	--prefix=/usr
#${MAKE} 
${MAKE} DESTDIR=${TARGET_ROOT} install
