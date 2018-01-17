#!/bin/bash
#-------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/config.sh  #load common
#-------------------- we are in build
[[ ! -d binutils ]] && mkdir binutils 
cd binutils


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
