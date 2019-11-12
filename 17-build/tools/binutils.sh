#!/bin/bash
#-------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/config.sh  #load common

${BINUTILS_SRC}/configure \
 --prefix=${TC} \
 --target=${TARGET} \
 --without-libiberty \
 --with-sysroot=${TARGET_ROOT} \
 --disable-libiberfty \
 --disable-nls \
 --disable-werror

${MAKE} 
${MAKE} install
