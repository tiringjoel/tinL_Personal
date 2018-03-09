#!/bin/bash
#-------------------------
#binutils-host.sh
#(c) H.Buchmann FHNW 2018
#-------------------------
. $(dirname ${0})/config.sh  #load common
#-------------------- we are in build
[[ ! -d binutils-host ]] && mkdir binutils-host 
cd binutils-host


${BINUTILS_SRC}/configure \
 --prefix=${TC} \
 --without-libiberty \
 --disable-libiberfty \
 --disable-nls \
 --disable-werror

${MAKE} 
${MAKE} install
