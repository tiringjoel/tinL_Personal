#!/bin/bash
#-------------------------
#binutils.sh
#(c) H.Buchmann FHNW 2015
#-------------------------
. scripts/common.sh  #load common
#-------------------- we are in build
[[ ! -d binutils ]] && mkdir binutils 
cd binutils

#uncomment for configure help
#${BINUTILS_SRC}/configure --help 

${BINUTILS_SRC}/configure \
 --prefix=${TC_PREFIX} \
 --target=${TARGET} \
 --without-libiberty \
 --with-sysroot=${TARGET_ROOT} \
 --disable-libiberfty \
 --disable-nls \
 --disable-werror

${MAKE} 
${MAKE} install
